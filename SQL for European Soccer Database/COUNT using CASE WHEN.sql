SELECT 
	c.name AS country,
    -- Count matches in each of the 3 seasons
	Count(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
	Count(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014,
	Count(CASE WHEN m.season = '2014/2015' THEN m.id END) AS matches_2014_2015
FROM Country AS c
LEFT JOIN Match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY country;