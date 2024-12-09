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
    
    -- inner join 
    SELECT * FROM customers
    INNER JOIN 
    orders
    on orders.cust_id =customers.cust_id;
    
    
    
    
    
    

