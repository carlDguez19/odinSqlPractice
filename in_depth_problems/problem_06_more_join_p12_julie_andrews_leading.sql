-- Problem: More join; problem 12

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

-- Problem Summary:
-- This problem is asking to find all the movies Julie Andrews acted in, and who the leading actor was for each of those movies.
-- We first need to find the movieid of all the movies Julie Andrews appeared in. After finding all those movieid's, we find the lead actor(ord=1)
-- of each of those movies.

-- Explanation:
-- 1. In the subquery we will return the movieid's by joining casting table and actor table and finding all the movies Julie Andrews was in.
-- 2. The outer query, since we are looking for movie titles and actor names, we join the movie table to the casting table.
-- 3. The casting table is then joined to the actor table.
-- 4. Filter results by the movie.id that the subquery returned and where the actor is the leading actor(ord=1)

-- Final Query:
SELECT movie.title, actor.name FROM movie
JOIN casting ON (movie.id = casting.movieid)
JOIN actor ON (casting.actorid = actor.id)
WHERE movie.id IN(SELECT movieid FROM casting
JOIN actor ON actor.id = casting.actorid
WHERE actor.name = 'Julie Andrews')
AND ord =1