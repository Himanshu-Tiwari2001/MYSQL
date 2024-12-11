create database triggerdatabase;
use triggerdatabase;

create TABLE users(
user_id int primary key,
name VARCHAR(50),
per_hour_salary int default 0,
working_hour int default 0,
total_salary int default 0

);

insert into users (user_id,name,per_hour_salary,working_hour)
values (1002,"Vishal",10000,6);

insert into users (user_id,name,per_hour_salary,working_hour)
values (1003,"Ravi",8000,8),
 (1004,"Riya",9000,9);
 
 insert into users (user_id,name,per_hour_salary,working_hour)
values (1001,"Priya",8000,8),
 (1003,"Shyam",9000,9),
 (1005,"john",9000,11),
 (1006,"Ram",6800,10),
 (1007,"Vikash",5800,8),
 (1008,"Aditya",6000,12),
 (1009,"Arun",8500,9),
 (1010,"Raunak",9000,9),
 (1011,"Anjan",9500,7),
 (1012,"Nilesh",10000,14);
 

 delete from users;
select * from users;

-- now to create trigger that automatically calculate the total_salary of the users whenever we insert value in to table users

delimiter //
create trigger before_insert_users
before insert
on users for each row
begin

set NEW.total_salary=NEW.per_hour_salary * NEW.working_hour;

end; //
delimiter ;

-- concept of NEW and OLD keywords in trigger 
-- the use of these keywords depends upon what type of trigger we are using
-- 1]--> in insert trigger,  new row access so we use NEW keywods in inset triggers

-- 2] --> in update trigger new and old rows access so we use NEW And OLD keywords in update triggers

-- 3] --> in delete we are going to delete the exixting rows so we use only OLD Keywords in delete triggers

-- Q create update trigger 
-- update total salary when there will be updation in perhour salary or workin hours

delimiter //
create trigger before_update_users
before update 
on users for each row 
begin 
set NEW.total_salary= NEW.per_hour_salary*NEW.working_hour;
end ;//
delimiter ;

update users
set working_hour=14
where user_id=1002;

update users
set working_hour=14,per_hour_salary=12000
where user_id=1002;

select * from users;


-- delete trigger 

DELIMITER //
CREATE TRIGGER before_delete_users
BEFORE DELETE
ON users FOR EACH ROW
BEGIN
    -- Example action: Perform necessary checks or cleanup without logging
    -- Add custom logic if needed, or leave empty
END; //
DELIMITER ;

--  Question --> Create a DELETE trigger to log deletions
-- Create the log table for deletions whenever user delete records then add information about the delete operation into new log table
CREATE TABLE user_deletions_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    name VARCHAR(50),
    per_hour_salary INT,
    working_hour INT,
    total_salary INT,
    deleted_at DATETIME
);

-- after delete trigger 
DELIMITER //
CREATE TRIGGER after_delete_users
AFTER DELETE
ON users FOR EACH ROW
BEGIN
    -- Example action: Log the deleted user info into another table (audit table)
    INSERT INTO user_deletions_log (user_id, name, per_hour_salary, working_hour, total_salary, deleted_at)
    VALUES (OLD.user_id, OLD.name, OLD.per_hour_salary, OLD.working_hour, OLD.total_salary, NOW());
END; //
DELIMITER ;




DELETE from users
where user_id=1003;
DELETE from users
where user_id=1006;
DELETE from users
where user_id=1005;
 -- to check the user deletion log
select * from user_deletions_log;
select * from users;