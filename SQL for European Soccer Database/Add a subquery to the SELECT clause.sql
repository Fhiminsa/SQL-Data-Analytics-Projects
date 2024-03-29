SELECT 
	l.name AS league,
    -- Select and round the league's total goals
    ROUND(AVG(m.home_team_goal + m.away_team_goal), 2) AS avg_goals,
    -- Select & round the average total goals for the season
    (SELECT ROUND(AVG(home_team_goal + away_team_goal), 2) 
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM League AS l
LEFT JOIN Match AS m
ON l.country_id = m.country_id
-- Filter for the 2013/2014 season
WHERE  season = '2013/2014'
GROUP BY league;