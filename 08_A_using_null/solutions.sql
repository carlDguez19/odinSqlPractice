-- Use the following tables to answer the questions from this section

-- Table: teacher
-- +-----+------+------------+-------+----------------+
-- | id  | dept | name       | phone | mobile         |
-- +-----+------+------------+-------+----------------+
-- | 101 | 1    | Shrivell   | 2753  | 07986 555 1234 |
-- | 102 | 1    | Throd      | 2754  | 07122 555 1920 |
-- | 103 | 1    | Splint     | 2293  |                |
-- | 104 |      | Spiregrain | 3287  |                |
-- | 105 | 2    | Cutflower  | 3212  | 07996 555 6574 |
-- | 106 |      | Deadyawn   | 3345  |                |
-- | ...                                              |
-- +-----+------+------------+-------+----------------+


-- Table: dept
-- +----+-------------+
-- | id | name        |
-- +----+-------------+
-- | 1  | Computing   |
-- | 2  | Design      |
-- | 3  | Engineering |
-- | ...              |
-- +----+-------------+




-- Exercise 1: List the teachers who have NULL for their department.

-- Solution:
SELECT name FROM teacher
WHERE dept IS NULL


-- Exercise 2: Note the INNER JOIN misses the teachers with no department and the departments with no teacher.
-- Use a different JOIN so that all teachers are listed.

-- Solution: 
SELECT teacher.name, dept.name
FROM teacher LEFT JOIN dept
ON (teacher.dept=dept.id)


-- Exercise 3: Use a different JOIN so that all departments are listed.

-- Solution:
SELECT teacher.name, dept.name
FROM teacher RIGHT JOIN dept
ON (teacher.dept=dept.id)


-- Exercise 4: Use COALESCE to print the mobile number. Use the number '07986 444 2266' if there is no number given. Show teacher name and mobile number or '07986 444 2266'

-- Solution:
SELECT name, COALESCE(mobile, '07986 444 2266') AS mobile
FROM teacher


-- Exercise 5: 