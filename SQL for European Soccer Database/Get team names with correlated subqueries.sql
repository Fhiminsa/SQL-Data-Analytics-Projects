SELECT 
	m.date,
	(SELECT team_long_name
	FROM Team t
	WHERE  t.team_api_id = m.home_team_api_id) AS hometeam,
	-- Connect the team to the match table
	(SELECT team_long_name
	FROM Team t
	WHERE  t.team_api_id = m.away_team_api_id) AS awayteam,
	-- Select home and away goals
	m.home_team_goal,
	m.away_team_goal
FROM Match m 
	