SHOW DATABASES;
USE  techforallwithpriya;
SHOW TABLES;
select * from courses;
select * from employee;
select* from learners;

 /*Questions 
1) ✴️ Which Courses have the highest enrollment rates ?
2) ✴️ How mAny Learners Are enrolled in each courses ?
3) ✴️ What is the total revenue generated from the course fee ?
4) ✴️ Which location contributed the most to course revenue ?
5) ✴️ which course contributed the most to the learners's enrollment ?
6) ✴️ Rank learners based on their enrollment date within each courses.
7) ✴️ Compare each employe'salary with the average salary in their location.
*/

-- Q1 answer
select SelectedCourses, count(*) AS EnrolmentCount
from learners
group by SelectedCourses
order by EnrolmentCount desc
limit 1;

-- approach 1 but this is more optimized one bcz it first filter out and stored into other table and then we use join on temptable which have lesser no of record
-- courseId , Coursename, Enrollment count 
select CourseID,CourseName,temptable.EnrollmentCount
from courses
join
(
Select SelectedCourses,Count(*) As EnrollmentCount
From learners
Group by SelectedCourses
order by EnrollmentCount DESC
limit 1) as temptable
on courses.CourseId =temptable.SelectedCourses;


-- approach 1
-- courseId , Coursename, Enrollment count

select CourseId , CourseName,  count(*) AS EnrolmentCount
from learners
join courses
on learners.SelectedCourses = courses.CourseID
group by CourseId , CourseName
order by EnrolmentCount desc
limit 1;



