-- HR EMPLOYEE ATTRITION ANALYSIS
-- Database: portfolio_projects
-- ===========================================
USE portfolio_projects;
-- ===========================================
-- DATA EXPLORATION
-- ===========================================

-- Preview the first 10 records
SELECT *
FROM employee_attrition
LIMIT 10;

-- Total number of employees
SELECT COUNT(*) AS total_employees
FROM employee_attrition;
-- Result: 1,470 employees

-- Display the table structure
DESC employee_attrition;
-- ===========================================
-- DATA CLEANING
-- ===========================================

ALTER TABLE employee_attrition
CHANGE COLUMN `ï»¿Age` Age INT;
DESC employee_attrition;
-- Dataset contains 1,470 employee records.
-- Renamed column: ï»¿Age -> Age.
-- No missing values found in key columns.
-- No duplicate EmployeeNumber records found.
-- Dataset is clean and ready for analysis.

 --TOTAL EMPLOYEES WHO LEFT THE COMPANY
 SELECT Attrition, COUNT(*) AS employee_count
FROM employee_attrition
GROUP BY Attrition;
-- Insight:
-- Out of 1,470 employees, 237 left the company while 1,233 stayed.
-- This represents an attrition rate of approximately 16.1%.

--Which department had the highest number of employees who left the company?
SELECT Department,
       COUNT(*) AS employees_left
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Department
ORDER BY employees_left DESC;
-- Insight:
-- The Research & Development department recorded the highest number of employee exits (133),
-- followed by Sales (92), while Human Resources had the lowest attrition (12).

Which job roles had the highest number of employees who left the company?
SELECT JobRole,
       COUNT(*) AS employees_left
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY JobRole
ORDER BY employees_left DESC;

-- Insight:
-- Laboratory Technicians recorded the highest number of employee exits (62),
-- followed by Sales Executives (57) and Research Scientists (47).
-- Research Directors had the fewest employee exits (2).

Does overtime have an impact on employee attrition?
SELECT OverTime,
       COUNT(*) AS employees_left
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY OverTime
ORDER BY employees_left DESC;

-- Insight:
-- Employees who worked overtime recorded more employee exits (127)
-- than employees who did not work overtime (110).
-- This suggests that overtime may be associated with higher employee attrition.

Which gender experienced the highest number of employee exits?

SELECT Gender,
       COUNT(*) AS employees_left
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Gender
ORDER BY employees_left DESC;

-- Insight:
-- Male employees recorded a higher number of employee exits (150)
-- than female employees (87).

Which age group experienced the highest number of employee exits?

SELECT Age,
       COUNT(*) AS employees_left
FROM employee_attrition
WHERE Attrition = 'Yes'
GROUP BY Age
ORDER BY employees_left DESC;

-- Insight:
-- Employees aged 29 and 31 recorded the highest number of employee exits (18 each),
-- followed by employees aged 28 (14), and employees aged 26 and 33 (12 each).
-- Overall, employee exits appear to be concentrated among employees in their late 20s and early 30s.

What is the average monthly income by department?

SELECT Department,
       AVG(MonthlyIncome) AS average_monthly_income
FROM employee_attrition
GROUP BY Department
ORDER BY average_monthly_income DESC;

-- Insight:
-- The Sales department had the highest average monthly income (6,959.17),
-- followed by Human Resources (6,654.51).
-- Research & Development recorded the lowest average monthly income (6,281.25).
What is the average job satisfaction score by department?
SELECT Department,
       ROUND(AVG(JobSatisfaction), 2) AS average_job_satisfaction
FROM employee_attrition
GROUP BY Department
ORDER BY average_job_satisfaction DESC;

-- Insight:
-- The Sales department recorded the highest average job satisfaction score (2.75),
-- followed closely by Research & Development (2.73).
-- Human Resources had the lowest average job satisfaction score (2.60).
Which job roles have the highest average monthly income?
SELECT JobRole,
       ROUND(AVG(MonthlyIncome), 2) AS average_monthly_income
FROM employee_attrition
GROUP BY JobRole
ORDER BY average_monthly_income DESC;

-- Insight:
-- Managers earned the highest average monthly income (17,181.68),
-- followed by Research Directors (16,033.55).
-- Sales Representatives recorded the lowest average monthly income (2,626.00).

Which job roles work overtime the most?

SELECT JobRole,
       COUNT(*) AS overtime_employees
FROM employee_attrition
WHERE OverTime='Yes'
GROUP BY JobRole
ORDER BY overtime_employees DESC;

-- Insight:
-- Research Scientists had the highest number of employees working overtime (97),
-- followed closely by Sales Executives (94).
-- Human Resources had the fewest employees working overtime (13).
-- These roles may require further investigation to determine whether workload contributes
-- to employee turnover.