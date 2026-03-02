-- Problem: Join; problem 13

-- Table: game
-- +------+--------------+---------------------------+-------+-------+
-- | id   | mdate        | stadium                   | team1 | team2 |
-- +------+--------------+---------------------------+-------+-------+
-- | 1001 | 8 June 2012  | National Stadium, Warsaw  | POL   | GRE   |
-- | 1002 | 8 June 2012  | Stadion Miejski (Wroclaw) | RUS   | CZE   |
-- | 1003 | 12 June 2012 | Stadion Miejski (Wroclaw) | GRE   | CZE   |
-- | 1004 | 12 June 2012 | National Stadium, Warsaw  | POL   | RUS   |
-- | ...                                                             |
-- +------+--------------+---------------------------+-------+-------+


-- Table: goal
-- +---------+--------+----------------------+-------+
-- | matchid | teamid | player               | gtime |
-- +---------+--------+----------------------+-------+
-- | 1001    | POL    | Robert Lewandowski   | 17    |
-- | 1001    | GRE    | Dimitris Salpingidis | 51    |
-- | 1002    | RUS    | Alan Dzagoev         | 15    |
-- | 1002    | RUS    | Roman Pavlyuchenko	 | 82    |
-- | ...                                             |
-- +---------+--------+----------------------+-------+


-- Table: eteam
-- +-----+----------------+------------------+
-- | id  | teamname       | coach            |
-- +-----+----------------+------------------+
-- | POL | Poland         | Franciszek Smuda |
-- | RUS | Russia         | Dick Advocaat    |
-- | CZE | Czech Republic | Michal Bilek     |
-- | GRE | Greece         | Fernando Santos  |
-- | ...                                     |
-- +-----+----------------+------------------+

-- Problem Summary:
-- This problem is asking to list every match with the goals scored by each team, along with the date of each game.
-- Its stating that CASE WHEN will need to be used to give value to the goals. SUM will have to be used to add up
-- all the goals we gave out with CASE WHEN. Grouping by date will be necessary to be able to count the goals.

-- Explanation:
-- 1. Use LEFT JOIN to join game table(mdate, team1, team2) and goal table. LEFT JOIN includes games with 0 goals, if any.
-- 2. After we join the tables, if the team that scored the goal is team1 then award 1 else award 0. All of this using CASE WHEN.
-- 3. SUM the awarded points for goals
-- 4. Repeat step 2 and 3 but this time checking for team2
-- 5. Group the results by date, then by team1, team2, then game.id
-- 6. Then order everthing by date, id, team1, and team2

-- Final Query:
SELECT game.mdate,
game.team1,
SUM(CASE WHEN goal.teamid=game.team1 THEN 1 ELSE 0 END) as score1,
game.team2,
SUM(CASE WHEN goal.teamid=game.team2 THEN 1 ELSE 0 END) as score2
FROM game LEFT JOIN goal ON goal.matchid = game.id
GROUP BY game.mdate, game.team1, game.team2, game.id
ORDER BY game.mdate, game.id, game.team1, game.team2