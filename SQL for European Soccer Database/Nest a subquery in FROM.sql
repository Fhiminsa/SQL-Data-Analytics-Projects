SELECT 
	c.name AS country,
	-- Calculate the average matches per season
	AVG(outer_subq.matches) AS avg_seasonal_high_scores	
FROM Country c 
-- Left join outer_s to country
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
	-- Close parentheses and alias the subquery
	GROUP BY country_id,season) AS outer_subq
ON c.id = outer_subq.country_id
GROUP BY country;