SELECT 
	-- Select the date, home goals, and away goals scored
    date,
	home_team_goal,
	away_team_goal
FROM  Match
-- Filter for matches where total goals exceeds 3x the average
WHERE (home_team_goal + away_team_goal) >
       (SELECT 3 * AVG(home_team_goal + away_team_goal)
        FROM Match);