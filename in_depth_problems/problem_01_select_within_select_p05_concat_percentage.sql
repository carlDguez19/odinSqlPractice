-- Problem: Select within select; problem 5

-- Table: world
-- +--------------+-------------+---------+------------+-------------+
-- | name         | continent   | area    | population | gdp         |
-- +--------------+-------------+---------+------------+-------------+
-- | Afghaninstan | Asia        | 652225  | 26000000   |             |
-- | Albania      | Europe      | 28728   | 3200000    | 6656000000  |
-- | Algeria      | Africa      | 2400000 | 32900000   | 75012000000 |
-- | Andorra      | Europe      | 468     | 64000      |             |
-- | ...                                                             |
-- +--------------+-------------+---------+------------+-------------+

-- Problem Summary:
-- This problem starts with an explanation. It states that Germany, with a population of 80 million,
-- has the largest population of Europe. It states Austria, with a population of 8.5 million, has 11%
-- the population of Germany. The problem asks to find the name and population of each country in Europe,
-- as a percentage of the population of Germany.

-- Explanation:
-- 1. find the population of Germany through its own query
-- 2. get the population of the current country and multiply it by 100
-- 3. take the answer from step2 and divide it by the answer from step 1, all inside ROUND
-- 4. CONCAT the answer from step 3 with the '%' symbol
-- 5. Find this, and the name of every country where continent = 'Europe'

-- Final Query:
SELECT name, CONCAT(ROUND((population * 100/(SELECT population
                                             FROM world WHERE name = 'Germany'))), '%') AS percentage
FROM world WHERE continent = 'Europe'