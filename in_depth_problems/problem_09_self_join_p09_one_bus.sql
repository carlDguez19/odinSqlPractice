-- Problem: Self join; problem 9

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
-- This problem is asking to list all the stops that can be reached from Craiglockhart by taking one LRT bus, including Craiglockhart itself.
-- To solve this we will join the stops and route tables twice. Once to find all the LRT buses that service Craiglockhart, then again to find all stops served
-- by those same buses. We then report the stop name, company, and bus number.

-- Explanation:
-- 1. Join the stops(s1) and route(r1) tables first(this will serve to find LRT buses at Craiglockhart)
-- 2. Join tables from step 1 to another route(r2) table wherever the company(LRT) are the same
-- 3. Join everything we have so far to another stops(s2) table to determine the name of the stops once we fileter everything
-- 4. Filter by stating that out takeoff point or our initial stop is Craiglockhart and the company servicing this trip is LRT

-- Final Query:
SELECT DISTINCT s2.name, r2.company, r2.num
FROM stops s1
JOIN route r1 ON s1.id = r1.stop
JOIN route r2 ON r1.company = r2.company AND
r1.num = r2.num
JOIN stops s2 ON r2.stop = s2.id
WHERE s1.name = 'Craiglockhart'
AND r1.company = 'LRT'