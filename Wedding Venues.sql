/* Using the wedding venue tables generated, doing some basic data analysis using SQL
Skills used: Aggregate functions, joins, window functions, Common Table Expressions (CTE’s), adding/updating columns, creating views */


/* Summarizing the numbers of wedding venue by style */

select 
vs.venue_style, count(v.id) as venue_count
from wedding.venues v
join wedding.venue_styles vs
on v.style_id = vs.style_id
group by venue_style
order by venue_count desc

/* Summarizing the numbers of wedding venue by location */
select 
vl.location_name, count(v.id) as venue_count
from wedding.venues v
join wedding.locations vl
on v.location_id = vl.location_id
group by vl.location_name
order by venue_count desc

/* Using the rollup function to get subtotals for downtown vs non-downtown venues
included average capacity sizes for each location as well
22 venues are downtown, 8 are not */

select 
vl.location_name, count(v.id) as venue_count, vl.downtown, round(avg(v.capacity))
from wedding.venues v
join wedding.locations vl
on v.location_id = vl.location_id
group by rollup(vl.downtown, vl.location_name)
order by venue_count desc


/* Quick comparison using common table expressions to give comparisons between downtown and non-downtown venues, as well as each individual venue vs the average
Sourced walk and transit scores for each location, as accessibility is a priority for out-of-town guests
Wide variety in transit scores for non-downtown, meaning that it can still be easy to get to one, such as in Riverside */
select 
location_name, 
walk_score,
downtown, 
round(avg(transit_score) over (partition by downtown))
from wedding.locations


/* add combined rank column */
ALTER TABLE wedding.venue_styles
ADD combined_rank integer;

/* checking to see new column was added, with NULL values, then updating the column with data */

select *
from wedding.venue_styles

UPDATE wedding.venue_styles
SET combined_rank = cristina_rank + steve_rank;




/* Partitioning venues by location, and then for each location, ranking each venue based on couple score 
Couple score is a score out of 3 based on subjective feelings about the venue (1 is “like”, whereas 3 is “love”)
Some locations only have 1-2 venues, but this provides useful insight for locations with more, such as the Entertainment District */

select 
vl.location_name, 
v.venue_name,
v.couple_score,
rank() over (partition by location_name order by couple_score desc)
from wedding.venues v
join wedding.locations vl
on v.location_id = vl.location_id




/* To help reduce this original list of 30 venues down to a short list of just 10 venues, ordering a view was created, based on a pecking order of priorities: couple score, combined style preferences, location transit score, than location walk score */

create view wedding.short_list as
select
v.venue_name,
v.couple_score,
vl.transit_score,
vl.walk_score,
vs.combined_rank
from wedding.venues v
join wedding.locations vl
on v.location_id = vl.location_id
join wedding.venue_styles vs
on v.style_id = vs.style_id
order by couple_score desc, combined_rank, transit_score desc, walk_score desc
LIMIT 10