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