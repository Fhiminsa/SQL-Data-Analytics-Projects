'''
 Barcelona is considered one of the strongest teams in Spain"s soccer league.
 In this exercise, we will be creating a list of matches in the 2008-2015 season where Barcelona was the home team.
'''

SELECT 
	-- Select the date of the match
	m.date,
	t.team_long_name AS opponent, 
	-- Identify home wins, losses, or ties
	CASE WHEN m.home_team_goal > m.away_team_goal THEN 'Barcelona Win'
		WHEN m.home_team_goal < m.away_team_goal THEN 'Barcelona Lose'
		ELSE 'Tie' END AS Outcome
FROM Match AS m
LEFT JOIN Team AS t
on m.away_team_api_id = t.team_api_id
WHERE m.home_team_api_id = 8634;