-- Use the following table to answer the questions from this section

-- +--------------+-------------+---------+------------+-------------+
-- | name         | region      | area    | population | gdp         |
-- +--------------+-------------+---------+------------+-------------+
-- | Afghaninstan | Asia        | 652225  | 26000000   |             |
-- | Albania      | Europe      | 28728   | 3200000    | 6656000000  |
-- | Algeria      | Africa      | 2400000 | 32900000   | 75012000000 |
-- | Andorra      | Europe      | 468     | 64000      |             |
-- | ...                                                             |
-- +--------------+-------------+---------+------------+-------------+




-- Problem 1: Select the statement that shows the sum of population of all countries in 'Europe'

-- Solution:
SELECT SUM(population) FROM bbc
WHERE region = 'Europe'


-- Problem 2: Select the statement that shows the number of countries with population smaller than 150000

-- Solution:
SELECT COUNT(name) FROM bbc
WHERE population < 150000


-- Problem 3: Select the list of core SQL aggregate functions

-- Solution:
AVG(), COUNT(), MAX(), MIN(), SUM()


-- Problem 4: Select the result that would be obtained from the following code:
SELECT region, SUM(area)
FROM bbc 
WHERE SUM(area) > 15000000 
GROUP BY region

-- Solution:
-- No result due to invalid use of the WHERE function


-- Problem 5: Select the statement that shows the average population of 'Poland', 'Germany' and 'Denmark'

-- Solution:
SELECT AVG(population) FROM bbc
WHERE name IN ('Poland', 'Germany', 'Denmark')


-- Problem 6: Select the statement that shows the medium population density of each region

-- Solution:
SELECT region, SUM(population)/SUM(area) AS density FROM bbc
GROUP BY region


-- Problem 7: Select the statement that shows the name and population density of the country with the largest population

-- Solution:
SELECT name, population/area AS density FROM bbc
WHERE population = (SELECT MAX(population) FROM bbc)


-- Problem 8: Pick the result that would be obtained from the following code:
SELECT region, SUM(area) 
FROM bbc 
GROUP BY region 
HAVING SUM(area)<= 20000000

-- Solution:
-- +---------------+----------+
-- | Americas      | 732240   |
-- | Middle East   | 13403102 |
-- | South America | 17740392 |
-- | South Asia    | 9437710  |
-- +---------------+----------+