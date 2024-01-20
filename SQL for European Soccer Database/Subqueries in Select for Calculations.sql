SELECT 
	-- Select the league name and average goals scored
	l.name AS league,
	ROUND(AVG(m.home_team_goal + m.away_team_goal), 2) AS Avg_goals,
	-- Subtract the overall average from the league average
	ROUND(AVG(m.home_team_goal + m.away_team_goal) - (SELECT AVG(home_team_goal + away_team_goal)
	FROM Match
	WHERE season = '2013/2014'), 2) AS Diff
FROM League l
LEFT JOIN Match m
ON l.id = m.league_id
-- Only include 2013/2014 results
WHERE season = '2013/2014'
GROUP BY league;