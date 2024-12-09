create database students;
use students;

CREATE TABLE students(
  EID INT PRIMARY KEY AUTO_INCREMENT,
  Name  VARCHAR(50) NOT NULL,
  marks int NOT NULL,
  grade VARCHAR(2)  NOT NULL,
  city VARCHAR(25) NOT NULL 
)

INSERT INTO students( EID,Name, marks,grade, city) VALUES(1,"Himanshu",95, "A", "Noida");
INSERT INTO students( EID,Name, marks,grade, city) VALUES(2,"Vikash",95, "B", "Ballia");
INSERT INTO students( EID,Name, marks,grade, city) VALUES(3,"Rohan",90, "A", "Gaziabad");
INSERT INTO students( EID,Name, marks,grade, city) VALUES(4,"Rohit",80, "B", "Gurugram");
INSERT INTO students( EID,Name, marks,grade, city) VALUES(5,"Arun",75, "B", "Delhi");

select* from students;

SET SQL_SAFE_UPDATES=0;
DELETE  FROM students  WHERE marks<80;

SELECT marks FROM STUDENTS;

UPDATE students
SET marks = marks + 10;

SELECT city ,count(city)
from students 
group by city
having max(marks) > 90;


-- GENERAL ORDER OF QUERY IMPLEMENTATION
/*  SELECT
     FROM
     WHERE
     GROUP BY
     HAVING
     ORDER BY
*/
    







