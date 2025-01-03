
CREATE TABLE Netflix
(
	show_id	varchar(6),
	type	varchar(10),
	title	varchar(150),
	director varchar(208),	
	casts	varchar(1000),
	country	 varchar(150),
	date_added	varchar(50),
	release_year	int,
	rating	varchar(10),
	duration varchar(15),
	listed_in  	varchar(100),
	description varchar(250)

);
select * from netflix;
select 
distinct listed_in
from netflix;

--Q1) count the number of movies vs tv shows using type column
select 
 type ,count(*) as total_content
from netflix
group by type;

--Q2) count the each by each totall ratiing of movie and tv shows 
select 
	 type, 
	 rating,
	 count(*),
	 --max(rating)
	 rank() over(partition by type order by count(*) desc) as ranking
from netflix
group by 1,2 

--Q3) let's check  the most common rating for movies and tv shows

select 
	type,
	rating
from 

(
	select 
		 type, 
		 rating,
		 count(*),
		 --max(rating)
		 rank() over(partition by type order by count(*) desc) as ranking
	from netflix
	group by 1,2 
) as sq1

where 
	ranking = 1;




