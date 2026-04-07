-- Departments Table
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- Students Table
CREATE TABLE Students (
    student_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Courses Table
CREATE TABLE Courses (
    course_id SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL
);

-- Enrollments Table
CREATE TABLE Enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    student_id INT,
    course_id INT,
    FOREIGN KEY (student_id) REFERENCES Students(student_id),
    FOREIGN KEY (course_id) REFERENCES Courses(course_id)
);


-- Insert into Departments
INSERT INTO Departments (department_name) VALUES
('Computer Science'),
('Mechanical'),
('Electronics');

-- Insert into Students
INSERT INTO Students (name, department_id) VALUES
('Adarsh', 1),
('Ritesh', 2),
('Kunal', 1),
('Sameer', 3),
('Chaitanya', NULL); 

-- Insert into Courses
INSERT INTO Courses (course_name) VALUES
('DBMS'),
('Operating Systems'),
('Thermodynamics'),
('Digital Electronics');

-- Insert into Enrollments
INSERT INTO Enrollments (student_id, course_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 1),
(4, 4);


select * from departments;
select * from students;
select * from courses;
select * from enrollments;


SELECT s.student_id, s.name, c.course_name
FROM Students s
INNER JOIN Enrollments e 
    ON s.student_id = e.student_id
INNER JOIN Courses c 
    ON e.course_id = c.course_id;

SELECT s.student_id, s.name
FROM Students s
LEFT JOIN Enrollments e 
    ON s.student_id = e.student_id
WHERE e.student_id IS NULL;

SELECT c.course_id, c.course_name, s.name
FROM Students s
RIGHT JOIN Enrollments e 
    ON s.student_id = e.student_id
RIGHT JOIN Courses c 
    ON e.course_id = c.course_id;

SELECT s.student_id, s.name, d.department_name
FROM Students s
INNER JOIN Departments d 
    ON s.department_id = d.department_id;

SELECT s.name, c.course_name
FROM Students s
CROSS JOIN Courses c;



