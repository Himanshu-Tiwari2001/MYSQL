-- for such location what is the count of each employee and avg salary of the employee in those location 
USE techforallwithpriya;
select*from employee;

SELECT  location, Count(location) As Total, AVG(salary) AS "average Salary"
from employee
GROUP BY  location;

INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("priyanshu","Tiwari","23","200000","Ballia");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Shudanshu","Tiwari","23","300000","Lucknow");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Anu","Tiwari","24","300000","Banglore");

--  for such location what is the count of each employee and avg salary of the employee in those location 
-- but also display fistname ,last name corresponding to each record 
SELECT FirstName,LastName,employee.location, Total,Avg_Salary
FROM employee
JOIN
(SELECT  location, Count(location) As Total, AVG(salary) AS Avg_Salary
from employee
GROUP BY  location) AS temp_table
ON employee.location=temp_table.location;

-- optimize the above query 

SELECT FirstName,Lastname,location,
COUNT(location) OVER (PARTITION BY location) AS Total ,
AVG(salary) OVER (PARTITION BY location) AS AVG_SALARY
FROM employee;

-- Interview Question : Difference between ROW_NUMBER(), VS RANK(), VS DENSE_RANK() 
-- IF there is no dublicate entries all  ROW_NUMBER(), VS RANK(), VS DENSE_RANK()  return same answer so use according to the situation
 -- Row_Number() is always used with with order by bcz it always  mapped the  shorted value with number 
SELECT FirstName,LastName,salary,
Row_NUMBER() OVER (ORDER BY salary DESC) AS Priority_EMP
FROM employee ;


SELECT FirstName,LastName,salary,
RANK() OVER (ORDER BY salary DESC) AS Priority_EMP
FROM employee ;


SELECT FirstName,LastName,salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS Priority_EMP
FROM employee ;

-- Give the record of the employee having second highest salary 
SELECT * FROM 
(SELECT FirstName,LastName,salary,
DENSE_RANK() OVER (ORDER BY salary DESC) AS Priority_EMP
FROM employee ) AS temp
where Priority_EMP=2;

-- give the first employee having sen=cond highest salary 
SELECT * FROM 
(SELECT FirstName,LastName,salary,
ROW_NUMBER() OVER (ORDER BY salary DESC) AS Priority_EMP
FROM employee ) AS temp
where Priority_EMP=2;

-- specify the details  of highest salary people in each location
SELECT * FROM 
(SELECT FirstName,LastName,salary,location,
ROW_NUMBER() OVER ( PARTITION BY location ORDER BY salary DESC) AS Priority_EMP
FROM employee ) AS temp
where Priority_EMP=1;






