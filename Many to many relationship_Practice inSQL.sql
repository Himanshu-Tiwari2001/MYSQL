create database Institute;
use institute;
CREATE TABLE students(
 id int  PRIMARY KEY,
 student_name VARCHAR(50)
 );
 INSERT INTO students(id ,student_name)
 VALUES (1,"Raju"),(2,"Sham"),(3,"Alex");
 
 
 CREATE TABLE courses(
 id INT AUTO_INCREMENT PRIMARY KEY,
 course_name VARCHAR(100),
 fee INT
 );
 INSERT INTO courses (id,course_name, fee)
 VALUES (101,"Java",2000);
 INSERT INTO courses (course_name,fee)
 VALUES ("MYSQL",2500), ("Python",1000),("Linux",4000),("Excel",500);
 
 CREATE TABLE students_course(
 student_id INT,
 course_id INT,
 FOREIGN KEY (student_id) REFERENCES students(id) on DELETE CASCADE,
 FOREIGN KEY (course_id) REFERENCES courses(id)
 );
 
 INSERT INTO  students_course(student_id,course_id)
 values(1,101),(1,102),(2,105),(1,105),(2,103),(3,101),(3,102),(3,104);
 
 
 -- use of join with the 
 use institute;
 SELECT student_name ,course_name from students
 JOIN 
 students_course on students_course.student_id=students.id
 JOIN
 courses on students_course.course_id=courses.id;
 
 -- no of students for each courses
 select course_name,count(student_name) from students
 join 
 student_name on students_course.student_id = students.id
 join
 courses on students_course.course_id=courses.id
 group by course_name;
 
 -- print no of courses taken by each students
 select student_name,count(course_name) from students
 join 
 students_course on students_course.student_id = students.id
 join
 courses on students_course.course_id=courses.id
 group by  course_name;
 
 
 
 -- views in MYSQL
 create VIEW inst_info as
 select student_name,course_name,fee from students
 join
 students_course on students_course.student_id=students.id
 join
 courses on students_course.course_id =courses.id;
 
 show tables;
  select * from inst_info;
  select student_name from inst_info;
  
  select * from inst_info where student_name="Raju";
 
 -- to drop the view
 DROP view inst_info;
 
 select* from inst_info;
 
 -- find total fee paid by each student 
 select student_name, sum(fee) as total_fees
 from inst_info
 group by student_name;
 
 -- find the name of the student who paid fee more than 5000
 select student_name ,sum(fee) from inst_info 
 group by student_name
  having sum(fee)>5000;
  /*
  The MySQL ROLLUP function is used to generate aggregate summaries
  that can be rolled up to higher levels of detail. 
  It is typically used in conjunction with the GROUP BY clause to perform aggregate operations 
  such as SUM, COUNT, and AVG. 
  The ROLLUP function allows you to calculate subtotals and grand totals for your data,
  making it easier to analyze and understand complex data sets.
  */
  select student_name ,sum(fee) 
  from inst_info
  group by student_name with ROLLUP;
  
  select ifnull(student_name,"Total") ,sum(fee) 
  from inst_info
  group by student_name with ROLLUP;
  
  select ifnull(student_name,"Total") as student_name ,sum(fee) as Total_fee ,avg(fee) as Average_fee ,count(course_name) as Enrolled_in_courses
  from inst_info
  group by student_name with ROLLUP;
  
  select * from students;
  
  
  

  
  
 
 
 
 
 
 
 