
-- Step 1: Create Table
DROP TABLE IF EXISTS employee;

CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    salary INT
);

-- Step 2: Insert Sample Data
INSERT INTO employee VALUES
(1,'Aman',30000),
(2,'Riya',45000),
(3,'Karan',25000),
(4,'Neha',50000),
(5,'Arjun',28000);

-- Step 3: Cursor Procedure
CREATE OR REPLACE PROCEDURE update_salary_cursor()
LANGUAGE plpgsql
AS $$
DECLARE
    emp_record RECORD;
    emp_cursor CURSOR FOR
        SELECT emp_id, salary FROM employee;
BEGIN

    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO emp_record;
        EXIT WHEN NOT FOUND;

        -- Business Logic
        IF emp_record.salary < 40000 THEN
            UPDATE employee
            SET salary = salary + (salary * 0.10)
            WHERE emp_id = emp_record.emp_id;
        END IF;

    END LOOP;

    CLOSE emp_cursor;

END;
$$;

-- Step 4: Call Procedure
CALL update_salary_cursor();

-- Step 5: Display Result
SELECT * FROM employee;