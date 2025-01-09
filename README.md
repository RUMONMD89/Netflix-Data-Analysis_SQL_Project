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
Q2) Count the number of movies and TV shows per country and identify the countries with the most content.

```sql
SELECT 
    country, 
	count(*) as total_count
from netflix
where 
	country is not null and country !='' 
group by 
	country
order by 
	total_count desc;
```
