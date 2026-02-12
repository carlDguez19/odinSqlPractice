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




-- Exercise 1: Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.

-- Solution:
SELECT name FROM world
WHERE population >= 200000000


-- Exercise 2: Give the name and the per capita GDP for those countries with a population of at least 200 million.

-- Solution:
SELECT name, (gdp/population) AS PCGDP FROM world
WHERE population >= 200000000


-- Exercise 3: Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.

-- Solution:
SELECT name, (population/1000000) AS millPop
FROM world
WHERE continent = "South America"


-- Exercise 4: Show the name and population for France, Germany, Italy

-- Solution:
SELECT name, population FROM world
WHERE name IN ('France', 'Germany', 'Italy')


-- Exercise 5; Show the countries which have a name that includes the word 'United'

-- Solution:
SELECT name FROM world
WHERE name LIKE 'United%'


-- Exercise 6: Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
--Show the countries that are big by area or big by population. Show name, population and area.

-- Solution:
SELECT name, population, area FROM world
WHERE area > 3000000 OR population > 250000000


-- Exercise 7: Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

-- Solution:
SELECT name, population, area FROM world
WHERE area > 3000000 XOR population > 250000000


-- Exercise 8: Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.

-- Solution:
SELECT name, ROUND(population/1000000, 2), ROUND(gdp/1000000000, 2) FROM world
WHERE continent = 'South America'


-- Exercise 9: Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.

-- Solution:
SELECT name, ROUND(gdp/population, -3) FROM world
WHERE gdp >= 1000000000000


-- Exercise 10: Greece has capital Athens. Each of the strings 'Greece', and 'Athens' has 6 characters.
--Show the name and capital where the name and the capital have the same number of characters.

-- Solution:
SELECT name, capital
FROM world
WHERE length(name) = length(capital)


-- Exercise 11: Show the name and the capital where the first letters of each match. Don't include countries where the name and the capital are the same word.

-- Solution:
SELECT name, capital
FROM world
WHERE LEFT(name,1) = LEFT(capital, 1) AND name <> capital


-- Exercise 12: Find the country that has all the vowels and no spaces in its name.

-- Solution:
SELECT name
FROM world
WHERE name LIKE '%a%'
AND name like '%e%'
AND name like '%i%'
AND name like '%o%'
AND name like '%u%'
AND name NOT LIKE '% %'