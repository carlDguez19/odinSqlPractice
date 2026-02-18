-- Use the following tables to answer the questions

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





-- Exercise 1: Show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

-- Solution:
SELECT matchid, player FROM goal 
WHERE teamid = 'GER'


-- Exercise 2: Show id, stadium, team1, team2 for just game 1012

-- Solution:
SELECT id,stadium,team1,team2
FROM game
WHERE id = 1012


-- Exercise 3: Show the player, teamid, stadium and mdate for every German goal.

-- Solution:
SELECT player, teamid, stadium, mdate
FROM game JOIN goal ON (id=matchid)
WHERE teamid = 'GER'


-- Exercise 4: Show the team1, team2 and player for every goal scored by a player called Mario | player LIKE 'Mario%'

-- Solution:
SELECT team1, team2, player
FROM game JOIN goal ON (game.id = goal.matchid)
WHERE player LIKE 'Mario%'


-- Exercise 5: Show player, teamid, coach, gtime for all goals scored in the first 10 minutes | gtime<=10

-- Solution:
SELECT player, teamid, coach, gtime
FROM goal JOIN eteam ON(goal.teamid = eteam.id)
WHERE gtime<=10


-- Exercise 6: List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

-- Solution:
SELECT mdate, teamname
FROM game JOIN eteam ON(game.team1=eteam.id)
WHERE coach = 'Fernando Santos'


--Exercise 7: List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'

-- Solution:
SELECT player FROM goal
JOIN game ON(goal.matchid=game.id)
WHERE stadium = 'National Stadium, Warsaw'


-- Exercise 8: Instead show the name of all players who scored a goal against Germany.

-- Solution:
SELECT DISTINCT player
FROM game JOIN goal ON matchid = id 
WHERE goal.teamid <> 'GER'
AND (team1 = 'GER' OR team2 = 'GER')


-- Exercise 9: Show teamname and the total number of goals scored.

-- Solution:
SELECT teamname, count(teamname)
FROM eteam JOIN goal ON id=teamid
GROUP BY teamname


-- Exercise 10: Show the stadium and the number of goals scored in each stadium

-- Solution:
SELECT stadium, COUNT(matchid) FROM game
JOIN goal ON(game.id=goal.matchid)
GROUP BY stadium


-- Exercise 11: For every match involving 'POL', show the matchid, date and the number of goals scored.

-- Solution:
SELECT game.id,mdate, COUNT(matchid)
FROM game JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY game.id, game.mdate


-- Exercise 12: For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'

-- Solution:
SELECT matchid, mdate, count(matchid)
FROM game JOIN goal ON matchid = id
WHERE teamid = 'GER'
GROUP BY goal.matchid, game.mdate


-- Exercise 13: List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
-- +--------------+-------+---------+-------+--------+
-- | mdate        | team1 | score 1 | team2 | score2 |
-- +--------------+-------+---------+-------+--------+
-- | 1 July 2012  | ESP   | 4       | ITA   | 0      |
-- | 10 June 2012 | ESP   | 1       | ITA   | 1      |
-- | 10 June 2012 | IRL   | 1       | CRO   | 3      |
-- | ...                                             |
-- +--------------+-------+---------+-------+--------+

-- Solution:
SELECT mdate,
team1,
SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1,
team2,
SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) as score2
FROM game LEFT JOIN goal ON matchid = id
GROUP BY mdate, team1, team2, game.id
ORDER BY mdate, game.id, team1, team2