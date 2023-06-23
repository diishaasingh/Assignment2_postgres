--Task1(Create a view to display members data in following format – 
--Membere id, member_name, join_date, membership_type, gender, coach_name, team_name )
create or replace view member_data as
select
    m.memberid as member_id,
	m.firstname as member_name,
	m.joindate as join_date,
	mt.type as membership_type,
	m.gender as gender,
	m.coachname as coach_name,
	t.teamname as team_name
from member m
join team t on t.teamid=m.teamid
join membertype mt on mt.id=m.membertypeid

select * from member_data

--Task 2 Write a query to fetch members details with his year-wise records  
--This query should return member_name, year and numbers_of_tours that member did in that year. 
select
member.firstname as member_name,
tournament_entry.year as year,
count(*) as number_of_tours
from member
inner join tournament_entry on member.memberid=tournament_entry.memberid
group by member_name,year

--task3
--Write a query fetch member details who have never participated in any of the tournament.  
--result should return member_name, member_ship_type, coach_name
select concat(member.firstname,' ',member.lastname) as name,
membertype.type as member_ship_type,
member.coachname as coach_name 
from member 
join tournament_entry on tournament_entry.memberid=member.memberid
join membertype on membertype.id=member.memberid
where tournament_entry.year=null

--task4(Create a view to display tournament –  
--tournament_id, tournament_name, country, year, number_of_participants   )
create or replace view display_tournament as
select
  t.tourid as tournament_id,
  t.name as tournament_name,
  t.country as country,
  te.year as year,
  count(*) as number_of_participants
from tournament t
join tournament_entry te on t.tourid=te.tourid
group by t.tourid,te.year

select * from display_tournament

--task5(Create a view which display’s team-wise information and statistics like -team_id, 
--team_name, number_of_team_members, membership_fees.Here, number_of_team_members 
--Count of members in that team membership_fess – Sum of membership fee of all the team members in 
--that team irrespective of membership_type. )

create or replace view team_wise_info as
select 
    t.teamid,
	t.teamname,
	count(*) as number_of_team_members,
	mt.fee as membership_fees
from member m
join team t on t.teamid=m.teamid
join membertype mt on mt.id=m.memberid
group by t.teamid,t.teamname,mt.fee

select * from team_wise_info

--task6(Create a view to display all the open tournaments in current year.this view should have columns like -  
--tournament_name, country_name, tour_type, year, number_of_participants.Here – year  should taken 
--as current year (current year in which the query is being executed, in future the year may change) for 
--filtering the data.)

create or replace view display_open_tournaments as
select
    t.name as tournament_name,
	t.country as country_name,
	t.tour_type as tour_type,
	te.year as year,
    count(*) as number_of_participants
from tournament t
join tournament_entry te on t.tourid=te.tourid
group by t.name,t.country,t.tour_type,te.year
order by year
select * from display_open_tournaments
--(doubt-how to set curret year)