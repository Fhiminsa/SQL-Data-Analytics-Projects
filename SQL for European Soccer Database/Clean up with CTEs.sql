-- Set up CTE
WITH match_list AS (
		SELECT
			country_id,
			id
		FROM Match 
		WHERE (home_team_goal + away_team_goal) >= 10)
-- Select league and count of matches from the CTE
SELECT 
	l.name AS League,
	COUNT(match_list.id) AS matches
FROM League l 
-- Join the CTE to the league table
LEFT JOIN match_list
ON l.id = match_list.country_id
GROUP BY League