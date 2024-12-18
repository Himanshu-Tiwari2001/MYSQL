SHOW DATABASES;
USE  techforallwithpriya;
SHOW TABLES;

select * from courses;

-- case statement in sql 
select CourseID,CourseName ,CourseFee,
  case
    when CourseFee >4000 then "Premium Course"
    when CourseFee >2500 then "Plus Course"
    when CourseFee <2500 then "Regular Course"
End as "Course Type"
from Courses;


    -- Case Expression in sql
    select CourseID,CourseName ,CourseFee,
  case CourseFee
    when 4999 then "Premium Course"
    when 2999 then "Plus Course"
    when 1499 then "Regular Course"
End as "Course Type"
from Courses;

select * from Learners;
-- common table expressions 

create table Orders(
  OrderID Int AUTO_INCREMENT primary key,
  Order_Date Timestamp not null,
  Order_Learner_ID int not null,
  OrderStatus VARCHAR(30) not null,
  FOREIGN KEY(Order_Learner_ID) REFERENCES Learners(Learner_ID)
  );
insert into Orders(Order_Date,Order_Learner_ID,OrderStatus )
values("2024-12-10",1,"Complete"),
("2024-12-11",2,"Complete"),
("2024-12-12",3,"Complete"),
("2024-12-13",4,"Complete"),
("2024-12-14",5,"Complete"),
("2024-12-15",6,"Complete"),
("2024-12-16",5,"Pending"),
("2024-12-15",4,"Pending"),
("2024-12-10",3,"Pending");

-- question--> total order per student  ---Order_Learner_ID,,Total order 
 select Order_Learner_ID, count(OrderID) as "Total orders"
 from orders
 group by Order_learner_ID;
 
 -- question--> total order per student  ---Order_Learner_ID,,Total order , learnerFirstname, learnerLastname 
 
 select LearnerFirstName, LearnerLastName,temptable.Order_Learner_ID,temptable.Total_orders
 from learners
 join
 (select Order_Learner_ID, count(OrderID) as Total_orders
 from Orders
 group by Order_learner_ID) as temptable
 on Learners.Learner_Id = temptable.Order_Learner_ID;

-- question--> total order per student  ---Order_Learner_ID,,Total order , learnerFirstname, learnerLastname ,avg_orders_entire_students
 select LearnerFirstName, LearnerLastName,temptable.Order_Learner_ID,temptable.Total_orders, avg(sum(temptable.Total_orders)) over() as avg_orders_entire_students
 from learners
 join
 (select Order_Learner_ID, count(OrderID) as Total_orders
 from Orders
 group by Order_learner_ID) as temptable
 on Learners.Learner_Id = temptable.Order_Learner_ID
 GROUP BY temptable.Order_Learner_ID;
 
 

