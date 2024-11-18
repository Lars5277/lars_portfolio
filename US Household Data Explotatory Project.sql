-- US Household Data Explotatory Project

Select *
From us_household_income;

Select *
From us_household_income_statistics;

Select State_Name, Sum(aland), Sum(AWater)
From us_household_income
Group by state_name
Order by 3 Desc
Limit 10;

Select *
From us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
Where mean <> 0
;

Select *
From us_household_income_statistics;

Select u.state_name, county, type, `primary`, mean, median
From us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
Where mean <> 0
;

Select u.state_name, Round(avg(mean),1), Round(avg(median),1)
From us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
  Where mean <> 0  
Group by u.state_name
Order by 3 desc
;

Select type, Count(type), Round(avg(mean),1), Round(avg(median),1)
From us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
  Where mean <> 0  
Group by type
Order by 4 desc
;

Select *
From us_household_income
Where type = 'community';

Select type, Count(type), Round(avg(mean),1), Round(avg(median),1)
From us_household_income u
Inner Join us_household_income_statistics us
	On u.id = us.id
  Where mean <> 0  
Group by type
Having Count(type) > 100
Order by 4 desc
;


Select u.State_Name, city, round(avg(mean),1) AS amean
From us_household_income u
Join us_household_income_statistics us
	On u.id = us.id
Group BY u.state_name, city
Order by amean DESC
Limit 25
;


Select u.State_Name, city, round(avg(median),1) AS amed
From us_household_income u
Join us_household_income_statistics us
	On u.id = us.id
Group BY u.state_name, city
Order by amed 
;






