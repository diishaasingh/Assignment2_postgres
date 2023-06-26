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