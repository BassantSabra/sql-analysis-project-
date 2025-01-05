create database zaxoil;

CREATE TABLE Staff (
    staff_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    position VARCHAR(100) NOT NULL,
    department VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    salary DECIMAL(10, 2) NOT NULL,
    date_hired DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE,
    supervisor_id INT
    );

INSERT INTO Staff (staff_id,first_name, last_name, position, department, location, salary, date_hired, email, phone_number, supervisor_id)
VALUES 
(100, 'John', 'Doe', 'Engineer', 'Drilling', 'Offshore', 85000, '2022-01-15', 'john.doe@example.com', '555-0123', NULL),
(101, 'Jane', 'Smith', 'Accountant', 'Finance', 'HQ', 65000, '2020-06-10', 'jane.smith@example.com', '555-0456', NULL),
(102,'Emily', 'Clark', 'Technician', 'Exploration', 'Field', 55000, '2019-07-20', 'emily.clark@example.com', '555-0789', 1),
(103,'Michael', 'Johnson', 'Manager', 'Operations', 'Offshore', 95000, '2021-03-15', 'michael.johnson@example.com', '555-0147', NULL),
(104,'Olivia', 'Williams', 'Engineer', 'Drilling', 'Onshore', 78000, '2022-05-10', 'olivia.williams@example.com', '555-0198', 2),
(105,'James', 'Brown', 'Supervisor', 'Maintenance', 'Offshore', 70000, '2020-09-05', 'james.brown@example.com', '555-0210', 3),
(106,'Sophia', 'Davis', 'Technician', 'Exploration', 'Field', 54000, '2019-11-25', 'sophia.davis@example.com', '555-0349', 1),
(107,'William', 'Miller', 'Technician', 'Maintenance', 'HQ', 57000, '2021-02-20', 'william.miller@example.com', '555-0236', 3),
(108,'Isabella', 'Moore', 'Engineer', 'Production', 'Offshore', 90000, '2022-08-01', 'isabella.moore@example.com', '555-0556', NULL),
(109,'Benjamin', 'Taylor', 'Manager', 'Engineering', 'HQ', 102000, '2020-12-30', 'benjamin.taylor@example.com', '555-0478', NULL),
(110,'Charlotte', 'Anderson', 'Technician', 'Production', 'Field', 56000, '2019-10-15', 'charlotte.anderson@example.com', '555-0382', 5),
(111,'Ethan', 'Thomas', 'Supervisor', 'Exploration', 'Offshore', 75000, '2021-06-18', 'ethan.thomas@example.com', '555-0612', 6),
(112,'Mia', 'Jackson', 'Accountant', 'Finance', 'HQ', 68000, '2022-02-10', 'mia.jackson@example.com', '555-0665', 2),
(113,'Alexander', 'White', 'Technician', 'Maintenance', 'HQ', 59000, '2019-12-22', 'alexander.white@example.com', '555-0754', 7),
(114,'Amelia', 'Harris', 'Manager', 'Operations', 'Field', 88000, '2021-07-10', 'amelia.harris@example.com', '555-0953', 4),
(115,'Jack', 'Martin', 'Technician', 'Exploration', 'Offshore', 54000, '2020-11-30', 'jack.martin@example.com', '555-0825', 1),
(116,'Liam', 'Garcia', 'Engineer', 'Drilling', 'Onshore', 80000, '2022-06-25', 'liam.garcia@example.com', '555-0981', 9),
(117,'Ava', 'Rodriguez', 'Supervisor', 'Production', 'Offshore', 77000, '2021-01-11', 'ava.rodriguez@example.com', '555-0119', 10),
(118,'Noah', 'Martinez', 'Technician', 'Drilling', 'Field', 60000, '2019-08-17', 'noah.martinez@example.com', '555-0274', 2),
(119,'Lucas', 'Gonzalez', 'Engineer', 'Maintenance', 'Offshore', 85000, '2022-04-05', 'lucas.gonzalez@example.com', '555-0331', 7),
(120,'Zoe', 'Perez', 'Technician', 'Drilling', 'Field', 62000, '2020-10-19', 'zoe.perez@example.com', '555-0678', 4),
(121,'Daniel', 'Nelson', 'Manager', 'Production', 'Onshore', 95000, '2022-07-29', 'daniel.nelson@example.com', '555-0492', NULL),
(122,'Grace', 'Roberts', 'Engineer', 'Production', 'Offshore', 87000, '2021-04-15', 'grace.roberts@example.com', '555-0549', 6),
(123,'Henry', 'Carter', 'Accountant', 'Finance', 'HQ', 69000, '2020-12-02', 'henry.carter@example.com', '555-0781', 2),
(124,'Ella', 'Lee', 'Technician', 'Maintenance', 'Field', 57000, '2019-06-10', 'ella.lee@example.com', '555-0367', 5),
(125,'Sebastian', 'Walker', 'Manager', 'Engineering', 'HQ', 105000, '2021-09-18', 'sebastian.walker@example.com', '555-0514', NULL),
(126,'Archer', 'Young', 'Technician', 'Exploration', 'Offshore', 59000, '2020-01-29', 'archer.young@example.com', '555-0802', 3);


select *
from Staff


-- What is the distribution of employees across departments (e.g., Drilling, Finance, Engineering)?

select department , 
       count(staff_id) as no_employees
from Staff
group by department
order by no_employees desc

-- How does salary vary by position, department, and location?
select department ,
       position , 
	   location , 
	   sum(salary) as sum_salaries
from Staff
group by department ,position, location
order by sum_salaries desc

-- Are there any trends in the hiring dates based on departments or positions?

-- What is the relationship between staff positions and supervisors?
 select position,
        COUNT(staff_id) as no_of_employees
 from Staff
 where position LIKE 'Manager%' or position like 'Supervisor%'
 group by position

-- How do salaries compare between employees based on their job locations (e.g., Offshoratione vs.Onshore)?
select location , 
       avg(salary) as salary 
from Staff 
group by location
order by salary desc

-- What is the average tenure of employees across different departments or positions? ==
select department,
       AVG( DATEDIFF( YEAR ,date_hired, GETDATE()) )as tenure_per_year  
from Staff
group by department
order by tenure_per_year desc

-- How do gender or role (e.g., Engineers vs. Technicians) impact the salary distribution?
select position , 
       avg(salary) as salary 
from Staff 
group by position
order by salary desc

-- What is the headcount distribution across different staff levels (Managers, Supervisors,Technicians)?
select position , 
       count(staff_id) as count_employees
from Staff
group by position
order by count_employees desc

-- How does the hiring timeline reflect the company's growth and staffing needs? 
select  staff_id,
       AVG( DATEDIFF( YEAR ,date_hired, GETDATE()) ) as years, 
	   avg (salary) as salary
from Staff
group by staff_id
order by salary  desc

--What role does the supervisor hierarchy play in staffing decisions and salary structures?

select  position , 
        sum(salary)
from staff
where position = 'supervisor'
group by position
