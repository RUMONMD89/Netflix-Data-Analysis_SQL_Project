# Netflix-Movie and TV shows Data-Analysis

<img src="netflix_titles.csv/netflix-logo.jpg">

環境設定：

Download PostgreSQL (Open source PostgreSQL packages and installers from EDB):
https://www.enterprisedb.com/downloads/postgres-postgresql-downloads

データセット：

- [Dataset Link: Netflix Movie & TV Show Dataset ](https://www.kaggle.com/datasets/shivamb/netflix-shows/dat)


概要：

本プロジェクトは、Netflixの映画やテレビ番組データをSQLを活用して分析し、データから有益なインサイトを抽出することを目的としています。また、さまざまなビジネス上の課題に対する答えを導き出すことも目指しています。  
このREADMEでは、プロジェクトの目的やビジネス課題、解決策、分析結果、そして得られた結論について、分かりやすく解説しています。

本プロジェクトでは、SQLのスキーマを使用して「Netflix」という名前のテーブルを作成します。その後、データセットのCSVファイルをインポートし、プロジェクトを進めていきます。

## Schema
```sql
CREATE TABLE Netflix
(
	show_id	varchar(12),
	type	varchar(15),
	title	varchar(150),
	director varchar(208),	
	casts	varchar(1000),
	country	 varchar(150),
	date_added	varchar(50),
	release_year	int,
	rating	varchar(15),
	duration varchar(15),
	listed_in  	varchar(100),
	description varchar(250)

);

```
# 課題:

Q1) Count the number of movies and TV shows.
```sql
select 
 type ,count(*) as total_content
from netflix
group by type;

```
Objective: Examine the count and ratio of movies to TV shows on Netflix.

Q2) Calculate the total number of movies and TV shows for each country, and also provide separate counts for movies and TV shows per country.

```sql
SELECT 
    country,
	COUNT(*)as total_Count,
    COUNT(CASE WHEN type = 'Movie' THEN 1 END) AS movie_count,
    COUNT(CASE WHEN type = 'TV Show' THEN 1 END) AS tv_show_count
FROM 
    Netflix
WHERE 
    country IS NOT NULL AND country != ''
GROUP BY 
    country
ORDER BY 
    movie_count DESC, tv_show_count DESC;
```
Objective: Analyze Netflix's content distribution by counting total movies and TV shows in each country.

Q3) Find the most common ratings for both movies and TV shows.
```sql
SELECT 
    rating,
    COUNT(CASE WHEN type = 'Movie' THEN 1 END) AS movie_count,
    COUNT(CASE WHEN type = 'TV Show' THEN 1 END) AS tv_show_count,
    COUNT(*) AS total_count
FROM 
    Netflix
WHERE 
    rating IS NOT NULL AND rating != ''
GROUP BY 
    rating
ORDER BY 
    total_count DESC
```
Q4)What are the top 10 most frequently listed genres (categories) for movies and TV shows?
```sql
SELECT 
    listed_in, COUNT(*) AS genre_count
FROM Netflix
GROUP BY listed_in
ORDER BY genre_count DESC
LIMIT 10;
```
Q5)What is the trend of movies and TV shows released over the years?
```sql
SELECT 
    release_year, 
    COUNT(CASE WHEN type = 'Movie' THEN 1 END) AS movie_count,
    COUNT(CASE WHEN type = 'TV Show' THEN 1 END) AS tv_show_count
FROM Netflix

GROUP BY release_year
ORDER BY release_year DESC;

```
Q6)Which year had the most content added to Netflix?
```sql
SELECT 
    date_added, COUNT(*) AS content_count
FROM Netflix
WHERE date_added IS NOT NULL
GROUP BY date_added
ORDER BY content_count DESC
LIMIT 10;

```

