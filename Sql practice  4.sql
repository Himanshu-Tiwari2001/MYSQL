Create database employee
USE employee
CREATE TABLE empdetail(
emp_id INT NOT NULL PRIMARY KEY auto_increment,
fname varchar(20) not null ,
lname varchar(20) not null, 
desig varchar(50) not null ,
dept varchar(30) not null,
salary int not null
);
desc empdetail;
drop table empdetail;
INSERT INTO empdetail
values( 1 ,"Rohit","Sharma","manager","Loan",50000);
insert into empdetail values( 2 ,"Sham","Mohan","Cashier","Cash",60000);
insert into empdetail values( 3 ,"Baburao","Apte","Accountant","Account",65000);
insert into empdetail values( 4,"Paul","Philip","manager","Loan",55000);
insert into empdetail values( 5,"Alex","Watson","m","Accountant",52000);
insert into empdetail values( 6 ,"John","Sharma","Asssociate","Deposit",50000);
insert into empdetail values( 7 ,"Alex","watson","Probation","Loan",58000);
insert into empdetail values( 8 ,"Leena","Jhonsan","Lead","Cash",59000);

select * from empdetail;

-- count the total number of employee
select count(emp_id) from empdetail;

-- find number of employee in each department 
select dept ,count(emp_id) from empdetail
group by dept;

-- find max  salary 
select  max(salary) from empdetail ;

-- find lowest  salary 
select min(salary) from empdetail;

-- find max  salary  with the emp detail
select*from empdetail
where salary =(select max(salary) from empdetail);

-- find the sum of salary paying in load department

Select dept, sum(salary) from empdetail
where dept="Loan"
group by dept;

-- find the average of salary of each dept
select dept ,avg(salary) as average_salary from empdetail
group by dept ;

-- use of decimal value in table

create table decimalvalue (price decimal(3,3));
desc decimalvalue;

drop table decimalvalue;
create table decimalvalue (price decimal(5,2));
desc decimalvalue;


insert into  decimalvalue values(155.44);
insert into  decimalvalue values(156.444);
select * from decimalvalue;

create table float_double (f float , d double);
insert into float_double values (124.55568,125.00014557788);
insert into float_double values (124.5556,125.000145);
select * from float_double;

CREATE TABLE  person(
  jd date,
  jt time,
  jdt datetime
);
desc person;
insert into person values( '2024-12-08', '10:20:12','2022-08-08 23:42:50');
insert into person values( '2024-11-08', '10:00:12','2024-08-08 23:42:50');
select*from person ;
insert into person values( curdate(), curtime(), now());

select dayname(curdate());
select dayofmonth(curdate());
select dayofweek(now());

select  monthname(curdate());
select hour(current_timestamp());

-- date time stamp DEFAULT & ON UPDATE TIMESTAMP

CREATE TABLE BLOG (
blog varchar(100),
ct datetime DEFAULT current_timestamp,
ut datetime on update current_timestamp
);

insert into BLOG (blog)
values ("This is my first blog");
select * from BLOG;

update BLOG
set blog ="This is my second blog from india";








