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