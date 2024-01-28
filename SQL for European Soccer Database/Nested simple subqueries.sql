SELECT 
	-- Select the season and max goals scored in a match
	season,
    MAX(home_team_goal + away_team_goal) AS max_goals,
    -- Select the overall max goals scored in a match
   (SELECT MAX(home_team_goal + away_team_goal) FROM Match) AS overall_max_goals,
   -- Select the max number of goals scored in any match in July
   (SELECT MAX(home_team_goal + away_team_goal) 
    FROM Match
    WHERE id IN (
          SELECT id FROM Match WHERE EXTRACT(MONTH FROM date) = 07)) AS july_max_goals
FROM Match
GROUP BY season;