select * from employee2;

/*  write a proc to insert new employees into the employee table , If the employee already exists then update employee's salary.
empis, empname, salary  */

GO
create procedure spadd_emp
@emp_id INT,
@emp_name VARCHAR(50),
@dept_name VARCHAR(50),
@salary int
AS
BEGIN
    if EXISTS (select 1 from employee2 where emp_ID = @emp_id)
    begin
        update employee2
	    set SALARY = @salary
	    where emp_ID = @emp_id;
    end
    else
    begin
        INSERT INTO employee2(emp_ID, emp_NAME, DEPT_NAME, SALARY)
        VALUES(@emp_id, @emp_name, @dept_name, @salary);
    end
end

exec spadd_emp 103, Akbar, HR, 10000;

select * from employee2;

/* 2. 300 million records , if i want to delete 20 million records with createddate<31-12-2022*/

DECLARE @BatchSize INT = 100000;
DECLARE @RowCount INT;

SET @RowCount = 1;

WHILE (@RowCount > 0)
BEGIN
    BEGIN ;
    DELETE TOP (@BatchSize)
    FROM YourTable
    WHERE createddate < '2022-12-31';

    SET @RowCount = @@ROWCOUNT;
    COMMIT;

END

/*datwarehouse, datamart, SCD, keys, fact and dimension table*/
/*Create tkinter table in databasewith id/serial no column that is primary key and automatically increments*/




















/*8SELECT 1 FROM employee2 WHERE emp_ID IN (102, 101);


GO
ALTER Procedure spempdata
AS
BEGIN
select * from employee2 WHERE DEPT_NAME = 'IT';
END

EXEC spempdata


[4:02 PM] Surbhi Sharma
2. 300 million records , if i want to delete 20 million records with createddate<31-12-2022
[4:02 PM] Surbhi Sharma
how to do that
[4:04 PM] Surbhi Sharma
datwarehouse, datamart, SCD, keys, fact and dimension table*/