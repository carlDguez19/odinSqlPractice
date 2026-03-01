-- Problem: Join; problem 11

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
-- This problem is asking to find all the continents where every country in that continent,
-- has a population <= 25000000. Once we find these continents, the query must return the name the countries
-- associated with each of these continents, the population of said country, and the continent itself.
-- The idea is that if we group everything by continent, we can then search for the MAX population of each continent.
-- If the MAX of the continent is <= 25 million then every country in that continent meets the requirement.

-- Explanation:
-- 1. Inner query will group the table by continents 
-- 2. It will check that the country with MAX population is <= 25000000 therefore each country in that continent meets the requirement
-- 3. Outer query will get the name, continent, and population of all countries whose continent appears in the inner query
-- 4. Using IN, it filters the outer rows based on qualifying continents returned by the subquery

-- Final Query:
SELECT name, continent, population FROM world
WHERE continent IN (SELECT continent FROM world
                    GROUP BY continent
                    HAVING MAX(population) <= 25000000)