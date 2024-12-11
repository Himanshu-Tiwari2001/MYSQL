use triggerdatabase;

CREATE TABLE usersdetails  (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    per_hour_salary INT DEFAULT 0,
    working_hour INT DEFAULT 0,
    total_salary INT DEFAULT 0,
    account_count INT DEFAULT 0
);

insert into usersdetails (user_id,name,per_hour_salary,working_hour)
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
select * from usersdetails ;
CREATE TABLE accounts (
    account_no INT PRIMARY KEY,
    user_id INT,
    balance INT DEFAULT 0,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);

insert into accounts (account_no,user_id, balance) values(2002014,1001,50000),(2002015,1001,150000);
insert into accounts (account_no,user_id, balance) values(2002016,1003,40000),(2002017,1003,50000);
select * from accounts;

delimiter //
create trigger before_insert_usersdetails
before insert
on usersdetails for each row
begin

set NEW.total_salary=NEW.per_hour_salary * NEW.working_hour;

end; //
delimiter ;


delimiter //
create trigger before_update_usersdetails
before update 
on usersdetails for each row 
begin 
set NEW.total_salary= NEW.per_hour_salary*NEW.working_hour;
end ;//
delimiter ;

-- create trigger : to update account_count in  usersdetails
delimiter //
create trigger before_open_account
before insert 
on accounts for each row
begin
update usersdetails set account_count =account_count+1 where user_id =NEW.user_id;
end ; //
delimiter ;

-- create delete trigger and it works when we close the accounts of each user and the value of account_count decreases acc to that ;

-- create close account trigger 
delimiter //
create trigger before_close_account
before delete
on accounts for each row
begin
update usersdetails set account_count=account_count-1 where user_id=OlD.user_id;
end ; //
delimiter ;

delete from accounts where account_no =2002015;
select * from usersdetails;
select * from accounts;



