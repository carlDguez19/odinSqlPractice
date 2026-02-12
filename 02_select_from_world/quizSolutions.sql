-- Use the following table to answer the questions from the quiz

-- +--------------+-------------+---------+------------+-------------+
-- | name         | continent   | area    | population | gdp         |
-- +--------------+-------------+---------+------------+-------------+
-- | Afghaninstan | South Asia  | 652225  | 26000000   |             |
-- | Albania      | Europe      | 28728   | 3200000    | 6656000000  |
-- | Algeria      | Middle East | 2400000 | 32900000   | 75012000000 |
-- | Andorra      | Europe      | 468     | 64000      |             |
-- | ...                                                             |
-- +--------------+-------------+---------+------------+-------------+




-- Problem 1: Select the code which gives the name of countries beginning with U

-- Solution:
SELECT name
FROM world
WHERE name LIKE 'U%'


-- Problem 2: Select the code which shows just the population of United Kingdom?

-- Solution:
SELECT population
FROM world
WHERE name = 'United Kingdom'


-- Problem 3: Select the answer which shows the problem with this SQL code - the intended result should be the continent of France
SELECT continent 
FROM world 
WHERE 'name' = 'France'

-- Solution:
-- 'name' should be name


-- Problem 4: Select the result that would be obtained from the following code:
SELECT name, population / 10 
FROM world 
WHERE population < 10000

-- Solution:
-- +-------+-----+
-- | Nauru | 990 |
-- +-------+-----+


-- Problem 5: Select the code which would reveal the name and population of countries in Europe and Asia

-- Solution:
SELECT name, population
FROM world
WHERE continent IN ('Europe', 'Asia')


-- Problem 6: Select the code which would give two rows

-- Solution:
SELECT name FROM world
WHERE name IN ('Cuba', 'Togo')


-- Problem 7: Select the result that would be obtained from this code:
SELECT name FROM world
WHERE continent = 'South America'
AND population > 40000000

-- Solution:
-- +----------+
-- | Brazil   |
-- | Colombia |
-- +----------+