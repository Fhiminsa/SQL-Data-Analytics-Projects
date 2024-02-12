SELECT 
	date,
	home_team_goal,
	away_team_goal,
    -- Create a running total and running average of home goals
    SUM(home_team_goal) OVER(ORDER BY date 
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_total,
    AVG(home_team_goal) OVER(ORDER BY date 
         ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS running_avg
FROM Match
WHERE 
	home_team_api_id = 9908 
	AND season = '2011/2012';