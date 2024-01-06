SELECT
	c.name as country,
	-- Sum the total records in each season where the home team won
	SUM(CASE WHEN m.season = '2012/2013' AND m.home_team_goal > m.away_team_goal THEN 1 ELSE 0 END) AS matches_2012_2013,
	SUM(CASE WHEN m.season = '2013/2014' AND m.home_team_goal > m.away_team_goal THEN 1 ELSE 0 END) AS matches_2013_2014,
	SUM(CASE WHEN m.season = '2014/2015' AND m.home_team_goal > m.away_team_goal THEN 1 ELSE 0 END) AS matches_2014_2015,
	SUM(CASE WHEN m.season = '2015/2016' AND m.home_team_goal > m.away_team_goal THEN 1 ELSE 0 END) AS matches_2015_2016
FROM Country c 
LEFT JOIN "Match" m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY country;
	