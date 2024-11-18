-- World Life Expectancy Project Data Cleaning

Select *
From world_life_expectancy;

Select country, year, Concat(Country, year), Count(Concat(Country, year)) 
From world_life_expectancy
Group by country, year, Concat(Country, year)
Having Count(Concat(Country, year)) > 1 ;

Select row_id
From(
	Select row_id, 
	Concat(Country, year),
	Row_Number() Over(Partition by Concat(Country, year) Order By Concat(Country, year)) AS row_num
	From world_life_expectancy) AS row_table
Where row_num > 1
;

Delete From world_life_expectancy
Where 
	Row_ID In(
		Select row_id
From(
	Select row_id, 
	Concat(Country, year),
	Row_Number() Over(Partition by Concat(Country, year) Order By Concat(Country, year)) AS row_num
	From world_life_expectancy) AS row_table
Where row_num > 1);

Select Distinct(status)
From world_life_expectancy
Where status <> '';

Select Distinct(status)
From world_life_expectancy
Where status = '';

Select distinct(country)
From world_life_expectancy
Where Status = 'Developing';

Update world_life_expectancy
Set status = 'Developing'
Where country In (Select distinct(country)
From world_life_expectancy
Where Status = 'Developing');

Update world_life_expectancy t1
Join world_life_expectancy t2
	On t1.country = t2.country
Set t1.status = 'Developing'
Where t1.status =  ''
And t2.status <> ''
And t2.status = 'Developing'
;

Update world_life_expectancy t1
Join world_life_expectancy t2
	On t1.country = t2.country
Set t1.status = 'Developed'
Where t1.status =  ''
And t2.status <> ''
And t2.status = 'Developed'
;

Select *
From world_life_expectancy
Where country = 'United States of America';

Select *
From world_life_expectancy
Where `Life expectancy` = '';

Select *
From world_life_expectancy;

Select country, year, `Life expectancy`
From world_life_expectancy
Where `Life expectancy` = '';

Select t1.country, t1.year, t1.`Life expectancy`, 
t2.country, t2.year, t2.`Life expectancy`,
t3.country, t3.year, t3.`Life expectancy`,
Round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
From world_life_expectancy t1
Join world_life_expectancy t2
	On t1.country =  t2.country 
    And t1.year = t2.year -1
Join world_life_expectancy t3
	On t1.Country = t3.Country
    And t1.Year = t3.Year +1
Where t1.`Life expectancy` = '';    

Update world_life_expectancy t1
Join world_life_expectancy t2
	On t1.country =  t2.country 
    And t1.year = t2.year -1
Join world_life_expectancy t3
	On t1.Country = t3.Country
    And t1.Year = t3.Year +1
Set t1.`Life expectancy` = Round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
Where t1.`Life expectancy` = ''
;

Select *
From world_life_expectancy;










