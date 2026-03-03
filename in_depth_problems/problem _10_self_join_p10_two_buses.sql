-- Problem: Self join; problem 10

-- Table: stops
-- +-----+----------------+
-- | id  | name           |
-- +-----+----------------+
-- | 1   | Aberlady       |
-- | 2   | Abington       |
-- | 3   | Amisfield Park |
-- | 4   | Ancrum         |
-- | 5   | Armadale       |
-- | 6   | ASDA           |
-- | ...                  |
-- +-----+----------------+


-- Table: route
-- +---- +---------+-----+------+
-- | num | company | pos | stop |
-- +---- +---------+-----+------+
-- | 124 | SMT	   | 9	 | 1    |
-- | 100 | MAC	   | 6	 | 2    |
-- | 106 | SMT	   | 8	 | 3    |
-- | 29	 | LOW	   | 8   | 4    |
-- | 16	 | SMT	   | 8	 | 5    |
-- | ...                        |
-- +---- +---------+-----+------+

-- Problem Summary:
-- This problem is asking to list all the possible routes from from Craiglockhart to Lochend that involve two buses. The query needs to return the number and company
-- of each bus and the stop in the middle of both. This query is built by establishing the starting point, Craiglockhart by joining a stops(sC) and route(rC) tables.
-- Then it is joined to a route table(r1) to look for the first route. That is joined to a stops table(sX) to find the stop in the middle of the trip. This is then joined
-- to another route table(r2) to find the second part of the journey to Lochend. Finally, we join everything to a last set of stops(sL) and route(rL) tables to determine
-- Lochend as the ending point of the trip.

-- Explanation:
-- 1. Join a stops(sC) and route(rC) table to set Craiglockhart as the starting point
-- 2. Join tables from step 1 to another route(r1) table to find the first route of the trip
-- 3. Join everything we have so far to another stops(sX) table to determine the name of the stop in the middle of the trip
-- 4. Join everything from step 1 through 3 to another route(r2) table to determine the second route to take to get to Lochend
-- 5. Join everything to a last set of joined route(rL) and stops(sL) tables that are used to set Lochend as the ending point of the trip

-- Final Query:
SELECT DISTINCT
r1.num, r1.company,
sX.name,
r2.num, r2.company
FROM stops sC
JOIN route rC ON sC.id = rC.stop
JOIN route r1 ON rC.num = r1.num AND rC.company = r1.company
JOIN stops sX ON r1.stop = sX.id
JOIN route r2 ON sX.id = r2.stop
JOIN route rL ON r2.num = rL.num AND r2.company = rL.company
JOIN stops sL ON rL.stop = sL.id
WHERE sC.name = 'Craiglockhart' AND
sL.name = 'Lochend'
ORDER BY r1.num, sX.name, r2.num