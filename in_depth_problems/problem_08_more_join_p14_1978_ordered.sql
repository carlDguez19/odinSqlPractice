-- Problem: More join; problem 14

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
-- | 10004   | 50      | 1   |
-- +----+--------------------+

-- Problem Summary:
-- List the films released in the year 1978 ordered by the number of actors in the cast, then by title.
-- This problem is asking to list films released in 1978 based on which movie had the most actors, then by title of each movie.
-- This requires to group everything by movie(title). We will count the actors in each movie. Then list each movie and the amount of actors
-- in each movie in desccending order.

-- Explanation:
-- 1. Join the movie and casting tables
-- 2. Filter all the 1978 movies
-- 3. Group by movie(title)
-- 4. Order by how many actors are in each movie in descending order, then by title of the movie

-- Final Query:
SELECT movie.title, COUNT(casting.actorid) FROM movie
JOIN casting ON (movie.id = casting.movieid)
WHERE yr = 1978
GROUP BY movie.title
ORDER BY COUNT(casting.actorid) DESC, movie.title