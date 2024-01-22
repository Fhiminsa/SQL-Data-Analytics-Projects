SELECT 
	-- Select the stage and average goals from the subquery
	s.stage,
	ROUND(s.Avg_goals, 2) AS Avg_goals
FROM
	-- Select the stage and average goals in 2012/2013
	(SELECT 
		stage,
		AVG(home_team_goal + away_team_goal) AS Avg_goals
	FROM Match
	WHERE season = '2012/2013'
	GROUP BY stage) AS s
WHERE 
	-- Filter the main query using the subquery
	s.Avg_goals > (SELECT AVG(home_team_goal + away_team_goal)
					FROM Match
					WHERE season = '2012/2013');