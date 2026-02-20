-- Use the following tables to answer the questions

-- Table: movie
-- +-------+-----------------------+------+----------+----------+-----------+
-- | id    | title                 | yr   | director | budget   | gross     |
-- +-------+-----------------------+------+----------+----------+-----------+
-- | 10003 | "Crocodile" Dundee II | 1988 | 38       | 15800000 | 239606210 |
-- | 10004 | 'Til There Was You    | 1997 | 49       | 10000000 | 351653213 |
-- | ...                                                                    |
-- +-------+-----------------------+------+----------+----------+-----------+


-- Table: actor
-- +----+--------------------+
-- | id | name               |
-- +----+--------------------+
-- | 20 | Paul Hogan         |
-- | 50 | Jeanne Tripplehorn |
-- +----+--------------------+


-- Table: casting
-- +---------+---------+-----+
-- | movieid | actorid | ord |
-- +---------+---------+-----+
-- | 10003   | 20      | 4   |
-- | 10004   |  50     | 1   |
-- +----+--------------------+




-- Problem 1: Select the statement which lists the unfortunate directors of the movies which have caused financial loses (gross < budget)

-- Solution:
SELECT name
FROM actor INNER JOIN movie ON actor.id = director
WHERE gross < budget


-- Problem 2: Select the correct example of JOINing three tables

-- Solution:
SELECT *
FROM actor JOIN casting ON actor.id = actorid
JOIN movie ON movie.id = movieid


-- Problem 3: Select the statement that shows the list of actors called 'John' by order of number of movies in which they acted

-- Solution:
SELECT name, COUNT(movieid)
FROM casting JOIN actor ON actorid=actor.id
WHERE name LIKE 'John %'
GROUP BY name ORDER BY 2 DESC


-- Problem 4: Select the result that would be obtained from the following code:
SELECT title 
FROM movie JOIN casting ON (movieid=movie.id)
JOIN actor ON (actorid=actor.id)
WHERE name='Paul Hogan' AND ord = 1

-- Solution:
-- +---------------------------------+
-- | "Crocodile" Dundee              |
-- | Crocodile Dundee in Los Angeles |
-- | Flipper                         |
-- | Lightning Jack                  |
-- +---------------------------------+


-- Problem 5: Select the statement that lists all the actors that starred in movies directed by Ridley Scott who has id 351

-- Solution:
SELECT name
FROM movie JOIN casting ON movie.id = movieid
JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351


-- Problem 6: There are two sensible ways to connect movie and actor. They are:

-- Solution:
-- 1. link the director column in movies with the primary key in actor
-- 2. connect the primary keys of movie and actor via the casting table


-- Problem 7: Select the result that would be obtained from the following code:
SELECT title, yr 
FROM movie, casting, actor 
WHERE name='Robert De Niro' AND movieid=movie.id AND actorid=actor.id AND ord = 3

-- Solution:
-- +----------------------+------+
-- | A Bronx Tale         | 1993 |
-- | Bang the Drum Slowly | 1973 |
-- | Limitless            | 2011 |
-- +----------------------+------+