# Zaxoil Staff Data Analysis

At ZaxOil, a leading oil and gas company, you are to explore key insights about employee distribution,
salary structures, and staffing trends. By analyzing the relationship between departments, roles,
locations, and hierarchical structures.

## Table of Contents
1. [Employee Distribution Across Departments](#1-employee-distribution-across-departments)
2. [Salary Variation by Position, Department, and Location](#2-salary-variation-by-position-department-and-location)
3. [Hiring Trends by Department or Position](#3-hiring-trends-by-department-or-position)
4. [Relationship Between Staff Positions and Supervisors](#4-relationship-between-staff-positions-and-supervisors)
5. [Salary Comparison by Job Location](#5-salary-comparison-by-job-location)
6. [Average Tenure by Department](#6-average-tenure-by-department)
7. [Salary Distribution by Role](#7-salary-distribution-by-role)
8. [Headcount Distribution by Staff Level](#8-headcount-distribution-by-staff-level)
9. [Hiring Timeline and Company Growth](#9-hiring-timeline-and-company-growth)
10. [Supervisor Hierarchy and Salary Structures](#10-supervisor-hierarchy-and-salary-structures)

-- **1. What is the distribution of employees across departments?**

SELECT department, COUNT(staff_id) AS no_employees
FROM Staff
GROUP BY department
ORDER BY no_employees DESC;

-- **2. How does salary vary by position, department, and location?**

SELECT department, position, location, SUM(salary) AS sum_salaries
FROM Staff
GROUP BY department, position, location
ORDER BY sum_salaries DESC;

-- **3. Are there any trends in hiring dates based on departments or positions?**

SELECT department, position, YEAR(date_hired) AS hire_year, COUNT(staff_id) AS no_of_hires
FROM Staff
GROUP BY department, position, YEAR(date_hired)
ORDER BY hire_year, department, position;

-- **4. What is the relationship between staff positions and supervisors?**

SELECT position, COUNT(staff_id) AS no_of_employees
FROM Staff
WHERE position LIKE 'Manager%' OR position LIKE 'Supervisor%'
GROUP BY position;

-- **5. How do salaries compare between employees based on job locations?**

SELECT location, AVG(salary) AS avg_salary
FROM Staff
GROUP BY location
ORDER BY avg_salary DESC;

-- **6. What is the average tenure of employees across different departments?**

SELECT department, AVG(DATEDIFF(YEAR, date_hired, GETDATE())) AS tenure_per_year
FROM Staff
GROUP BY department
ORDER BY tenure_per_year DESC;

-- **7. How do roles (e.g., Engineers vs. Technicians) impact salary distribution?**

SELECT position, AVG(salary) AS avg_salary
FROM Staff
GROUP BY position
ORDER BY avg_salary DESC;

-- **8. What is the headcount distribution across different staff levels?**

SELECT position, COUNT(staff_id) AS count_employees
FROM Staff
GROUP BY position
ORDER BY count_employees DESC;

-- **9. How does the hiring timeline reflect the company's growth and staffing needs?**

SELECT staff_id, AVG(DATEDIFF(YEAR, date_hired, GETDATE())) AS years, AVG(salary) AS salary
FROM Staff
GROUP BY staff_id
ORDER BY salary DESC;

-- **10. What role does the supervisor hierarchy play in staffing decisions and salary structures?**

SELECT position, SUM(salary)
FROM Staff
WHERE position = 'Supervisor'
GROUP BY position;
