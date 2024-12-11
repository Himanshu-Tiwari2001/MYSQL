create database relationship;
use relationship;
CREATE TABLE customers(
cust_id int AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(50),
email VARCHAR (30)
);

create TABLE orders(
ord_id INT AUTO_INCREMENT PRIMARY KEY,
date DATE,
amount DECIMAL(10,2),
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES customers(cust_id)
);
desc orders;

-- to check foreign key is added or not 
	SELECT CONSTRAINT_NAME ,COLUMN_NAME, REFERENCED_TABLE_NAME FROM INFORMATION_SCHEMA.KEY_COLUMN_USAGE WHERE TABLE_NAME="orders";
    
    INSERT INTO customers (name,email) values ("Raju","raju@gmail.com"),
    ("sham","Sham@gmail.com");
    
    INSERT INTO customers (name,email) values ("Baburao","baburao@gmail.com"),
    ("Paul","paul@gmail.com"),("Alex","Alex@gmail.com");
    
     INSERT INTO customers (name,email) values ("Ashish","Aashish@gmail.com"),
    ("Puneet","puneet@gmail.com"),("vikash","vikash@gmail.com");
    SELECT * from customers;
    
    INSERT INTO orders (date,amount,cust_id)
    VALUES(curdate(),52.38,1);
    select * from orders;
	
    INSERT INTO orders (date,amount,cust_id)
    values(curdate(),58.96,2);
    
    INSERT INTO orders (date,amount,cust_id)
    values(curdate(),68.96,2);
    
     INSERT INTO orders (date,amount,cust_id)
    values(curdate(),168.96,3),("2024-8-10",150.85,4),(curdate(),170.87,5),(curdate(),190.87,5),(curdate(),140.87,4);
    select * from orders;
    
    
    -- use of joins in table 
    -- cross join
    select * from customers,orders;
    
    use relationship; 
    -- inner join it exclude the record which are not common in both table
    SELECT * FROM customers
    INNER JOIN 
    orders
    on orders.cust_id =customers.cust_id;
    
    -- if we have the two table and we will have to find the total order placed by people acc to their name  
    -- inner join with GROUP BY
    select name , sum(amount) from customers
    inner join orders
    on orders.cust_id=customers.cust_id
    GROUP BY name;
    
    -- LEFT JOIN
    -- it returns all rows from the left (or first) table and the matching rows from the right table
    
    SELECT *FROM customers
    LEFT JOIN 
    orders
    on orders.cust_id=customers.cust_id;
    
	SELECT name ,sum(amount)
    from customers
    LEFT JOIN 
    orders
    on orders.cust_id=customers.cust_id
    GROUP BY name;
    
    -- it returns all rows from the right(or second) table and the matching rows from the left table
    select * from orders 
    right join
    customers
    on orders.cust_id=customers.cust_id;
    
    SET SQL_SAFE_UPDATES=0; -- this is used to set the save mode by sql to 0/off;
    -- if we want to delete name from the customers table 
         delete from customers
    where name="Raju";
   -- ❌❌ the error without using  SET SQL_SAFE_UPDATES=0 ❌❌; 
   /* You are using safe update mode and you tried to update a table without a WHERE that uses a KEY column. 
To disable safe mode, toggle the option in Preferences -> SQL Editor and reconnect.*/
    
        delete from customers
        where name="Raju";
        
        -- when there is relationship between two table we cannot directlet delete the any thing from table directly
	-- the errror❌❌❌
   /*  Error Code: 1451. Cannot delete or update a parent row: 
   a foreign key constraint fails (`relationship`.`orders`, CONSTRAINT `orders_ibfk_1` 
   FOREIGN KEY (`cust_id`) REFERENCES `customers` (`cust_id`))*/
   
   DESC orders;
   show create table orders;
   -- using above query check the name of the foreign key contraits name {orders_ibfk_1}
   
   ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_1 ;
   ALTER TABLE orders
   ADD CONSTRAINT fk_cust_id
   FOREIGN KEY (cust_id) REFERENCES customers(cust_id) ON DELETE CASCADE;
   
    delete from customers
	where name="Raju";
        -- now we can use delete it delete all the records from the customers table and related records from the orders table
   
   -- using  IFNULL FUCTION because when we are  using left or right join the data that is not present , by default value is null. if we want to replace the null value with custom value we can also do that
   
    select name ,amount ,ord_id ,ifnull(amount,0) ,ifnull(ord_id,"No record")from orders 
    right join
    customers
    on orders.cust_id=customers.cust_id;
   

   
   
    
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

