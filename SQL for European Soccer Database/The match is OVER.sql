SELECT 
	m.id,
	c.name AS country,
	m.season,
	m.home_team_goal,
	m.away_team_goal,
	AVG(m.home_team_goal + m.away_team_goal) OVER() AS overall_avg
FROM Match m
LEFT JOIN Country c
ON m.country_id = c.id
	