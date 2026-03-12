create database HR_Analytics;
rename table `wa_fn-usec_-employees` to employees; 
select * from employees;
-- To check the structure of the table 
describe employees;
-- Find total number of employees 
select count(*) as total_employees from employees;
-- To check duplicate values 
select employeenumber, count(*) 
from employees
group by EmployeeNumber
having count(*)>1;
-- change column name  
alter table employees rename column ï»¿Age to Age;
-- To check null values of all columns 
select count(*)
from employees
where Age is null;
SELECT
SUM(CASE WHEN Attrition IS NULL THEN 1 ELSE 0 END) AS Attrition_nulls,
SUM(CASE WHEN BusinessTravel IS NULL THEN 1 ELSE 0 END) AS BusinessTravel_nulls,
SUM(CASE WHEN DailyRate IS NULL THEN 1 ELSE 0 END) AS DailyRate_nulls,
SUM(CASE WHEN Department IS NULL THEN 1 ELSE 0 END) AS Department_nulls,
SUM(CASE WHEN DistanceFromHome IS NULL THEN 1 ELSE 0 END) AS DistanceFromHome_nulls,
SUM(CASE WHEN Education IS NULL THEN 1 ELSE 0 END) AS Education_nulls,
SUM(CASE WHEN EducationField IS NULL THEN 1 ELSE 0 END) AS EducationField_nulls,
SUM(CASE WHEN EmployeeCount IS NULL THEN 1 ELSE 0 END) AS EmployeeCount_nulls,
SUM(CASE WHEN EmployeeNumber IS NULL THEN 1 ELSE 0 END) AS EmployeeNumber_nulls,
SUM(CASE WHEN EnvironmentSatisfaction IS NULL THEN 1 ELSE 0 END) AS EnvironmentSatisfaction_nulls,
SUM(CASE WHEN Gender IS NULL THEN 1 ELSE 0 END) AS Gender_nulls,
SUM(CASE WHEN HourlyRate IS NULL THEN 1 ELSE 0 END) AS HourlyRate_nulls,
SUM(CASE WHEN JobInvolvement IS NULL THEN 1 ELSE 0 END) AS JobInvolvement_nulls,
SUM(CASE WHEN JobLevel IS NULL THEN 1 ELSE 0 END) AS JobLevel_nulls,
SUM(CASE WHEN JobRole IS NULL THEN 1 ELSE 0 END) AS JobRole_nulls,
SUM(CASE WHEN JobSatisfaction IS NULL THEN 1 ELSE 0 END) AS Jobsatisfaction_nulls,
SUM(CASE WHEN MaritalStatus IS NULL THEN 1 ELSE 0 END) AS MartialStatus_nulls,
SUM(CASE WHEN MonthlyIncome IS NULL THEN 1 ELSE 0 END) AS MonthlyIncome_nulls,
SUM(CASE WHEN MonthlyRate IS NULL THEN 1 ELSE 0 END) AS MonthlyRate_nulls,
SUM(CASE WHEN NumCompaniesWorked IS NULL THEN 1 ELSE 0 END) AS NumCompaniesWorked_nulls,
SUM(CASE WHEN Over18 IS NULL THEN 1 ELSE 0 END) AS Over18_nulls,
SUM(CASE WHEN OverTime IS NULL THEN 1 ELSE 0 END) AS OverTime_nulls,
SUM(CASE WHEN PercentSalaryHike IS NULL THEN 1 ELSE 0 END) AS PercentSalaryHike_nulls,
SUM(CASE WHEN PerformanceRating IS NULL THEN 1 ELSE 0 END) AS PerformanceRating_nulls,
SUM(CASE WHEN RelationshipSatisfaction IS NULL THEN 1 ELSE 0 END) AS RelationshipSatisfaction_nulls,
SUM(CASE WHEN StandardHours IS NULL THEN 1 ELSE 0 END) AS StandardHours_nulls,
SUM(CASE WHEN StockOptionLevel IS NULL THEN 1 ELSE 0 END) AS StockOptionLevel_nulls,
SUM(CASE WHEN TotalWorkingYears IS NULL THEN 1 ELSE 0 END) AS TotalWorkingYears_nulls,
SUM(CASE WHEN TrainingTimesLastYear IS NULL THEN 1 ELSE 0 END) AS TrainingTimesLastYear_nulls,
SUM(CASE WHEN WorkLifeBalance IS NULL THEN 1 ELSE 0 END) AS WorkLifeBalance_nulls,
SUM(CASE WHEN YearsAtCompany IS NULL THEN 1 ELSE 0 END) AS YearsAtCompany_nulls,
SUM(CASE WHEN YearsInCurrentRole IS NULL THEN 1 ELSE 0 END) AS YearsInCurrentRole_nulls,
SUM(CASE WHEN YearsSinceLastPromotion IS NULL THEN 1 ELSE 0 END) AS YearsSinceLastPromotion_nulls,
SUM(CASE WHEN YearsWithCurrManager IS NULL THEN 1 ELSE 0 END) AS YearsWithCurrManager_nulls
FROM employees;
-- find total departments
select distinct department
from employees; 
-- Total jobroles with number of employees
select distinct JobRole, count(*) as total_employees
from employees
group by JobRole;
-- Find education fields 
select distinct EducationField
from employees;
-- Mi and max monthly income
select min(MonthlyIncome), max(MonthlyIncome)
from employees;
-- Minimum monthy income 
select MonthlyIncome
from employees
order by MonthlyIncome asc
limit 1;
-- Total Attrition count
select Attrition, count(*) as total_attrition
from employees
group by attrition;
-- Attrition rate overall
select  
	Round(avg(
    case when attrition = 'Yes' 
    then 1
    else 0
    end)*100,2)as Attrition_rate
from employees;
-- Total employees by department 
select department, count(*) as total_employees_by_department
from employees
group by department;
-- Attrition by department
select department, count(*) as total_attrition_by_department
from employees
where attrition = 'yes'
group by department
order by count(*) desc;
-- Average salary by jobrole
select JobRole,
	Round(
    avg(monthlyincome),2) as average_salary_by_jobrole
from employees
group by jobrole
order by avg(monthlyincome) desc;
-- Total employees by age 
select age, count(*) as total_employees_by_age
from employees
group by age;
-- Attrition by age 
select age, count(*)
from employees
where attrition = 'yes'
group by age
order by count(*) desc;
-- Job satisfaction analysis 
select jobsatisfaction, count(*)
from employees
group by jobsatisfaction
order by count(*) desc;
-- Attrition rate by jobsatisfaction
select JobSatisfaction,
	count(*) as total_employees
	from employees
    where attrition = 'yes'
    group by JobSatisfaction;
-- Work experience analysis
select 
	round(
    avg(yearsatcompany),2) as average_years_at_company
from employees; 
select yearsatcompany, count(*) as total_employees
from employees
group by YearsAtCompany
order by YearsAtCompany;
-- Attrition rate by overtime
select overtime, count(*) as total_employees
from employees
where attrition = 'yes'
group by overtime;
-- Attrition rate by salary
select monthlyincome,
	count(*) as total_employees
from employees
where attrition = 'yes'
group by monthlyincome
order by count(*) desc;
alter table employees add column age_group varchar(120);
update employees set age_group =
	case when age<30 then 'young'
    when age between 30 and 40 then 'Mid-age'
    else 'senior'
    end;



