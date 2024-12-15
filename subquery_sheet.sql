create database subquery;
use subquery;


CREATE TABLE student(
StudentID INT PRIMARY KEY,
FirstName VARCHAR(20),
LastName VARCHAR(20),
marks INT,
grade varchar(2),
city varchar(20)
);

CREATE TABLE Course(
CourseID INT PRIMARY KEY,
CourseName VARCHAR(50),
Credits INT
);

CREATE TABLE StudentCourse (
StudentID INT,
CourseID INT,
PRIMARY KEY(StudentID , CourseID),
FOREIGN KEY(StudentID) REFERENCES  Student(StudentID),
FOREIGN KEY(CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Student(StudentID, FirstName, LastName,Marks,grade,city)
VALUES
(1, "Nidhi" , "Jha" , 87 , "A", "Darbhanga"),
(2, "Parishk" , "Chauhan" ,78, "B" , "Noida"),
(3, "Himanshu" , "Tiwari" , 91, "A" , "Balia"),
(4, "Tanu" , "Tiwari" , 61, "C" , "Chipyana"),
(5, "Nandini" , "Sharma" , 81, "B" , "Chipyana");

INSERT INTO Student(StudentID, FirstName, LastName,Marks,grade,city)
VALUES
(6, "Nandini" , "Sharma" , 81, "B" , "Noida");
select * from student;

-- select student having even roll no marks and name

select firstName, studentID ,marks from student where marks
in (Select marks from Student where StudentID % 2=0);

create view  view1 as
select StudentID ,firstName from student;

select * from view1;




    
























