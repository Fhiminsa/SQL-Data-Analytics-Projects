SELECT 
	id,
	date,
	season,
	home_team_goal,
	away_team_goal,
	
	CASE WHEN home_team_api_id = 8673 THEN 'Home'
		ELSE 'Away' END AS warsaw_location,
	
	AVG(home_team_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_homeavg,
	AVG(away_team_goal) OVER(PARTITION BY season, EXTRACT(MONTH FROM date)) AS season_mo_awayavg

FROM Match
WHERE home_team_api_id = 8673 OR away_team_api_id = 8673
ORDER BY (home_team_goal + away_team_goal) DESC;