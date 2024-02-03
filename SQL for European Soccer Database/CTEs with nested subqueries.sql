-- Set up your CTE
WITH match_list AS (
    SELECT 
  		country_id,
  	   (home_team_goal + away_team_goal) AS goals
    FROM Match
  	-- Create a list of match IDs to filter data in the CTE
    WHERE id IN (
       SELECT id
       FROM Match
       WHERE season = '2013/2014' AND EXTRACT(MONTH FROM date) = '08'))
-- Select the league name and average of goals in the CTE
SELECT 
	l.name,
    AVG(match_list.goals)
FROM League AS l
-- Join the CTE onto the league table
LEFT JOIN match_list ON l.id = match_list.country_id
GROUP BY l.name;

