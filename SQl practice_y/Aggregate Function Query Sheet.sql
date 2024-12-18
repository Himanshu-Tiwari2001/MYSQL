SHOW DATABASES;
USE  techforallwithpriya;
SHOW TABLES;
SELECT *FROM employee;

CREATE TABLE courses (
CourseID INT  AUTO_INCREMENT,
CourseName VARCHAR(50) NOT NULL,
Course_duration_months INT  NOT NULL,
CourseFee INT NOT NULL,
PRIMARY KEY(CourseID)

);
SELECT *FROM Courses;
DESC courses;

INSERT INTO courses ( CourseName,Course_duration_months,CourseFee) VALUES ("The Complete Excel Mstery Course","3","1499");
INSERT INTO courses ( CourseName,Course_duration_months,CourseFee) VALUES ("DSA for Interview Preparation","2","1499");
INSERT INTO courses ( CourseName,Course_duration_months,CourseFee) VALUES ("SQl Bootcamp","1","1499");
SELECT * FROM courses;
UPDATE courses SET CourseFee="4999" WHERE CourseID=2;
UPDATE courses SET CourseFee="2999" WHERE CourseID=3;

CREATE TABLE Learners(
Learner_Id INT AUTO_INCREMENT,
LearnerFirstName VARCHAR(50) NOT NULL,
LearnerLastName VARCHAR(50) NOT NULL,
LearnerPhoneNo VARCHAR(15) NOT NULL,
LearnerEmailID VARCHAR(50),
LearnerEnrollmentDate TIMESTAMP NOT NULL,
SelectedCourses INT NOT NULL,
YearsOfExperience INT NOT NULL,
LearnerCompany VARCHAR(50),
SourceOfJoining VARCHAR(50) NOT NULL,
Batch_Start_Date TIMESTAMP NOT NULL,
Location VARCHAR(50) NOT NULL,
PRIMARY KEY(Learner_Id),
UNIQUE KEY(LearnerEmailID),
FOREIGN KEY(SelectedCourses) REFERENCES courses(CourseID));
DESC Learners;

-- insert the dta in learner table
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) 
VALUES 
("Akash", "Mishra", '9998887776', "akash@gmail.com", '2024-01-21', 1, 4, "Amazon", "LinkedIn", '2024-02-29', "Bengaluru");

INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Rishikesh","Joshi","9950192388", "carjkop@gmail.com", '2024-03-19', 3, 2, "HCL", "Youtube", '2024-03-25', "Chennai");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Jeevan","Hegde", "9657856732","jeevanhegdek@yahoo.co.in", '2024-01-15', 2, 0, "", "Linkedin", '2024-01-16', "Noida");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("Akhil","George","7689558930", "akhil.george.8743@gmail.com", '2024-03-13', 3, 4, "Accenture", "Community", '2024-03-25', "Bengaluru");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location)VALUES("Sidhish","Kumar","6475765443", "sidhishkumar@gmail.com",'2024-01-10', 1, 4, "Meta", "Youtube", '2024-03-29', "Bengaluru");
INSERT INTO Learners(LearnerFirstName,LearnerLastName,LearnerPhoneNo,LearnerEmailID,LearnerEnrollmentDate,SelectedCourses,YearsOfExperience,LearnerCompany,SourceOfJoining,Batch_Start_Date,Location) VALUES("NagaSai","Sreedhar","9182937061", "saisreedhar2001@gmail.com", '2024-03-17', 3, 4, "TCS", "Community", '2024-03-25', "Mumbai");
Select* from Learners;

-- Data Analysis [Employee, Course, Learners]
-- 1. Give me the record of the employee getting highest salary
SELECT * FROM employee
ORDER BY Salary DESC
LIMIT 1;

SELECT MAX(Salary) as max_salary FROM employee;
SELECT MIN(Salary) as min_salary FROM employee;

SELECT *
FROM employee
WHERE Salary = (
    SELECT MAX(Salary)
    FROM employee
    
);

SELECT * FROM employee;

-- 2. Give me the record of the employee getting highest salary and age is bigger than 30
SELECT * FROM employee 
WHERE age > 30 
ORDER BY Salary DESC 
LIMIT 1;

-- 3. Display the number of enrollments in the webiste of techforallwithpriya
SELECT COUNT(*) as num_of_enrollments 
FROM Learners;

-- 4. Display the number of enrollments for the courseid = 3[SQL Bootcamp]
SELECT COUNT(*) AS num_of_learners_SQL
FROM Learners 
WHERE SelectedCourses=3 ;

-- 5. Count the number of learners enrolled in the month of Jan
-- '2024-02-29'
SELECT COUNT(*) as num_learners_jan FROM Learners
WHERE LearnerEnrollmentDate LIKE '%-01-21%';

-- 6. Update the Jeevan data with years of experience as 1 and learner company as "Amazon"
Update Learners 
SET YearsOfExperience = 2, LearnerCompany = 'Amazon' 
WHERE Learner_Id = 4;

SELECT * FROM Learners;



-- 7. Count the number of companies where learners currently doing their job
-- Count -> count the non null entries
-- Unique count of the companies
SELECT COUNT(DISTINCT LearnerCompany) as distinct_companies 
FROM Learners;



























