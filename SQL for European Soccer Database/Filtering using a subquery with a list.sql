SELECT 
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM Team 
-- Exclude all values from the subquery
WHERE team_api_id NOT IN
     (SELECT DISTINCT home_team_api_id  FROM Match);