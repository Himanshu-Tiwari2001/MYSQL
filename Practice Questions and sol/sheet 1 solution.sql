 create database mobile;
 use mobile;
 
 CREATE TABLE mobile_phone (
    Id INT PRIMARY KEY,
    Name VARCHAR(100),
    Company VARCHAR(50),
    Colour VARCHAR(50),
    Quantity INT,
    Price DECIMAL(10, 2)
);

INSERT INTO mobile_phone (Id, Name, Company, Colour, Quantity, Price) VALUES
(1, 'Samsung Galaxy A23', 'Samsung', 'Blue', 1, 20000),
(2, 'iPhone 13 mini', 'Apple', 'Pink', 2, 65000),
(3, 'iPhone 12', 'Apple', 'Black', 1, 54000),
(4, 'Motorola Edge 30 Fusion', 'Motorola', 'Viva Magenta', 2, 38000),
(5, 'Samsung Galaxy Z Flip3 5G', 'Samsung', 'Black', 4, 48000);

Select * from mobile_phone;

SELECT * 
FROM mobile_phone
WHERE Colour LIKE 'bl%';

SELECT Name ,Price
FROM mobile_phone
GROUP BY Name ,Price
HAVING AVG(Price) > 45000;

SELECT Name , avg(Price)
FROM mobile_phone
where Price>45000
GROUP BY Name ;

-- Q4. Consider the two tables: one is the 'teachers' table which has fields such as teachers_id, Name, teachers_age, and teachers_address. The other is the 'students' table which has fields such as students_id, Name, students_age, and students_address.
CREATE TABLE teachers (
    teachers_id INT PRIMARY KEY,
    Name VARCHAR(50),
    teachers_age INT,
    teachers_address VARCHAR(100)
);
INSERT INTO teachers (teachers_id, Name, teachers_age, teachers_address) VALUES
(100, 'Karishma', 35, 'Noida'),
(101, 'Yasha', 29, 'Meerut'),
(102, 'Kartik', 40, 'Noida'),
(103, 'Milan', 36, 'Lucknow');


CREATE TABLE students (
    students_id INT PRIMARY KEY,
    Name VARCHAR(50),
    students_age INT,
    students_address VARCHAR(100)
);

INSERT INTO students (students_id, Name, students_age, students_address) VALUES
(200, 'Harsh', 19, 'Noida'),
(201, 'Palak', 18, 'Lucknow'),
(202, 'Himanshi', 20, 'Roorkee'),
(203, 'Ansh', 19, 'Roorkee');

-- Write the query to combine the 'Name' column in the 'teachers' table with the 'Name' column in the 'students' table using the UNION operator.
SELECT Name 
FROM teachers
UNION
SELECT Name 
FROM students;

-- Write the query to find the teacher's name whose age is between 34 and 41 in the 'teachers' table.

SELECT Name , teachers_age 
FROM teachers
WHERE teachers_age BETWEEN 34 AND 41;


-- Q2 

CREATE TABLE employees (
    empId INT PRIMARY KEY,
    empName VARCHAR(50),
    empAge INT,
    empAddress VARCHAR(100),
    empSalary DECIMAL(10, 2)
);

INSERT INTO employees (empId, empName, empAge, empAddress, empSalary) VALUES
(1, 'John', 25, 'Noida', 50000),
(2, 'Jane', 30, 'Delhi', 60000),
(3, 'Alice', 28, 'Haryana', 55000),
(4, 'Bob', 35, 'Ballia', 70000),
(5, 'Eve', 40, 'Lucknow', 75000);


DELETE FROM employees
WHERE empId = 1;
select * from employees;

UPDATE employees
SET empAge = 45
WHERE empId = 5;


SELECT DISTINCT empAddress 
FROM employees;


SELECT * 
FROM employees
ORDER BY empId DESC;


SELECT * 
FROM employees
WHERE empSalary BETWEEN 55000 AND 75000;

ALTER TABLE employees
ADD Department VARCHAR(50);







