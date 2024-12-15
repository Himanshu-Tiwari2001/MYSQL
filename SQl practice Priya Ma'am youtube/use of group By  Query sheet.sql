SHOW DATABASES;
USE  techforallwithpriya;
SHOW TABLES;

SHOW TABLES;

SELECT* FROM Learners;

-- count the number of sudents who joined the courses via linkdin .youtube , commumity
SELECT sourceOfJoining, COUNT(*) as num_of_students
FROM Learners
GROUP BY SourceOfJoining;

-- Grouping via sourcejoining and the location 

SELECT sourceOfJoining,location , COUNT(*) as num_of_students
FROM Learners 
GROUP BY SourceOfJoining,location;

-- corresponding to each courses how many students have enrolled 

SELECT*FROM Courses;

SELECT selectedCourses , COUNT(*) AS num_of_students
FROM Learners
GROUP BY selectedCourses;

-- coreesponding to the individual source of joining, give the mximum years of experience any person hold
SELECT SourceOfJoining , MAX(YearsOfExperience) AS mx_year_exp
FROM Learners
GROUP BY SourceOfJoining;


-- coreesponding to the individual source of joining, give the minimum years of experience any person hold
SELECT SourceOfJoining , MIN(YearsOfExperience) AS mx_year_exp
FROM Learners
GROUP BY SourceOfJoining;


-- coreesponding to the individual source of joining, give the average years of experience any person hold
-- acc to company purpose it make sense
SELECT SourceOfJoining , AVG(YearsOfExperience) AS avg_year_exp
FROM Learners
GROUP BY SourceOfJoining;



-- coreesponding to the individual source of joining, give the summation of  years of experience any person hold
-- acc to company purpose it does not make sense

SELECT SourceOfJoining , SUM(YearsOfExperience) AS total_year_exp
FROM Learners
GROUP BY SourceOfJoining;





