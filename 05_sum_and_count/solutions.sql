-- Use the following table to answer the questions from this section

-- +--------------+-------------+---------+------------+-------------+
-- | name         | continent   | area    | population | gdp         |
-- +--------------+-------------+---------+------------+-------------+
-- | Afghaninstan | Asia        | 652225  | 26000000   |             |
-- | Albania      | Europe      | 28728   | 3200000    | 6656000000  |
-- | Algeria      | Africa      | 2400000 | 32900000   | 75012000000 |
-- | Andorra      | Europe      | 468     | 64000      |             |
-- | ...                                                             |
-- +--------------+-------------+---------+------------+-------------+




-- Exercise 1: Show the total population of the world

-- Solution:
SELECT SUM(population)
FROM world


-- Exercise 2: List all the continents - just once each.

-- Solution:
SELECT DISTINCT(continent)
FROM world


-- Exercise 3: Give the total GDP of Africa

-- Solution:
SELECT SUM(gdp) FROM world
WHERE continent = "Africa"


-- Exercise 4: How many countries have an area of at least 1000000

-- Solution:
SELECT COUNT(name) FROM world
WHERE area >= 1000000


-- Exercise 5: What is the total population of ('Estonia', 'Latvia', 'Lithuania')

-- Solution:
SELECT SUM(population) FROM world
WHERE name IN ('Estonia','Latvia','Lithuania')


-- Exercise 6: For each continent show the continent and number of countries.

-- Solution:
SELECT continent, COUNT(name) FROM world
GROUP BY continent


-- Exercise 7: For each continent show the continent and number of countries with populations of at least 10 million.

-- Solution:
SELECT continent, COUNT(name) FROM world
WHERE population >= 10000000
GROUP BY continent


-- Exercise 8: List the continents that have a total population of at least 100 million.

-- Solution:
SELECT continent FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000