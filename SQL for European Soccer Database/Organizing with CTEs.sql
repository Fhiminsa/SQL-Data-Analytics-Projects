-- Set up your CTE
WITH match_list AS (
-- Select the league, date, home, and away goals
	SELECT 	
		l.name AS league,
		m.date,
		m.home_team_goal,
		m.away_team_goal,
		(m.home_team_goal + m.away_team_goal) AS total_goals
	FROM Match m
	LEFT JOIN League l 
	ON m.country_id = l.id)
-- Select the league, date, home, and away goals from the CTE
SELECT 
	league,
	date,
	home_team_goal,
	away_team_goal
FROM match_list
-- Filter by total goals
WHERE total_goals >=10;
		
	
	
	