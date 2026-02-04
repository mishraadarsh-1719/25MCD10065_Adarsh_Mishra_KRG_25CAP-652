
Branch: MCA (Data Science)	
Semester: 2
Student Name: Adarsh Mishra	
UID: 25MCD10065
Subject Name: Technical Training - I	
Subject Code: 25CAP-652
Section/Group: 25MCD – 1(A)	
Date of Performance: 27 January,2026

                                        Experiment No. : 3


1.	Aim/Overview of the practical:
To implement conditional decision-making logic in PostgreSQL using IF–ELSE constructs and CASE expressions for classification, validation, and rule-based data processing.
2.	Tools Used
PostgreSQL

3.	Objective:
o	To understand conditional execution in SQL

o	To implement decision-making logic using CASE expressions

o	To simulate real-world rule validation scenarios

o	To classify data based on multiple conditions

o	To strengthen SQL logic skills required in interviews and backend systems

4.	Code for experiment/Practical: 


CREATE TABLE dept_violations (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(100),
    violation_count INT NOT NULL
);
INSERT INTO dept_violations (dept_name, violation_count) VALUES
('HR', 0),
('IT', 2),
('Finance', 5),
('Operations', 1);

--

SELECT 
    dept_violations,
    violation_count,
    CASE 
        WHEN violation_count = 0 THEN 'No Violation'
        WHEN violation_count BETWEEN 1 AND 2 THEN 'Minor Violation'
        ELSE 'Critical Violation'
    END AS violation_category
FROM dept_violations;

--

ALTER TABLE dept_violations
ADD COLUMN approval_status VARCHAR(50);

--

UPDATE dept_violations
SET approval_status = 
    CASE
        WHEN violation_count = 0 THEN 'Approved'
        WHEN violation_count BETWEEN 1 AND 3 THEN 'Under Review'
        ELSE 'Rejected'
    END;

--

Select * from dept_violations;




Learning outcomes (What I have learnt):

•	Understand how to use CASE expressions to classify data 
•	Learn to apply conditional logic in SQL for categorizing and evaluating database records.
•	Perform automated data updates using CASE inside UPDATE statements.
