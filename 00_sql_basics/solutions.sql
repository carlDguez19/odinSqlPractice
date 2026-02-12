-- Use the following table to answer the questions from this section

-- +--------------+-------------+---------+------------+-------------+
-- | name         | continent   | area    | population | gdp         |
-- +--------------+-------------+---------+------------+-------------+
-- | Afghaninstan | South Asia  | 652225  | 26000000   |             |
-- | Albania      | Europe      | 28728   | 3200000    | 6656000000  |
-- | Algeria      | Middle East | 2400000 | 32900000   | 75012000000 |
-- | Andorra      | Europe      | 468     | 64000      |             |
-- | ...                                                             |
-- +--------------+-------------+---------+------------+-------------+




-- Exercise 1: Show the population of Germany.

-- Solution:
SELECT population
FROM world
WHERE name = 'Germany'


-- Exercise 2: Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.

-- Solution:
SELECT name, population
FROM world
WHERE name IN ('Sweden', 'Norway', 'Denmark');


-- Exercise 3: Show the country and the area for countries with an area between 200,000 and 250,000.

-- Solution:
SELECT name, area
FROM world
WHERE area BETWEEN 200000 AND 250000