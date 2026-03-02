-- Problem: More join; problem 13

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
-- This problem is asking to find all actors who have had at least 15 starring roles and to list them in alphabetical order.
-- For this a grouping by actor name is necessary. after this we count the number of ord=1(lead role) for each actor. If the count is 15
-- or more then we list the actor.

-- Explanation:
-- 1. Join the actor and casting tables
-- 2. Filter all the ord=1 roles for each actor
-- 3. Group by actor
-- 4. Actors with 15 leading roles or more(HAVING) pass the criteria
-- 5. Order these actors in alphabetical order 

-- Final Query:
SELECT actor.name FROM actor
JOIN casting ON (actor.id = casting.actorid)
WHERE ord =1
GROUP BY actor.name
HAVING COUNT(*) >= 15
ORDER BY actor.name