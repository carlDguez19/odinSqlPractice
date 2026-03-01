-- Use the following tables to answer the questions

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




-- Problem 1: Select the code that would show it is possible to get from Craiglockhart to Haymarket

-- Solution:
SELECT DISTINCT a.name, b.name
FROM stops a JOIN route z ON a.id=z.stop
JOIN route y ON y.num = z.num
JOIN stops b ON y.stop=b.id
WHERE a.name='Craiglockhart' AND b.name ='Haymarket'


-- Problem 2: Select the code that shows the stops that are on route.num '2A' which can be reached with one bus from Haymarket?

-- Solution:
SELECT S2.id, S2.name, R2.company, R2.num
FROM stops S1, stops S2, route R1, route R2
WHERE S1.name='Haymarket' AND S1.id=R1.stop
AND R1.company=R2.company AND R1.num=R2.num
AND R2.stop=S2.id AND R2.num='2A'


-- Problem 3: Select the code that shows the services available from Tollcross?

-- Solution:
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Tollcross'