-- =========================================
-- Experiment 6 : SQL Views in PostgreSQL
-- =========================================

-- Step 1: Remove table if it already exists
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employee VALUES
(1,'Aman','HR',30000),
(2,'Riya','IT',50000),
(3,'Karan','Finance',45000),
(4,'Neha','IT',60000),
(5,'Arjun','HR',35000);

-- Create a View
-- View showing only IT department employees
CREATE OR REPLACE VIEW it_employees AS
SELECT emp_id, emp_name, salary
FROM employee
WHERE department = 'IT';

-- Query the View
SELECT * FROM it_employees;

-- Create Another View (High Salary Employees)
CREATE OR REPLACE VIEW high_salary_employees AS
SELECT emp_id, emp_name, department, salary
FROM employee
WHERE salary > 40000;

-- Query Second View
SELECT * FROM high_salary_employees;

-- Update Data Using View
UPDATE it_employees
SET salary = salary + 2000
WHERE emp_name = 'Riya';

-- Display Original Table to See Changes
SELECT * FROM employee;

-- Drop a View
DROP VIEW IF EXISTS high_salary_employees;