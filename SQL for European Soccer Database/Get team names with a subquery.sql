SELECT 
	m.date,
	-- Get the home and away team names
	Hometeam,
	Awayteam,
	m.home_team_goal,
	m.away_team_goal
FROM Match m

-- Join the home subquery to the match table
LEFT JOIN (
	SELECT 
		m.id,
		t.team_long_name AS Hometeam
	FROM Match m
	LEFT JOIN Team t
	ON m.home_team_api_id = t.team_api_id) AS home
ON home.id = m.id

-- Join the away subquery to the match table
LEFT JOIN (
	SELECT 
		m.id,
		t.team_long_name AS Awayteam
	FROM Match m
	LEFT JOIN Team t
	-- Get the away team ID in the subquery
	ON m.away_team_api_id = t.team_api_id) AS away
ON away.id = m.id;