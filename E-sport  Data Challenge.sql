select * from Teams;
Select * from Players;
select * from matches; 
------------------------
Select player_name, salary
from Players
where salary > 100000;
----------------------------
select p.player_id, p.player_name, t.team_name
from Players p
join Teams t on p.team_id = t.team_id
where p.player_id = 3; 
----------------------------
Select t.team_name, count(p.player_name) as total_team_members
from players p 
Join Teams t on p.team_id = t.team_id
group by t.team_name;
----------------------------------------------------------------
select t.team_id, t.team_name, p.player_name as captain_name 
from teams t
Join players p on t.captain_id = p.player_id
where t.team_id = 2; 
----------------------------------------------------------------
select player_id, player_name, role 
from Players
where team_id = 1; 
------------------------------------------------------------------
select t.team_id, t.team_name, count(m.winner_id) as Num_of_matches_won 
from Teams t 
join Matches m on t.team_id = m.winner_id
group by t.team_name,m.winner_id; 
---------------------------------------------------------------------------
select t.team_name, avg(p.salary) as avg_salary
from Teams t 
join Players p on t.team_id = p.team_id 
where country = "USA"
group by t.team_name;
--------------------------------------------------------------------------
select t.team_id, t.team_name, count(m.winner_id) as Most_matches_won
from Teams t 
join Matches m on t.team_id = m.winner_id
group by t.team_name, m.winner_id
order by count(m.winner_id) DESC
Limit 1;
--------------------------------------------------------------------------
Select t.team_name, count(p.player_id) as Num_of_players 
from Teams t
join Players p on t.team_id = p.team_id 
where p.salary > 100000
group by t.team_name; 
---------------------------------------------------------------------------
Select match_id, match_date, (score_team1 + score_team2) as Match_score 
from Matches
where match_id = 3;
