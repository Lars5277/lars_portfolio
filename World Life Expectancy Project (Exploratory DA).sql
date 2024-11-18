-- World Life Expectancy Project (Exploratory DA)

Select *
From world_life_expectancy;

Select country, 
Min(`Life expectancy`), 
Max(`Life expectancy`),
Round(Max(`Life expectancy`) - Min(`Life expectancy`),1)  AS Life_15_Increase
From world_life_expectancy
Group By country
Having Min(`Life expectancy`) <> 0
And Max(`Life expectancy`) <> 0
Order BY Life_15_Increase Desc;

Select year, Round(AVG(`Life expectancy`),1)
From world_life_expectancy
Where  `Life expectancy` <> 0
And `Life expectancy` <> 0
Group by year
Order By year;

Select country, Round(Avg(`Life expectancy`),1) As life_exp,  Round(Avg(gdp),1) AS gdp
From world_life_expectancy
Group by country
Having  life_exp > 0
And gdp > 0
Order By gdp desc
;

Select country, Round(Avg(`Life expectancy`),1) As life_exp,  Round(Avg(gdp),1) AS gdp
From world_life_expectancy
Group by country
Having  life_exp > 0
And gdp > 0
Order By gdp desc
;

Select 
SUM(Case When GDP >= 1500 Then 1 Else 0 End) High_gdp_count,
AVG(Case When GDP >= 1500 Then `Life expectancy` Else Null End) High_gdp_life_exp,
SUM(Case When GDP <= 1500 Then 1 Else 0 End) low_gdp_count,
AVG(Case When GDP <= 1500 Then `Life expectancy` Else Null End) low_gdp_life_exp
From world_life_expectancy
;

Select Status, Round(Avg(`Life expectancy`),1)
From world_life_expectancy
Group By Status;

Select Status, Count(Distinct Country), Round(Avg(`Life expectancy`),1)
From world_life_expectancy
Group By Status;

Select Country, BMI, Round(Avg(`Life expectancy`),1)
From world_life_expectancy
Group By Status;

Select country, Round(Avg(`Life expectancy`),1) As life_exp,  Round(Avg(bmi),1) AS bmi
From world_life_expectancy
Group by country
Having  life_exp > 0
And bmi > 0
Order By bmi desc
;

Select Country,
Year,
`Life expectancy`,
`Adult Mortality`,
Sum(`Adult Mortality`) Over(Partition By country Order by year) As Rolling_total
From world_life_expectancy
Where country Like '%United%';
















