-- Use the following table to answer the questions from the quiz

-- +--------------+-------------+---------+------------+-------------+
-- | name         | region      | area    | population | gdp         |
-- +--------------+-------------+---------+------------+-------------+
-- | Afghaninstan | South Asia  | 652225  | 26000000   |             |
-- | Albania      | Europe      | 28728   | 3200000    | 6656000000  |
-- | Algeria      | Middle East | 2400000 | 32900000   | 75012000000 |
-- | Andorra      | Europe      | 468     | 64000      |             |
-- | ...                                                             |
-- +--------------+-------------+---------+------------+-------------+




-- Problem 1: Select the code which produces this table
-- +-------------+------------+
-- | name        | population |
-- +-------------+------------+
-- | Bahrain     | 1234571    |
-- | Swaziland   | 1220000    |
-- | Timor-Leste | 1066409    |
-- +-------------+------------+

-- Solution:
SELECT name, population
FROM world
WHERE population BETWEEN 1000000 AND 1250000


-- Problem 2: Pick the result you would obtain from this code
       SELECT name, population
       FROM world
       WHERE name LIKE "Al%"

-- Solution:
-- +---------+----------+
-- | Albania | 3200000  |
-- | Algeria | 32900000 |
-- +---------+----------+


-- Problem 3: Select the code which shows the countries that end in A or L

-- Solution: 
SELECT name FROM world
WHERE name LIKE '%a' OR name LIKE '%l'


-- Problem 4: 4. Pick the result from the query
        SELECT name,length(name)
        FROM world
        WHERE length(name)=5 and region='Europe'

-- Solution: 
-- +-------+--------------+
-- | name  | length(name) |
-- +-------+--------------+
-- | Italy | 5            |
-- | Malta | 5            |
-- | Spain | 5            |
-- +-------+--------------+


-- Problem 5: Pick the result you would obtain from this code:
SELECT name, area*2 FROM world WHERE population = 64000

-- Solution:
-- +---------+-----+
-- | Andorra | 936 |
-- +---------+-----+


-- Problem 6: Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000

-- Solution:
SELECT name, area, population
FROM world
WHERE area > 50000 AND population < 10000000


-- Problem 7: Select the code that shows the population density of China, Australia, Nigeria and France

-- Solution: 
SELECT name, population/area
FROM world
WHERE name IN ('China', 'Nigeria', 'France', 'Australia')