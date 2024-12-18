-- all type of alter command in sql 
create database Alter_table_commands;

use  Alter_table_commands;

create table students(
rollno int,
name varchar(30)

);
insert into students(rollno,name)
values (1,"Aman"),(2,"Amar");
select * from students;
alter table students add marks int;
alter table students add city varchar(30);

insert into students (rollno,name,marks,city)
values (3,"Aditya",90,"noida"),(4,"Vikash",63,"Delhi");

alter table students change name full_name varchar(30);
alter table students add primary key (rollno);-- adding primary key constraints to particular column
desc students;

alter table students modify city varchar (40);

alter table students modify city varchar (40);-- here modify the data type(varchar) capacity

alter table students modify rollno int AUTO_INCREMENT; -- here changing the constraints
desc students;

alter table students add gender varchar(10) after full_name; -- Use OF ADD AFTER CLAUSE  TO ALTER THE TABLE

-- ALTER COMMAND - DROP CLAUSE
ALTER TABLE students drop primary key ;
-- There is only one Primary Key in a table. Hence, we don’t need to specify the name of the column while dropping the Primary Key using the ALTER command

-- Dropping a column from the table
alter table students drop gender;
desc students; -- to check the schema of the table


-- rename command
/*  The rename command is used to change the name of an existing database table to a new name. 
 • Renaming a table does not make it to lose any data is contained within it.*/

rename table students to students_details;
select * from students_details;

-- rename database Alter_table_commands to all_about_Alter_table_commands;
-- we cannot directly rename the database name in MYSQL

--  SO FOR THIS Create a new database:
CREATE DATABASE all_about_Alter_table_commands;

-- Copy all tables from the old database to the new database:
RENAME TABLE Alter_table_commands.students_details TO all_about_Alter_table_commands.students_details;
-- to use the new database
use all_about_Alter_table_commands;

 select * from students_details
 








