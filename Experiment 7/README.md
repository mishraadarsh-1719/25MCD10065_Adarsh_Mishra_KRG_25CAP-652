
Branch: MCA (Data Science)	Semester:	2
Student Name: Adarsh Mishra	UID: 25MCD10065
Subject Name: Technical Training - I Lab	Subject Code: 25CAP-652
Section/Group: 25MCD KAR-1	Date of Performance: 04 April,2026
EXPERIMENT – 07

Aim
To implement different types of JOIN operations in PostgreSQL and retrieve meaningful data from a relational database consisting of Students, Courses, Enrollments, and Departments tables.

Tools Used
•	PostgreSQL


Objectives
•	Apply joins to a real-world database schema (e.g., Students, Courses, Enrollments, Departments)
  1. Write queries to list students with their enrolled courses (INNER JOIN).
  2. Find students not enrolled in any course (LEFT JOIN).
  3. Display all courses with or without enrolled students (RIGHT JOIN).
  4. Show students with department info using SELF JOIN or multiple joins.
  5. Display all possible student-course combinations (CROSS JOIN). (Oracle, SAP, IBM, Microsoft) 
Theory
In relational databases, data is stored in multiple tables to avoid redundancy. To combine data from these tables, SQL JOIN operations are used.
Types of JOINs:
•	INNER JOIN
Returns only the records that have matching values in both tables. 
•	LEFT JOIN (LEFT OUTER JOIN)
Returns all records from the left table and matched records from the right table. If no match exists, NULL values are returned. 
•	RIGHT JOIN (RIGHT OUTER JOIN)
Returns all records from the right table and matched records from the left table. 
•	CROSS JOIN
Returns all possible combinations of rows from both tables (Cartesian product). 
•	MULTIPLE JOIN
Used to combine more than two tables in a single query.
.
Experiment Steps: 
Step 1: Create Tables
•	Create Departments, Students, Courses, and Enrollments tables 
•	Define primary keys and foreign keys 
Step 2: Insert Data
•	Insert sample data into all tables 
•	Ensure some students are not enrolled (for LEFT JOIN testing) 
Step 3: Execute INNER JOIN
•	Retrieve students along with their enrolled courses 
•	Verify only matching records are displayed 
Step 4: Execute LEFT JOIN
•	Find students who are not enrolled in any course 
•	Check for NULL values in unmatched rows 
Step 5: Execute RIGHT JOIN
•	Display all courses including those without students 
•	Ensure unmatched courses are included 
Step 6: Execute MULTIPLE JOIN
•	Combine Students and Departments tables 
•	Display student names along with department details 
Step 7: Execute CROSS JOIN
•	Generate all possible student-course combinations 
•	Observe Cartesian product behavior 
Step 8: Verify Results
•	Compare outputs with expected results 
•	Ensure correctness of JOIN operations

Query:

CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


INSERT INTO Departments (department_name) VALUES
('Computer Science'),
('Mechanical'),
('Electronics');

INSERT INTO Students (name, department_id) VALUES
('Adarsh', 1),
('Ritesh', 2),
('Kunal', 1),
('Sameer', 3),
('Chaitanya', NULL); 

INSERT INTO Courses (course_name) VALUES
('DBMS'),
('Operating Systems'),
('Thermodynamics'),
('Digital Electronics');

INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(4, 4);


--Tables

select * from departments;
select * from students;
select * from courses;
select * from enrollments;

 
--Inner Join

SELECT s.student_id, s.name, c.course_name
FROM Students s
INNER JOIN Enrollments e 
    ON s.student_id = e.student_id
INNER JOIN Courses c 
    ON e.course_id = c.course_id;


-- Left Join

SELECT s.student_id, s.name
FROM Students s
LEFT JOIN Enrollments e 
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;


-- Right Join

SELECT c.course_id, c.course_name, s.name
FROM Students s
RIGHT JOIN Enrollments e 
    ON s.student_id = e.student_id
RIGHT JOIN Courses c 
    ON e.course_id = c.course_id;


	-- Multiple Join

SELECT s.student_id, s.name, d.department_name
FROM Students s
INNER JOIN Departments d 
    		ON s.department_id = d.department_id;



	-- Cross Join

SELECT s.name, c.course_name
FROM Students s
CROSS JOIN Courses c;

	  
  Learning Outcomes:

•	Understand the concept of relational databases and table relationships. 
•	Identify and differentiate between various types of SQL JOIN operations such as INNER JOIN, LEFT JOIN, RIGHT JOIN, and CROSS JOIN. 
•	Apply JOIN operations to retrieve data from multiple related tables. 
•	Use foreign keys and primary keys to establish relationships between tables. 
•	Analyze query results to understand how different JOINs affect output. 
•	Implement multiple table joins to solve real-world database problems. 
•	Interpret and validate query outputs for correctness.
