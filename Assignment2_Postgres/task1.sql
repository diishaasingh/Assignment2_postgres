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