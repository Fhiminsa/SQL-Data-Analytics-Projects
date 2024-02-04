WITH home AS(
	SELECT 
		m.id,
		m.date,
		t.team_long_name AS hometeam,
		m.home_team_goal
	FROM Match AS m
	LEFT JOIN Team AS t
	ON m.home_team_api_id = t.team_api_id),
	-- Declare and set up the away CTE
	away AS(
	SELECT 
		m.id,
		m.date,
		t.team_long_name AS awayteam,
		m.away_team_goal
	FROM Match AS m
	LEFT JOIN Team AS t
	ON m.away_team_api_id = t.team_api_id)
	-- Select date, home_goal, and away_goal
SELECT 
	home.date,
	home.hometeam,
	away.awayteam,
	home.home_team_goal,
	away.away_team_goal
-- Join away and home on the id column
FROM home
INNER JOIN away
ON home.id = away.id
	