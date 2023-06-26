--Task 2 Write a query to fetch members details with his year-wise records  
--This query should return member_name, year and numbers_of_tours that member did in that year. 
select
member.firstname as member_name,
tournament_entry.year as year,
count(*) as number_of_tours
from member
inner join tournament_entry on member.memberid=tournament_entry.memberid
group by member_name,year