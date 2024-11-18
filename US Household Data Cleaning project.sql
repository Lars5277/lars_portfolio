-- US Household Data Cleaning project


Select *
From us_household_income;

Select *
From us_household_income_statistics;

Alter Table us_household_income_statistics Rename Column `ï»¿id` To `id`;

Select Count(id)
From us_household_income;

Select Count(id)
From us_household_income_statistics;

Select Id, Count(id)
From us_household_income
Group By id
Having Count(id) > 1;


Select *
From (
Select row_id, 
id,
Row_number() Over (Partition by id order by id) dataone
From us_household_income
) duplicates
Where dataone > 1
;

Delete From us_household_income
Where row_id In (
	Select row_id
	From (
	Select row_id, 
	id,
	Row_number() Over(Partition by id order by id) as dataone
	From us_project.us_household_income
) duplicates
Where dataone > 1)
;

Select Distinct state_name 
From us_household_income
Group By state_name;

Update us_household_income
Set state_name = 'Georgia'
Where  state_name = 'georia';

Update us_household_income
Set state_name = 'Alabama'
Where  state_name = 'alabama';

Select Distinct State_ab 
From us_household_income
Group By state_ab;

Select *
From us_household_income
Where county = 'Autauga County'
Order by 1 ;

Update us_household_income
Set place = 'Autaugaville'
Where county =  'Autauga County'
And city = 'Vinemont';

Select type, count(type) 
From us_household_income
Group By type;

Update us_household_income
Set type = 'Borough'
Where type  = 'Boroughs';

Select Aland, awater
From us_household_income
Where (Awater = 0 Or Awater = '' Or Awater IS NULL)
And (Aland = 0 Or Aland = '' Or Aland IS NULL)
;


















