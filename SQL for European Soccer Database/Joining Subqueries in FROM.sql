SELECT 
-- Select country name and the count match IDs
	c.name as Country_name,
	COUNT(sub.id) as Matches
FROM Country as c
-- Inner join the subquery onto country
-- Select the country id and match id columns
INNER JOIN (SELECT 
				id,
				country_id
			FROM Match
			-- Filter the subquery by matches with 10+ goals
			WHERE 
				(home_team_goal + away_team_goal) >= 10) as sub
ON c.id = sub.country_id
GROUP BY Country_name 