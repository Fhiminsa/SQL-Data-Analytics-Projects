  '''
	Generate a list of matches won by Italy"s Bologna team! There are quite a few additional teams 
	in the two tables, so a key part of generating a usable query will be using CASE statement as 
	a filter in the WHERE clause.
  '''
 -- Select team_long_name and team_api_id from team
  SELECT 
  	team_long_name,
  	team_api_id
  FROM Team 
  -- Filter for team long name
  WHERE team_long_name = 'Bologna'
  
  
  SELECT 
  -- Select the season, date, home_goal, and away_goal columns
  	season,
  	date,
  	home_team_goal,
  	away_team_goal
  FROM Match
  WHERE 
  -- Exclude games not won by Bologna
  	CASE WHEN home_team_api_id = 9857 AND home_team_goal > away_team_goal THEN 'Bologna Win'
  		WHEN away_team_api_id = 9857 AND away_team_goal > home_team_goal THEN 'Bologna Win'
  		END IS NOT NULL;