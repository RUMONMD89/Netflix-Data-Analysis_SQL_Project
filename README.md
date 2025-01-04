# Netflix-Movie and TV shows Data-Analysis

<img src="netflix_titles.csv/netflix-logo.jpg">

環境設定：

Download PostgreSQL (Open source PostgreSQL packages and installers from EDB):
https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

データセット：

https://www.kaggle.com/datasets/shivamb/netflix-shows/dat

Schema

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
