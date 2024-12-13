SHOW DATABASES;
CREATE DATABASE  IF NOT EXISTS techforallwithpriya;
USE techforallwithpriya;
SELECT DATABASE();

-- THIS IS SINGLE LINE COMMENT
/* 
---THIS IS MULTILINE COMMENT
*/

CREATE TABLE employee(
  EID INT PRIMARY KEY,
  FirstName  VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Age   INT NOT NULL,
  Salary INT NOT NULL,
  Location VARCHAR(50) NOT NULL 
);
SHOW TABLES;
DESC employee;
DROP TABLE employee;

CREATE TABLE employee(
  EID INT AUTO_INCREMENT,
  FirstName  VARCHAR(50) NOT NULL,
  LastName VARCHAR(50) NOT NULL,
  Age   INT NOT NULL,
  Salary INT NOT NULL,
  Location VARCHAR(50) NOT NULL,
  PRIMARY KEY(EID)
);
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Himanshu","Tiwari","23","200000","Ballia");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Sitanshu","Tiwari","23","300000","Lucknow");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Priya","Tiwari","24","300000","Banglore");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Swarnlata","Tiwari","28","50000","Noida");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Anita","Tiwari","51","300000","Delhi");
INSERT INTO employee(FirstName, LastName, Age, Salary, Location) VALUES("Amrita","Tiwari","20","400000","New Delhi");
SELECT*FROM employee;

-- Give me the employee detail whose salary is more than 100000
-- data retrievel  here we can say that "R from CRUD"

SELECT * FROM employee WHERE Salary >100000;


SELECT FirstName,LastName FROM employee
WHERE Salary> 100000;

SELECT*FROM employee WHERE Age>25;

-- update command 
UPDATE employee SET LastName="Rai" WHERE EID=4;

-- DELETE THE RECORD 

DELETE  FROM employee  WHERE EID=5;





