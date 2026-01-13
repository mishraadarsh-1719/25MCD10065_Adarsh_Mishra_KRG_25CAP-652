
CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) UNIQUE NOT NULL,
    Location VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50) NOT NULL,
    Salary INT CHECK (Salary > 0),
    Dept_ID INT REFERENCES Department(Dept_ID),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Project (
    Project_ID INT PRIMARY KEY,
    Project_Name VARCHAR(50) NOT NULL,
    Budget INT CHECK (Budget >= 10000),
    Dept_ID INT REFERENCES Department(Dept_ID)
       
);

INSERT INTO Department VALUES
(1, 'HR', 'Mumbai'),
(2, 'IT', 'Pune'),
(3, 'Finance', 'Delhi');

INSERT INTO Employee VALUES
(101, 'Akash', 50000, 2, 'akash@org.in'),
(102, 'Boby', 45000, 1, 'boby@org.in'),
(103, 'Chetan', 60000, 2, 'chetan@org.in');

INSERT INTO Project VALUES
(201, 'Payroll System', 200000, 1),
(202, 'Web Application', 500000, 2);

SELECT * FROM Department;
SELECT * FROM Employee;
SELECT * FROM Project;

UPDATE Employee
SET Salary = 55000
WHERE Emp_ID = 101;

DELETE FROM Department
WHERE Dept_ID = 3;

CREATE ROLE Analyst
LOGIN PASSWORD 'analyst123'

GRANT SELECT ON Department TO Analyst;
GRANT SELECT ON Employee TO Analyst;
GRANT SELECT ON Project TO Analyst;

REVOKE CREATE ON DATABASE tpp FROM analyst;

ALTER TABLE Employee
ADD Phone_No INT(10);

ALTER TABLE Employee
ALTER COLUMN Emp_Name TYPE VARCHAR(50);

DROP TABLE Project;



