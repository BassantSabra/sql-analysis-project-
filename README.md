# Zaxoil Staff Data Analysis

At ZaxOil, a leading oil and gas company, you are tasked with exploring key insights about employee distribution, salary structures, and staffing trends. This analysis will focus on the relationships between departments, roles, locations, and hierarchical structures.


## 1. Employee Distribution Across Departments
```sql
select department, 
       count(staff_id) as no_employees
from Staff
group by department
order by no_employees desc
```

## 2. Salary Variation by Position, Department, and Location

```sql
select department ,
       position , 
	     location , 
	   sum(salary) as sum_salaries
from Staff
group by department ,position, location
order by sum_salaries desc
```

## 4. Relationship Between Staff Positions and Supervisors
```sql
 select position,
        COUNT(staff_id) as no_of_employees
 from Staff
 where position LIKE 'Manager%' or position like 'Supervisor%'
 group by position
```

## 5. Salary Comparison by Job Location

```sql
select location , 
       avg(salary) as salary 
from Staff 
group by location
order by salary desc
```

## 6. Average Tenure by Department
```sql
select department,
       AVG( DATEDIFF( YEAR ,date_hired, GETDATE()) )as tenure_per_year  
from Staff
group by department
order by tenure_per_year desc
```


## 7. Salary Distribution by Role
```sql
 select position , 
       avg(salary) as salary 
from Staff 
group by position
order by salary desc
```


## 8. Headcount Distribution by Staff Level
```sql
select position , 
       count(staff_id) as count_employees
from Staff
group by position
order by count_employees desc
```


## 9. Hiring Timeline and Company Growth
```sql
 select  staff_id,
       AVG( DATEDIFF( YEAR ,date_hired, GETDATE()) ) as years, 
	   avg (salary) as salary
from Staff
group by staff_id
order by salary  desc
```


## 10. Supervisor Hierarchy and Salary Structures
```sql
select  position , 
        sum(salary)
from staff
where position = 'supervisor'
group by position
```




