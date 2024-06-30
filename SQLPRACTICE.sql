CREATE TABLE EMPLOYEE(
       EMP_ID VARCHAR(5),
	   EMP_NAME VARCHAR(10),
	   SALARY  FLOAT,
	   DESIGNATION VARCHAR(10),
	   MANAGER_ID  VARCHAR(5)
	   );

INSERT INTO dbo.EMPLOYEE VALUES
('1', 'VARUN', 1000000, 'MANAGER', '3');

INSERT INTO dbo.EMPLOYEE VALUES
('2', 'SHRUTI', 800000, 'ANALYST', '1'),
('3', 'SHUBHANGI', 900000, 'CONSULTANT', '4');

SELECT * FROM EMPLOYEE;

/*1.
Employees table
employee_id
name
salary
designation
manager_id
 
list all employee names along with manager names*/

SELECT e.EMP_NAME, m.EMP_NAME AS MANAGER_NAME
FROM EMPLOYEE e
LEFT JOIN EMPLOYEE m ON e.manager_id = m.EMP_ID;

/*2. name Prachi Pradhan
tell how many times a appeared and positions*/

SELECT LEN('PRACHI PRADHAN') - LEN(REPLACE('PRACHI PRADHAN', 'A', '')) AS Count_of_a ;
WITH Positions AS (
  SELECT 1 AS Position
  UNION ALL
  SELECT Position + 1
  FROM Positions
  WHERE Position < LEN('Prachi Pradhan')
)
SELECT Position
FROM Positions
WHERE SUBSTRING('Prachi Pradhan', Position, 1) = 'a';

/*3. I am eating Mango
replace mango with Pineapple*/

SELECT REPLACE('I AM EATING MANGOES', 'MANGOES', 'PINEAPPLE');

/*4. 
Table A 
1
1
1
0
2
NULL

Table B
1
1
0
NULL

tell output of left join right join full outer inner all possible*/

INNER JOIN
A B
1 1
1 1
1 1
1 1
1 1
1 1
0 0

7 records

LEFT JOIN
A    B
1    1
1    1
1    1 
1    1
1    1
1    1
0    0
2    NULL
NULL NULL

9 RECORDS

RIGHT JOIN
A    B
1    1
1    1
1    1
1    1
1    1
1    1
0    0
NULL NULL 

8 RECORDS

FULL OUTER JOIN
A    B
1    1 
1    1
1    1
1    1 
1    1
1    1
0    0
2    NULL
NULL NULL
NULL NULL

10 RECORDS

CROSS JOIN
A    B
1    1
1    1
1    1
0    1
2    1
NULL 1
1    1
1    1
1    1
0    1
2    1
NULL 1
1    0
1    0
1    0
0    0
2    0
NULL 0
1    NULL
1    NULL
1    NULL
0    NULL
2    NULL
NULL NULL

24 RECORDS

SELF JOIN ON A
A1 A2
1 1
1 1
1 1
1 1
1 1
1 1
1 1
1 1
1 1
0 0
2 2

SELF JOIN ON B
B1 B2
1  1
1  1
1  1
1  1
0  0

CREATE TABLE A (
       ID INT
	   );

INSERT INTO A (ID) VALUES 
(1),
(1),
(1),
(0),
(2),
(NULL);

CREATE TABLE B (
       ID INT
	   );

INSERT INTO B (ID) VALUES 
(1),
(1),
(0),
(NULL);

SELECT * FROM A;
SELECT * FROM B;

--inner join
SELECT A.ID, B.ID
FROM A
INNER JOIN B ON A.ID = B.ID;

--left join
SELECT A.ID, B.ID
FROM A
LEFT JOIN B ON A.ID = B.ID;

--right join
SELECT A.ID, B.ID
FROM A
RIGHT JOIN B ON A.ID = B.ID;

--FULL OUTER JOIN
SELECT A.ID, B.ID
FROM A
FULL OUTER JOIN B ON A.ID = B.ID;

--CROSS JOIN
SELECT A.ID, B.ID
FROM A
CROSS JOIN B;

--SELF JOIN ON A
SELECT A1.ID, A2.ID
FROM A A1
INNER JOIN A A2 ON A1.ID =A2.ID;

--SELF JOIN ON B
SELECT B1.ID, B2.ID
FROM B B1
INNER JOIN B B2 ON B1.ID = B2.ID;






