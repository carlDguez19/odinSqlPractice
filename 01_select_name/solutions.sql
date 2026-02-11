-- Use the following table to answer the questions

-- +--------------+-------------+
-- | name         | continent   |
-- +--------------+-------------+
-- | Afghaninstan | South Asia  |
-- | Albania      | Europe      |
-- | Algeria      | Middle East |
-- | Andorra      | Europe      |
-- | ...                        |
-- +--------------+-------------+




-- Problem 1: Find the country that start with Y

-- Solution:
SELECT name FROM world
WHERE name LIKE 'Y%'


-- Problem 2: Find the countries that end with y

-- Solution:
SELECT name FROM world
WHERE name LIKE '%y'


-- Problem 3: Find the countries that contain the letter x

-- Solution:
SELECT name FROM world
WHERE name LIKE '%x%'


-- Problem 4: Find the countries that end with land

-- Solution:
SELECT name FROM world
WHERE name LIKE '%land'


-- Problem 5: Find the countries that start with C and end with ia

-- Solution:
SELECT name FROM world
WHERE name LIKE 'C%ia'


-- Problem 6: Find the country that has oo in the name

-- Solution:
SELECT name FROM world
WHERE name LIKE '%oo%'


-- Problem 7: Find the countries that have three or more a in the name

-- Solution:
SELECT name FROM world
WHERE name LIKE '%a%a%a%'


-- Problem 8: Find the countries that have "t" as the second character.

-- Solution:
SELECT name FROM world
WHERE name LIKE '_t%'
ORDER BY name


-- Problem 9: Find the countries that have two "o" characters separated by two others.

-- Solution:
SELECT name FROM world
WHERE name LIKE '%O__O%'


-- Problem 10: Find the countries that have exactly four characters.

-- Solution: 
SELECT name FROM world
WHERE name LIKE '____'


-- Problem 11: The capital of Luxembourg is Luxembourg. Show all the countries where the capital is the same as the name of the country

-- Solution: 
SELECT name
FROM world w1
WHERE capital IN (SELECT name FROM world w2 WHERE w1.name = w2.capital)


-- Problem 12: The capital of Mexico is Mexico City. Show all the countries where the capital has the country together with the word "City".

-- Solution:
SELECT name
FROM world w1
WHERE capital IN (SELECT capital from world w2 where concat(w1.name, ' City') = w2.capital )


-- Problem 13: Find the capital and the name where the capital includes the name of the country.

-- Solution:
SELECT capital, name
FROM world
WHERE capital LIKE concat('%' , name , '%');


-- Problem 14: Find the capital and the name where the capital is an extension of name of the country.
--You should include Mexico City as it is longer than Mexico. You should not include Luxembourg as the capital is the same as the country.

-- Solution:
SELECT capital, name
FROM world
WHERE length(capital) > length(name) AND capital LIKE concat('%' , name , '%') ;


-- Problem 15: The capital of Monaco is Monaco-Ville: this is the name Monaco and the extension is -Ville.
--Show the name and the extension where the capital is a proper (non-empty) extension of name of the country.

-- Solution:
SELECT name, REPLACE(capital, name, '')
FROM world
WHERE length(capital) > length(name) AND capital LIKE concat('%' , name , '%') ;