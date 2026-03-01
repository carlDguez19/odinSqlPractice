-- Use the following tables to answer the questions from this section

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


-- Table: dept
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




-- Exercise 1: How many stops are in the database.

-- Solution:
SELECT COUNT(*) FROM stops


-- Exercise 2: Find the id value for the stop 'Craiglockhart'

-- Solution:
SELECT id FROM stops
WHERE name = 'Craiglockhart'


-- Exercise 3: Give the id and the name for the stops on the '4' 'LRT' service.

-- Solution:
SELECT stops.id, stops.name FROM stops
JOIN route ON (route.stop = stops.id)
WHERE route.num = '4' AND route.company = 'LRT'


-- Exercise 4: The query shown gives the number of routes that visit either London Road (149) or Craiglockhart (53).
-- Run the query and notice the two services that link these stops have a count of 2. Add a HAVING clause to restrict the output to these two routes.

-- Solution:
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2


-- Exercise 5: Execute the self join shown and observe that b.stop gives all the places you can get to from Craiglockhart, without changing routes.
-- Change the query so that it shows the services from Craiglockhart to London Road.

-- Solution:
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b
ON (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 AND b.stop=149


-- Exercise 6: The query shown is similar to the previous one, however by joining two copies of the stops table we can refer to stops by name rather than by number.
-- Change the query so that the services between 'Craiglockhart' and 'London Road' are shown. If you are tired of these places try 'Fairmilehead' against 'Tollcross'

-- Solution:
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='London Road'


-- Exercise 7: Give a list of all the services which connect stops 115 and 137 ('Haymarket' and 'Leith')

-- Solution:
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
WHERE a.stop=115 AND b.stop=137


-- Exercise 8: Give a list of the services which connect the stops 'Craiglockhart' and 'Tollcross'

-- Solution:
SELECT a.company, a.num
FROM route a JOIN route b ON
(a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
AND stopb.name='Tollcross'


-- Exercise 9: Give a distinct list of the stops which may be reached from 'Craiglockhart' by taking one bus, including 'Craiglockhart' itself, offered by the LRT company.
-- Include the company and bus no. of the relevant services.

-- Solution:
SELECT DISTINCT s2.name, r2.company, r2.num
FROM stops s1
JOIN route r1 ON s1.id = r1.stop
JOIN route r2 ON r1.company = r2.company AND
r1.num = r2.num
JOIN stops s2 ON r2.stop = s2.id
WHERE s1.name = 'Craiglockhart'
AND r1.company = 'LRT'


-- Exercise 10: Find the routes involving two buses that can go from Craiglockhart to Lochend.
-- Show the bus no. and company for the first bus, the name of the stop for the transfer,
-- and the bus no. and company for the second bus.

-- Solution:
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