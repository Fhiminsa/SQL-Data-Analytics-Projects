SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
	main.date,
	main.home_team_goal,
	main.away_team_goal
FROM Match AS main
WHERE 
	-- Filter the main query by the subquery
	(home_team_goal + away_team_goal) > 
		(SELECT AVG((home_team_goal + away_team_goal)*3)
		FROM Match sub
		-- Join the main query to the subquery in WHERE
		WHERE sub.country_id = main.country_id);