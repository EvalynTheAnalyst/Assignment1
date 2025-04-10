--What is the total amount of debt owed by all countries in the dataset?
select 
	 (SUM(debt) / 1000000)::numeric(13,2) as Total_debt_in_millions
from "assignment".international_debt_with_missing_values;

--How many distinct countries are recorded in the dataset?
select 
	count(distinct country_name) as unique_countries 
from "assignment".international_debt_with_missing_values;

--What are the distinct types of debt indicators, and what do they represent?
select 
 	distinct indicator_name
 from "assignment".international_debt_with_missing_values;
--Which country has the highest total debt, and how much does it owe?
select 
	distinct(country_name),
	sum(debt) as total_debt
from 
	"assignment".international_debt_with_missing_values
group by country_name
order by sum(debt) desc;

	
--What is the average debt across different debt indicators?
select 
	 distinct indicator_name,
	 AVG(debt) as avg_indicator
from "assignment".international_debt_with_missing_values idwmv
group by indicator_name;
--Which country has made the highest amount of principal repayments?

select 
	distinct country_name,
	(sum(debt)/1000000) ::numeric(12,2) as highest_principles
from "assignment".international_debt_with_missing_values 
where indicator_name like '%Principal repayments%'  
group by distinct country_name
having (sum(debt)/1000000) ::numeric(12,2) >= 0
order by highest_principles desc;

select *
from "assignment".international_debt_with_missing_values; 

--What is the most common debt indicator across all countries?
select 
 distinct indicator_code,
 indicator_name,
 count(*)as Most_common
from "assignment".international_debt_with_missing_values
where indicator_name is not null
group by indicator_name ,indicator_code 
order by most_common desc;


--Identify any other key debt trends and summarize your findings.
select  *
from  "assignment".international_debt_with_missing_values;