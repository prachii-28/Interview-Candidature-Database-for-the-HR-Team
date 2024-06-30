SELECT * FROM SAMPLE_DB.dbo.Sheet1$;


select * from employee2;

CREATE TABLE dept (
    dept_name VARCHAR(50),
    emp_count INT
);


-- Create dept table
INSERT INTO dept (dept_name, emp_count)
SELECT dept_name, COUNT(*) as emp_count
FROM employee2
GROUP BY dept_name;
select * from dept;

-- Create the trigger
GO
CREATE TRIGGER tr_employee2_forinsert
ON employee2
FOR INSERT
AS
BEGIN
    -- Check if the department already exists in the `dept` table
    IF EXISTS (SELECT 1 FROM dept WHERE dept_name = (SELECT dept_name FROM inserted))
    BEGIN
        -- If exists, update the count
        UPDATE dept
        SET emp_count = emp_count + 1
        WHERE dept_name = (SELECT dept_name FROM inserted);
    END
    ELSE
    BEGIN
        -- If not exists, insert a new row
        INSERT INTO dept (dept_name, emp_count)
        VALUES ((SELECT dept_name FROM inserted), 1);
    END
END;

insert into employee2(emp_ID, emp_NAME, DEPT_NAME, SALARY)
          values(126, 'Karan', 'HR', 10000);


SELECT * FROM dept;




select * from employee2;


-- Declare variables to hold the data from the cursor
DECLARE @EmployeeID INT, @EmpName NVARCHAR(50), @DeptName NVARCHAR(50);

-- Declare the cursor
DECLARE EmployeeCursor CURSOR FOR
SELECT emp_ID, emp_NAME, DEPT_NAME
FROM employee2;

-- Open the cursor
OPEN EmployeeCursor;

-- Fetch the first row from the cursor
FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @FirstName, @LastName;

-- Loop through all rows in the cursor
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Process the row
    PRINT 'Employee ID: ' + CAST(@EmployeeID AS NVARCHAR) + ', Name: ' + @FirstName + ' ' + @LastName;

    -- Fetch the next row from the cursor
    FETCH NEXT FROM EmployeeCursor INTO @EmployeeID, @EmpName, @DeptName;
END;

-- Close the cursor
CLOSE EmployeeCursor;

-- Deallocate the cursor
DEALLOCATE EmployeeCursor;








































