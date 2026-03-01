-- Problem: Select within select; problem 7

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
-- This problem is asking to find the largest country of each continent based on area.
-- Once we find this country, its asking for its name, its area, and the continent it belongs to.

-- Explanation:
-- 1. Outer query looks through each country in the table. one at a time
-- 2. For each country, the subquery looks at the continent of that country and finds the country with MAX area
-- 3. Outer query keeps the matching countries with that area.

-- Final Query:
SELECT continent, name, area FROM world AS x
WHERE area = (SELECT MAX(area) FROM world AS y
              WHERE y.continent=x.continent)