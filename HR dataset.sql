SELECT * FROM projects.hrdataset;
-- 1) What is the age distribution in the company 
-- i) age distribution 
select 
min(age) as OLDEST,
max(age) AS YOUNGEST
FROM hrdataset;

-- 2)age group
Select age_group,
count(*) AS count
from
(select 
case
	when age >= 31 and age <= 40 THEN '31 to 40'
    when age >= 41 and age <= 50 THEN '41 to 50'
    when age >= 51 and age <= 60 THEN '51 to 60'
    ELSE '60+'
    END AS age_group
from hrdataset
where DateofTermination is not null
) AS subquery
group by age_group
order by age_group;

-- 3)age group by gender
Select age_group,
Gender,
count(*) AS count
from
(select 
case
	when age >= 31 and age <= 40 THEN '31 to 40'
    when age >= 41 and age <= 50 THEN '41 to 50'
    when age >= 51 and age <= 60 THEN '51 to 60'
    ELSE '60+'
    END AS age_group,
    Gender
from hrdataset
where DateofTermination is not null
) AS subquery
group by age_group,Gender
order by age_group,Gender;

-- 4) what is the gender breakdown in the company?
select gender,
count(gender) AS count
from hrdataset
where DateofTermination is not null
group by Gender
order by Gender ASC;

-- 5) how does gender vary across departments and job positions?
select Department, gender,
count(gender) AS count
from hrdataset
where DateofTermination is not null
group by Department, Gender
order by Department, Gender ASC;

-- 6) by job position 
select Department, gender, position,
count(gender) AS count
from hrdataset
where DateofTermination is not null
group by Department, Position, Gender
order by Department, Position, Gender ASC;

-- 7) what is the race distribution in the company?
select RaceDesc,
count(*) AS count
from hrdataset
where DateofTermination is not null
group by RaceDesc
order by count desc;

-- 8) How are job titles distributed in the company?
SELECT Position,
 count(*) AS count
FROM hrdataset
WHERE DateofTermination IS not NULL
GROUP BY Position
ORDER BY count DESC;

-- 9) what is the distribution of employees across different states?
SELECT state,
count(*) AS count
FROM hrdataset
WHERE DateofTermination IS not NULL
GROUP BY state
ORDER BY count DESC;

-- 10) average salary
select avg(salary)
from hrdataset;

-- 11) max salary
select max(salary)
from hrdataset;

-- 12) highest paid employee?
select EmployeeName, Salary
from hrdataset
order by Salary Desc
limit 1;

-- 13) group by employement status
SELECT EmploymentStatus,
 count(*) AS count
FROM hrdataset
WHERE DateofTermination IS not NULL
GROUP BY EmploymentStatus
ORDER BY count DESC;

-- 14) recruitment source
SELECT RecruitmentSource,
 count(*) AS count
FROM hrdataset
WHERE DateofTermination IS not NULL
GROUP BY RecruitmentSource
ORDER BY count DESC;

-- 15) manager
SELECT ManagerName,
 count(*) AS count
FROM hrdataset
WHERE DateofTermination IS not NULL
GROUP BY ManagerName
ORDER BY count DESC;

-- 16) citizenship
SELECT CitizenDesc,
 count(*) AS count
FROM hrdataset
WHERE DateofTermination IS not NULL
GROUP BY CitizenDesc
ORDER BY count DESC;

-- 17) marriage description
SELECT MaritalDesc,
 count(*) AS count
FROM hrdataset
WHERE DateofTermination IS not NULL
GROUP BY MaritalDesc
ORDER BY count DESC;