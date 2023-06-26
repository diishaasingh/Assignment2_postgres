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