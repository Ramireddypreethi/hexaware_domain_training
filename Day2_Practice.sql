-- Create a new database called 'org'
create database org
-- Switch to the 'org' database
USE org
-- Create the 'employees' table with specified columns
CREATE TABLE employees (
    id INT NOT NULL IDENTITY(1,1),  -- Unique identifier for each employee
    first_name VARCHAR(255) NOT NULL,  -- Employee's first name
    last_name VARCHAR(255),  -- Employee's last name
    dept VARCHAR(255),  -- Department in which the employee works
    email VARCHAR(255) NOT NULL,  -- Employee's email address
    phone VARCHAR(50),  -- Employee's phone number
    hire_date DATE,  -- Date when the employee was hired
    salary DECIMAL(10, 2),  -- Employee's salary
    PRIMARY KEY (id)  -- Set 'id' as the primary key
);

-- Describe the structure of the 'employees' table
sp_help 'Employees'

-- Insert a single employee record into the 'employees' table
INSERT INTO employees (first_name, last_name, dept, email, phone, hire_date, salary) VALUES
('Nancy', 'Davolio', 'Sales Representative', 'nancy.davolio@example.com', '555-0123', '2023-01-15', 5000.00);
-- Select all columns from the 'employees' table
SELECT * FROM employees;
-- Insert multiple employee records into the 'employees' table
INSERT INTO employees (first_name, last_name, dept, email, phone, hire_date, salary) VALUES
('Nancy', 'Davolio', 'Sales Representative', 'nancy.davolio@example.com', '555-0123', '2023-01-15', 5000.00),
('Andrew', 'Fuller', 'Vice President, Sales', 'andrew.fuller@example.com', '555-0456', '2022-03-10', 8000.00),
('Janet', 'Leverling', 'Sales Representative', 'janet.leverling@example.com', '555-0789', '2023-05-20', 5000.00),
('Margaret', 'Peacock', 'Sales Representative', 'margaret.peacock@example.com', '555-1011', '2023-02-25', 5000.00),
('Steven', 'Buchanan', 'Sales Manager', 'steven.buchanan@example.com', '555-1213', '2022-12-01', 7000.00),
('Michael', 'Suyama', 'Sales Representative', 'michael.suyama@example.com', '555-1415', '2023-04-11', 5000.00),
('Robert', 'King', 'Sales Representative', 'robert.king@example.com', '555-1617', '2023-07-05', 5000.00),
('Laura', 'Callahan', 'Inside Sales Coordinator', 'laura.callahan@example.com', '555-1819', '2023-08-15', 6000.00),
('Anne', 'Dodsworth', 'Sales Representative', 'anne.dodsworth@example.com', '555-2021', '2023-06-30', 5000.00);

-- Select all columns from the 'employees' table
SELECT * FROM employees;
-- Select all employees who are Sales Representatives
select * from employees where dept='Sales Representative'
-- Select specific columns for Sales Representatives
SELECT id, first_name, last_name, dept FROM employees WHERE dept = 'Sales Representative'
-- Select specific columns for the employee named 'Margaret' in the Sales Representative department
SELECT id, first_name, last_name, dept FROM employees WHERE dept = 'Sales Representative' and first_name='Margaret'
-- Select specific columns for employees in the Sales Representative department or with the first name 'Laura'
SELECT id, first_name, last_name, dept FROM employees WHERE dept = 'Sales Representative' OR first_name = 'Laura';
-- Select specific columns for employees who are NOT in the Sales Representative department
SELECT id, first_name, last_name, dept FROM employees WHERE NOT dept = 'Sales Representative';
-- Select specific columns for employees in either Sales Representative or Inside Sales Coordinator departments
SELECT id, first_name, last_name, dept FROM employees WHERE dept = 'Sales Representative' OR dept= 'Inside Sales Coordinator';
-- Select specific columns for employees in either Sales Representative or Inside Sales Coordinator departments using IN clause
SELECT id, first_name, last_name, dept FROM employees WHERE dept IN ('Sales Representative', 'Inside Sales Coordinator');
-- Select specific columns for employees NOT in Sales Representative or Inside Sales Coordinator departments
SELECT id, first_name, last_name, dept FROM employees WHERE dept NOT IN ('Sales Representative', 'Inside Sales Coordinator');
-- Select all departments from employees
SELECT dept from employees;
-- Select distinct departments from employees
SELECT DISTINCT dept from employees;
-- Insert new employee records into the 'employees' table
INSERT INTO employees (first_name, last_name, dept, email, phone, hire_date, salary) VALUES
('Nancy', 'Smith', 'Sales Representative', 'nancy.smith@example.com', '555-3030', '2023-09-01', 5000.00),  -- Duplicate first name
('Andrew', NULL, 'Sales', 'andrew@example.com', NULL, '2023-10-01', NULL),  -- Duplicate first name, NULL last name and phone
('Michael', 'Johnson', 'Sales Representative', 'michael.johnson@example.com', '555-4040', NULL, 5000.00),  -- Duplicate first name
('Laura', NULL, NULL,'laura@gmail.com', NULL, NULL, NULL),  -- ADD email id TO RESOLVE error
('Robert', 'Brown', 'Sales Representative', 'robert.brown@example.com', NULL, NULL, 5000.00),  -- Another employee
('Margaret', 'Thompson', NULL, 'Margaret@example.com', '555-5050', '2023-10-04', 6000.00);  -- Duplicate first name, NULL dept and email
-- Select all employee records from the 'employees' table
SELECT * from employees;
-- Select employees whose first name starts with 'm'
SELECT * from employees WHERE first_name like 'm%';
-- Select employees whose first name contains 'a'
SELECT * from employees WHERE first_name like '%a%';
-- Select employees whose first name ends with 't'
SELECT * from employees WHERE first_name like '%t';
-- Select employees with salaries between 3000 and 6000
SELECT * from employees WHERE salary BETWEEN 3000 AND 6000;
-- Select employees with salaries not between 3000 and 6000
SELECT * from employees WHERE salary NOT BETWEEN 3000 AND 6000;
-- Select first and last names, along with a concatenated full name
SELECT first_name, last_name, CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
-- Select id, first name, last name, department, and hire date for employees with a NULL hire date
SELECT id, first_name, last_name, dept, hire_date FROM employees WHERE hire_date IS NULL;
-- Update hire dates to "2023-01-01" for employees with a NULL hire date
UPDATE employees SET hire_date='2023-01-01' WHERE hire_date IS NULL;
-- Select employees with a NULL hire date after the update
SELECT id, first_name, last_name, dept FROM employees WHERE hire_date is NULL;
-- Increase the salary of all employees in the Sales department by 10%
UPDATE employees  SET salary = salary * 1.10 WHERE dept = 'Sales Representative';
SELECT * FROM employees;
-- Select employee with a specific email
SELECT * FROM employees WHERE email='anne.dodsworth@example.com';
-- Delete the employee record with the specific email
DELETE FROM employees WHERE email='anne.dodsworth@example.com';
-- Select all employees after the deletion
SELECT * FROM employees;
-- Delete all employee records from the 'employees' table
DELETE FROM employees;
-- Select all employees to confirm deletion
SELECT * FROM employees;
-- Insert a new employee record into the 'employees' table
INSERT INTO employees (first_name, last_name, dept, email, phone, hire_date, salary) VALUES
('Nancy', 'Davolio', 'Sales Representative', 'nancy.davolio@example.com', '555-0123', '2023-01-15', 5000.00);

