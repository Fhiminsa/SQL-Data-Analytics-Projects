'''
	Barcelona and Real Madrid have been rival teams for more than 80 years. 
	Matches between these two teams are given the name El Clásico (The Classic). 
	In this exercise, I will query a list of matches played between these two rivals
'''

SELECT 
	date,
	-- Identify the home team as Barcelona or Real Madrid
	CASE WHEN home_team_api_id = 8634 THEN 'FC Barcelona'
		ELSE 'Real Madrid' END AS Home,
	-- Identify the away team as Barcelona or Real Madrid
	CASE WHEN away_team_api_id = 8634 THEN 'FC Barcelona'
		ELSE 'Real Madrid' END AS Away,
	-- Identify all possible match outcomes
	CASE WHEN home_team_goal > away_team_goal AND home_team_api_id = 8634 THEN 'FC Barcelona Win'
		WHEN home_team_goal > away_team_goal AND home_team_api_id = 8633 THEN 'Real Madrid Win'
		WHEN home_team_goal < away_team_goal AND away_team_api_id = 8634 THEN 'FC Barcelona Win'
		WHEN home_team_goal < away_team_goal AND away_team_api_id = 8633 THEN 'Real Madrid Win'
		ELSE 'Tie' END AS Outcome
FROM Match
WHERE (away_team_api_id = 8634 OR home_team_api_id = 8634) AND (away_team_api_id = 8633 OR home_team_api_id = 8633);
	