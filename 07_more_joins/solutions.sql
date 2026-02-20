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




-- Exercise 1: List the films where the yr is 1962 and the budget is over 2000000 [Show id, title]

-- Solution:
SELECT id, title
FROM movie
WHERE yr=1962 AND budget > 2000000


-- Exercise 2: Give year of 'Citizen Kane'.

-- Solution:
SELECT yr FROM movie
WHERE title = 'Citizen Kane'


-- Exercise 3: List all of the Star Trek movies, include the id, title and yr (all of these movies start with the words Star Trek in the title). Order results by year.

-- Solution:
SELECT id, title, yr FROM movie
WHERE title LIKE 'Star Trek%'
ORDER BY yr


-- Exercise 4: What id number does the actor 'Glenn Close' have?

-- Solution:
SELECT id FROM actor
WHERE name = 'Glenn Close'


-- Exercise 5: What is the id of the 1942 film 'Casablanca'

-- Solution:
SELECT id FROM movie
WHERE title = 'Casablanca'
AND yr = 1942


-- Exercise 6: Obtain the cast list for 1942's 'Casablanca'.
-- Use movieid=11768, (or whatever value you got from the previous question)

-- Solution:
SELECT actor.name FROM actor
JOIN casting ON (actor.id = casting.actorid)
JOIN movie ON (casting.movieid = movie.id)
WHERE movie.id = 132689


-- Exercise 7: Obtain the cast list for the film 'Alien'

-- Solution:
SELECT actor.name FROM actor
JOIN casting ON (actor.id = casting.actorid)
JOIN movie ON (casting.movieid = movie.id)
WHERE movie.title = 'Alien'


-- Exercise 8: List the films in which 'Harrison Ford' has appeared

-- Solution:
SELECT title FROM movie
JOIN casting ON(movie.id = casting.movieid)
JOIN actor ON(casting.actorid = actor.id)
WHERE actor.name = 'Harrison Ford'


-- Exercise 9: List the films where 'Harrison Ford' has appeared - but not in the starring role.
-- [Note: the ord field of casting gives the position of the actor. If ord=1 then this actor is in the starring role]

-- Solution:
SELECT title FROM movie
JOIN casting ON(movie.id = casting.movieid)
JOIN actor ON(casting.actorid = actor.id)
WHERE actor.name = 'Harrison Ford' AND ord > 1


-- Exercise 10: List the films together with the leading star for all 1962 films.

-- Solution:
SELECT title, actor.name FROM movie
JOIN casting ON(movie.id = casting.movieid)
JOIN actor ON(casting.actorid = actor.id)
WHERE yr = 1962 AND ord = 1


-- Exercise 11; Which were the busiest years for 'Rock Hudson', 
-- show the year and the number of movies he made each year for any year in which he made more than 2 movies.

-- Solution:
SELECT yr,COUNT(title) FROM movie
JOIN casting ON(movie.id=movieid)
JOIN actor ON(actorid=actor.id)
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2


-- Exercise 12: List the film title and the leading actor for all of the films 'Julie Andrews' played in.

-- Solution:
SELECT title, actor.name FROM movie
JOIN casting ON (movie.id = casting.movieid)
JOIN actor ON (casting.actorid = actor.id)
WHERE movie.id IN(SELECT movieid FROM casting
WHERE actorid IN (
SELECT id FROM actor
WHERE name='Julie Andrews'))
AND ord =1


-- Exercise 13: Obtain a list, in alphabetical order, of actors who've had at least 15 starring roles.

-- Solution:
SELECT actor.name FROM actor
JOIN casting ON (actor.id = casting.actorid)
WHERE ord =1
GROUP BY actor.name
HAVING COUNT(*) >= 15
ORDER BY actor.name


-- Exercise 14: List the films released in the year 1978 ordered by the number of actors in the cast, then by title.

-- Solution:
SELECT title, COUNT(casting.actorid) FROM movie
JOIN casting ON (movie.id = casting.movieid)
WHERE yr = 1978
GROUP BY title
ORDER BY COUNT(casting.actorid) DESC, movie.title


-- Exercise 15: List all the people who have worked with 'Art Garfunkel'.

-- Solution:
SELECT DISTINCT actor.name FROM movie
JOIN casting ON (movie.id = casting.movieid)
JOIN actor ON (casting.actorid = actor.id)
WHERE movie.id IN(SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Art Garfunkel'))
AND actor.name <> 'Art Garfunkel'