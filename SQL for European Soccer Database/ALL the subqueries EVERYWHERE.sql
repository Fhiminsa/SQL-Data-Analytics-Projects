SELECT 
	-- Select the stage and average goals for each stage
	m.stage,
    ROUND(AVG(m.home_team_goal + m.away_team_goal),2) AS avg_goals,
    -- Select the average overall goals for the 2012/2013 season
    ROUND((SELECT AVG(home_team_goal + away_team_goal) 
           FROM Match 
           WHERE season = '2012/2013'),2) AS overall
FROM Match AS m
-- Filter for the 2012/2013 season
WHERE season = '2012/2013'
-- Group by stage
GROUP BY m.stage;