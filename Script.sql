create schema company;
create table company.employees_table(
	employee_id INT primary key,
	first_name VARCHAR(50) not null,
	last_name VARCHAR(50) not null,
	gender VARCHAR(50) not null,
	departments VARCHAR(100) not null,
	salary INT not null,
	year_hired DATE not NULL	
	
);
select * from company.employees_table;

INSERT INTO company.employees_table (employee_id, first_name, last_name, gender, departments, salary, year_hired) 
VALUES
-- 1. Create the schema if it doesn't exist
CREATE SCHEMA IF NOT EXISTS company;

-- 2. Create the employees_table
CREATE TABLE company.employees_table (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    gender VARCHAR(50) NOT NULL,
    departments VARCHAR(100) NOT NULL,
    hire_date DATE NOT null,
    salary INT NOT NULL   
);

ALTER TABLE company.employees_table
RENAME COLUMN departments TO "department";

insert into company.employees_table(employee_id, first_name, last_name,gender,department, hire_date, salary)
values
(1,'Jhon','Doe','Male','IT','2018-05-01',60000.00),
(2,'Jane','Smith','Female','HR','2019-06-15',50000.00),
(3,'Michale','Johnson','Male','Finance','2017-03-10',75000.00),
(4,'Emily','Davis','Female','IT','2020-11-20',70000.00),
(5,'Sarah','Brown','Femlae','Marketing','2016-07-30',45000.00),
(6,'David','Wilson','Male','Sales','2019-01-05',55000.00),
(7,'Chris','Taylor','Male','IT','2022-02-25',65000.00);


CREATE TABLE company.products_table (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    catagory VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL   
);

insert into company.products_table (product_id,product_name,catagory,price,stock)
values(1,'Laptop','Electronics',1200.00,30),
(2,'Desk','Furniture',300.00,50),
(3,'Chair','Furniture',150.00,200),
(4,'Smartphone','Electronics',800.00,75),
(5,'Monitor','Electronics',250.00,40),
(6,'Bookshelf','Furniture',100.00,60),
(7,'Printer','Electronics',200.00,25);

create table company.sales_table (
sales_id INT primary key,
product_id INT references company.products_table(product_id),
employee_id int references company.employees_table(employee_id),
sales_date DATE not null,
quantity INT not null,
total decimal(8,2)
);
insert into company.sales_table(sales_id, product_id,employee_id, sales_date, quantity, total)
values
(1,1,1,'2021-01-15',2,2400.00),
(2,2,2,'2021-03-22',1,300.00),
(3,3,3,'2021-05-10',4,2400.00),
(4,4,4,'2021-07-18',3,2400.00),
(5,5,5,'2021-09-25',2,500.00),
(6,6,6,'2021-11-30',1,100.00),
(7,7,1,'2021-05-10',1,200.00),
(8,1,2,'2021-05-10',1,1200.00),
(9,2,3,'2021-05-10',2,600.00),
(10,3,4,'2021-05-10',3,450.00),
(11,4,5,'2021-05-10',1,800.00),
(12,5,6,'2021-05-10',4,1000.00);


select * from company.products_table;

-- 1
select * from company.employees_table;

--Question 2
select first_name as fn
from company.employees_table;

-- 3
SELECT DISTINCT department FROM company.employees_table;

-- 4
SELECT COUNT(*) AS total_employees FROM company.employees_table;

-- 5
SELECT SUM(salary) AS total_salary FROM company.employees_table;

-- 6
SELECT AVG(salary) AS average_salary FROM company.employees_table;

-- 7
SELECT MAX(salary) AS highest_salary FROM company.employees_table;

-- 8
SELECT MIN(salary) AS lowest_salary FROM company.employees_table;

-- 9
SELECT COUNT(*) AS male_employees 
FROM company.employees_table
WHERE gender = 'Male';

-- 10
SELECT COUNT(*) AS female_employees 
FROM company.employees_table
WHERE gender = 'Female';

-- 20
SELECT COUNT(DISTINCT first_name) AS unique_first_names
FROM company.employees_table;

-- 21
SELECT e.employee_id, e.first_name, e.last_name, s.sales_id, s.product_id, s.sales_date, s.quantity, s.total
FROM company.employees_table e
LEFT JOIN company.sales_table s ON e.employee_id = s.employee_id
ORDER BY e.employee_id, s.sales_date;



