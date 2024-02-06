SELECT 	
	-- Select the league name and average goals scored
	l.name AS league,
	AVG(m.home_team_goal + m.away_team_goal) AS AVG_goals,
	-- Rank each league according to the average goalsv
	RANK() OVER(ORDER BY AVG(home_team_goal + away_team_goal)) AS league_rank
FROM League l
LEFT JOIN Match m
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY league
-- Order the query by the rank you createdv
ORDER BY league_rank;