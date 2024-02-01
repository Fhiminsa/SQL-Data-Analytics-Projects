SELECT 
	c.name AS country,
	
	AVG(outer_subq.matches) AS avg_seasonal_high_scores	
FROM Country c 
LEFT JOIN (
	SELECT 
		country_id,
		season,
		COUNT(id) AS matches
	FROM
		(SELECT 
			country_id,
			season,
			id
		FROM MATCH
		WHERE home_team_goal>=5 OR away_team_goal<=5) AS inner_subq
	GROUP BY country_id,season) AS outer_subq
ON c.id = outer_subq.country_id
GROUP BY country;