-- Problem: Select within select; problem 9

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
-- This problem is asking to find all the continents where every country in that continent,
-- has a population <= 25000000. Once we find these continents, the query must return the name the countries
-- associated with each of these continents, the population of said country, and the continent itself.
-- The idea is that if we group everything by continent, we can then search for the MAX population of each continent.
-- If the MAX of the continent is <= 25 million then every country in that continent meets the requirement.

-- Explanation:
-- 1. Inner query will group the table by continents 
-- 2. It will check that the country with MAX population is <= 25000000 therefore each country in that continent meets the requirement
-- 3. Outer query will get the name, continent, and population of all countries whose continent appears in the inner query
-- 4. Using IN, it filters the outer rows based on qualifying continents returned by the subquery

-- Final Query:
SELECT name, continent, population FROM world
WHERE continent IN (SELECT continent FROM world
                    GROUP BY continent
                    HAVING MAX(population) <= 25000000)