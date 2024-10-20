create database sqlproj

use sqlproj

select * from hr_data;

-- Overall attrition happened in my company
select count(*) as total_employes, count(case when attrition = 1 then 1 end) as attrition_count
from hr_data;

-- Present of relation between overtime and attrition
select overtime, count(*) as total_employees
from hr_data
where Attrition = 1
group by OverTime;

--Present of relation of rating and attrition -- There is a negative relation bw rating and attrition
select performancerating, count(*) as attrition_count
from hr_data
where attrition = 1
group by PerformanceRating;

-- Attrition based on the job roles (required - department column, job role, count of attrition and count should be in desc)
select Department, jobrole, count(*) as attrition_count
from hr_data 
where attrition = 1
group by Department, JobRole
order by attrition_count desc;

-- Attrition based on the age buckets
-- age buckets - 18-29, 30-39, 40-49, 50-59, older than 60
select case when age <= 29 then '18-29'
when age >= 30 and age <= 39 then '30-39'
when age >= 40 and age <= 49 then '40-49'
when age >= 50 and age <= 59 then '50-59'
else '60 or above'
end as 'age_range', count(*) as attrition_count
from hr_data
where Attrition = 1
group by case when age <= 29 then '18-29'
when age >= 30 and age <= 39 then '30-39'
when age >= 40 and age <= 49 then '40-49'
when age >= 50 and age <= 59 then '50-59'
else '60 or above'
end
order by Attrition_count desc ;

-- Relation between salary and attrition
select percentsalaryhike, count(*) as attrition_count
from hr_data
where Attrition = 1
group by PercentSalaryHike
order by attrition_count desc;

-- relation between the environment . relationship satisfaction with attrtion

select EnvironmentSatisfaction, relationshipsatisfaction, count(*) as attrition_count
from hr_data
where Attrition = 1 and MonthlyIncome < (select AVG(MonthlyIncome) from hr_data)
group by EnvironmentSatisfaction, RelationshipSatisfaction
order by attrition_count desc;

		 








