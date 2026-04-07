CREATE TABLE Employee2 (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO Employee2 (name, department, salary) VALUES
('Adarsh', 'IT', 50000),
('Kunal', 'HR', 40000),
('Sameer', 'Finance', 60000),
('Chaitanya' , 'Support' , 45000);

CREATE OR REPLACE PROCEDURE insert_employee(
    p_name VARCHAR,
    p_department VARCHAR,
    p_salary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    INSERT INTO Employee2(name, department, salary)
    VALUES(p_name, p_department, p_salary);
END;
$$;



CREATE OR REPLACE PROCEDURE update_employee_salary(
    p_id INT,
    p_salary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE Employee2
    SET salary = p_salary
    WHERE emp_id = p_id;
END;
$$;


CREATE OR REPLACE PROCEDURE delete_employee(
    p_id INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    DELETE FROM Employee2
    WHERE emp_id = p_id;
END;
$$;


CREATE OR REPLACE FUNCTION get_all_employees()
RETURNS TABLE(
    emp_id INT,
    name VARCHAR,
    department VARCHAR,
    salary INT
)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY
    SELECT * FROM Employee2;
END;
$$;


-- Inserting Employee
CALL insert_employee('Ritesh', 'Tech Support', 55000);

-- Updating Employee Salary
CALL update_employee_salary(1, 70000);

--Deleting Employee by ID
CALL delete_employee(2);

-- View Updated Table
SELECT * FROM get_all_employees();
