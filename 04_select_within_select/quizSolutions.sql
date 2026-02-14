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




-- Problem 1: Select the code that shows the name, region and population of the smallest country in each region

-- Solution:
 SELECT region, name, population FROM bbc x 
 WHERE population <= ALL (SELECT population FROM bbc y 
                          WHERE y.region=x.region AND population>0)


-- Problem 2: Select the code that shows the countries belonging to regions with all populations over 50000

-- Solution:
SELECT name,region,population FROM bbc x 
WHERE 50000 < ALL (SELECT population FROM bbc y 
                   WHERE x.region=y.region AND y.population>0)


-- Problem 3: Select the code that shows the countries with a less than a third of the population of the countries around it

-- Solution:
SELECT name, region FROM bbc x
WHERE population < ALL (SELECT population/3 FROM bbc y 
                        WHERE y.region = x.region AND y.name != x.name)


-- Problem 4: Select the result that would be obtained from the following code:
SELECT name FROM bbc
WHERE population >
       (SELECT population
          FROM bbc
         WHERE name='United Kingdom')
AND region IN
       (SELECT region
          FROM bbc
         WHERE name = 'United Kingdom')

-- Solution:
-- +---------+
-- | France  |
-- | Germany |
-- | Russia  |
-- | Turkey  |
-- +---------+


-- Problem 5: Select the code that would show the countries with a greater GDP than any country in Africa (some countries may have NULL gdp values).

-- Solution:
SELECT name FROM bbc
WHERE gdp > (SELECT MAX(gdp) FROM bbc 
             WHERE region = 'Africa')


-- Problem 6: Select the code that shows the countries with population smaller than Russia but bigger than Denmark

-- Solution:
SELECT name FROM bbc
WHERE population < (SELECT population FROM bbc WHERE name='Russia')
AND population > (SELECT population FROM bbc WHERE name='Denmark')


-- Problem 7: Select the result that would be obtained from the following code:
SELECT name FROM bbc
WHERE population > ALL (SELECT MAX(population)
                        FROM bbc
                        WHERE region = 'Europe')
AND region = 'South Asia'

-- Solution:
-- +------------+
-- | Bangladesh |
-- | India      |
-- | Pakistan   |
-- +------------+