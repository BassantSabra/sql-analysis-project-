# Zaxoil Staff Data Analysis

At ZaxOil, a leading oil and gas company, you are tasked with exploring key insights about employee distribution, salary structures, and staffing trends. This analysis will focus on the relationships between departments, roles, locations, and hierarchical structures.

## Table of Contents
1. [Employee Distribution Across Departments](#employee-distribution-across-departments)
2. [Salary Variation by Position, Department, and Location](#salary-variation-by-position-department-and-location)
3. [Hiring Trends by Department or Position](#hiring-trends-by-department-or-position)
4. [Relationship Between Staff Positions and Supervisors](#relationship-between-staff-positions-and-supervisors)
5. [Salary Comparison by Job Location](#salary-comparison-by-job-location)
6. [Average Tenure by Department](#average-tenure-by-department)
7. [Salary Distribution by Role](#salary-distribution-by-role)
8. [Headcount Distribution by Staff Level](#headcount-distribution-by-staff-level)
9. [Hiring Timeline and Company Growth](#hiring-timeline-and-company-growth)
10. [Supervisor Hierarchy and Salary Structures](#supervisor-hierarchy-and-salary-structures)

-- 1. Employee Distribution Across Departments
SELECT department, COUNT(staff_id) AS no_employees
FROM Staff
GROUP BY department
ORDER BY no_employees DESC;

-- 2. Salary Variation by Position, Department, and Location
--SELECT department, position, location, SUM(salary) AS sum_salaries
--FROM Staff
--GROUP BY department, position, location
--ORDER BY sum_salaries DESC;

-- 3. Hiring Trends by Department or Position
SELECT department, position, YEAR(date_hired) AS hire_year, COUNT(staff_id) AS no_of_hires
FROM Staff
GROUP BY department, position, YEAR(date_hired)
ORDER BY hire_year, department, position;

-- 4. Relationship Between Staff Positions and Supervisors
SELECT position, COUNT(staff_id) AS no_of_employees
FROM Staff
WHERE position LIKE 'Manager%' OR position LIKE 'Supervisor%'
GROUP BY position;

-- 5. Salary Comparison by Job Location
SELECT location, AVG(salary) AS avg_salary
FROM Staff
GROUP BY location
ORDER BY avg_salary DESC;

-- 6. Average Tenure by Department
SELECT department, AVG(DATEDIFF(YEAR, date_hired, GETDATE())) AS tenure_per_year
FROM Staff
GROUP BY department
ORDER BY tenure_per_year DESC;

-- 7. Salary Distribution by Role
SELECT position, AVG(salary) AS avg_salary
FROM Staff
GROUP BY position
ORDER BY avg_salary DESC;

-- 8. Headcount Distribution by Staff Level
SELECT position, COUNT(staff_id) AS count_employees
FROM Staff
GROUP BY position
ORDER BY count_employees DESC;

-- 9. Hiring Timeline and Company Growth
SELECT staff_id, AVG(DATEDIFF(YEAR, date_hired, GETDATE())) AS years, AVG(salary) AS salary
FROM Staff
GROUP BY staff_id
ORDER BY salary DESC;

-- 10. Supervisor Hierarchy and Salary Structures
SELECT position, SUM(salary)
FROM Staff
WHERE position = 'Supervisor'
GROUP BY position;

