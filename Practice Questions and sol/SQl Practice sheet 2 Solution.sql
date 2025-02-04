create database sqlpracticesheets;
use sqlpracticesheets;

-- Create the salesman table
CREATE TABLE salesman (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(5, 2)
);

-- Insert values into the salesman table
INSERT INTO salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hooq', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'Paris', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

-- Create the customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT,
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

-- Insert values into the customer table
INSERT INTO customer (customer_id, customer_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002),
(3003, 'Jozy Altidor', 'Moncow', 200, 5007);

INSERT INTO customer (customer_id, customer_name, city,  salesman_id) VALUES
(3011, 'Ab Devilliers', 'Moncow',  5007);
INSERT INTO customer (customer_id, customer_name, city,  salesman_id) VALUES
(30010, 'faf du plessis', 'Moncow',  5007);

select * from customer;



-- Create the order table
CREATE TABLE order_table (
    order_no INT PRIMARY KEY,
    purch_amt DECIMAL(10, 2),
    order_date DATE,
    customer_id INT,
    salesman_id INT,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (salesman_id) REFERENCES salesman(salesman_id)
);

-- Insert values into the order table
INSERT INTO order_table (order_no, purch_amt, order_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2016-10-05', 3005, 5002),
(70009, 270.65, '2016-09-10', 3001, 5005),
(70002, 65.26, '2016-10-05', 3002, 5001),
(70004, 110.50, '2016-08-17', 3005, 5002),
(70007, 948.50, '2016-09-10', 3005, 5002),
(70005, 2400.60, '2016-07-27', 3007, 5001),
(70008, 5760.00, '2016-09-10', 3002, 5001),
(70010, 1983.43, '2016-10-10', 3004, 5006),
(70003, 2480.40, '2016-10-10', 3003, 5007),
(70012, 250.45, '2016-06-27', 3008, 5002),
(70011, 75.29, '2016-08-17', 3003, 5007);

select * from order_table;

-- Q1]---> Display name and commission of all the salesmen.
 select name ,commission from salesman;
 
--  Q2 ]---> • Retrieve salesman id of all salesmen from orders table without any repeats.
select distinct salesman_id from salesman;

-- Q3 ]--> • Display names and city of salesman, who belongs to the city of Paris.

Select name ,city 
from salesman
where city="Paris";

-- Q4 ] --> Display all the information for those customers with a grade of 200.

   select * from customer
   where grade=200;
   
--    Q5 ] ---> • Display the order number, order date and the purchase amount for order(s) which will be delivered by the salesman with ID 5001.
  select  order_no,order_date,purch_amt ,salesman_id
  from order_table
  where salesman_id=5001;
  
  
 -- Q6 ]---> • Display all the customers, who are either belongs to the city New York or not had a grade above 100.
  Select * from customer 
  where city="New York" OR NOT grade>100;
  
  -- Q7 ] ----> Find those salesmen with all information who gets the commission within a range of 0.12 and 0.14.
  
  select * from salesman 
  where commission >0.12 And commission<0.14;
  
   -- Both query give the same answer
   
  SELECT salesman_id, name, city, commission
  FROM salesman
  WHERE commission between 0.10 AND 0.12;
  
  -- Q8] ---> • Find all those customers with all information whose names are ending with the letter 'n'.
   select * from customer 
   where customer_name like "%n";
   
 -- Q9] ---> • Find those salesmen with all information whose name containing the 1st character is 'N' and the 4th
--   character is 'l' and rests may be any character.

 select * from salesman 
 where name like "N__l%";  -- here I used two underscore "_" for 2nd and 3rd character 
 
 -- Q10] ---> Find that customer with all information who does not get any grade except NULL.
 
 Select * from customer 
 where grade is null ;
 
 -- Q11] ---> • Find the total purchase amount of all orders.
 select   customer_id ,sum(purch_amt) as "Total purchase Amount"  from order_table
 group by customer_id;
 
 -- Q12]----> • Find the number of salesman currently listing for all of their customers.
 SELECT COUNT(salesman_id)
 FROM order_table;
 
 SELECT DISTINCT COUNT( salesman_id)
 FROM order_table;
 
 -- Q 13 Find the highest grade for each of the cities of the customers.
SELECT city, MAX(grade) As "Maximum Grade"
FROM customer
GROUP BY city;


-- Question related to multiple column ||| Multiple tables Joins Nested Queries

-- Q14 ]---> • Find the name and city of those customers and salesmen who lives in the same city.
   select c.customer_name, s.name as "Salesman Name" ,s.city
   from customer  c ,  salesman s 
   where c.city =s.city;
   
   -- Q15 ]---> •Find the names of all customers along with the salesmen who works for them.
   SELECT customer.customer_name ,salesman.name
   FROM customer salesman
   WHERE salesman.salesman_id = customer.salesman_id;
   
   -- Q16]---->  Display all those orders by the customers not located in the same cities where their salesmen live.
    
    
         
     

 
  
  
  


-- ✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️✴️
-- Create the nobel_win  table;
CREATE TABLE nobel_win (
    year INT,
    subject VARCHAR(50),
    winner VARCHAR(100),
    country VARCHAR(50),
    category VARCHAR(200)
);

-- Insert records
INSERT INTO nobel_win (year, subject, winner, country, category) VALUES

(2023, 'Physics', 'Pierre Agostini, Ferenc Krausz, Anne L’Huillier', 'France, Hungary, Sweden', 'Attosecond Light Pulses and Electron Dynamics'),
(2023, 'Chemistry', 'Moungi Bawendi, Louis Brus, Alexei Ekimov', 'USA, USA, Russia', 'Quantum Dots Discovery and Synthesis'),
(2023, 'Physiology or Medicine', 'Katalin Karikó, Drew Weissman', 'Hungary, USA', 'mRNA Vaccine Development'),
(2023, 'Literature', 'Jon Olav Fosse', 'Norway', 'Innovative Plays and Prose Exploring the Unsayable'),
(2023, 'Peace', 'Narges Mohammadi', 'Iran', 'Advocacy for Women’s Rights and Human Freedom'),
(2022, 'Physics', 'Alain Aspect, John F. Clauser, Anton Zeilinger', 'France, USA, Austria', 'Quantum Information Science'),
(2022, 'Chemistry', 'Carolyn R. Bertozzi, Morten Meldal, K. Barry Sharpless', 'USA, Denmark, USA', 'Click Chemistry and Bioorthogonal Chemistry'),
(2022, 'Physiology or Medicine', 'Svante Pääbo', 'Sweden', 'Discoveries Concerning Extinct Hominins and Human Evolution'),
(2022, 'Literature', 'Annie Ernaux', 'France', 'Courage and Clinical Acumen in Autobiographical Writing'),
(2022, 'Peace', 'Ales Bialiatski, Memorial, Center for Civil Liberties', 'Belarus, Russia, Ukraine', 'Efforts to Defend Human Rights and Promote Democracy'),
(2021, 'Physics', 'Syukuro Manabe, Klaus Hasselmann, Giorgio Parisi', 'USA, Germany, Italy', 'Climate Modeling and Complex Systems'),
(2021, 'Chemistry', 'Benjamin List, David W.C. MacMillan', 'Germany, USA', 'Asymmetric Organocatalysis'),
(2021, 'Physiology or Medicine', 'David Julius, Ardem Patapoutian', 'USA, USA', 'Receptors for Temperature and Touch'),
(2021, 'Literature', 'Abdulrazak Gurnah', 'Tanzania', 'Colonialism and the Refugee Experience'),
(2021, 'Peace', 'Maria Ressa, Dmitry Muratov', 'Philippines, Russia', 'Efforts to Safeguard Freedom of Expression'),
(2020, 'Physics', 'Roger Penrose, Reinhard Genzel, Andrea Ghez', 'UK, Germany, USA', 'Black Holes and the Galactic Center'),
(2020, 'Chemistry', 'Emmanuelle Charpentier, Jennifer Doudna', 'France, USA', 'CRISPR-Cas9 Gene Editing'),
(2020, 'Physiology or Medicine', 'Harvey J. Alter, Michael Houghton, Charles M. Rice', 'USA, UK, USA', 'Discovery of Hepatitis C Virus'),
(2020, 'Literature', 'Louise Glück', 'USA', 'Poetic Voice That Makes Individual Existence Universal'),
(2020, 'Peace', 'World Food Programme', 'Global', 'Efforts to Combat Hunger and Food Insecurity'),
(2019, 'Physics', 'James Peebles, Michel Mayor, Didier Queloz', 'Canada, Switzerland, Switzerland', 'Cosmology and Exoplanets'),
(2019, 'Chemistry', 'John B. Goodenough, M. Stanley Whittingham, Akira Yoshino', 'USA, UK, Japan', 'Lithium-Ion Batteries'),
(2019, 'Physiology or Medicine', 'William Kaelin Jr., Sir Peter Ratcliffe, Gregg Semenza', 'USA, UK, USA', 'Oxygen-Sensing Mechanisms'),
(2019, 'Literature', 'Peter Handke', 'Austria', 'Influential Work in Language and Human Experience'),
(2019, 'Peace', 'Abiy Ahmed Ali', 'Ethiopia', 'Efforts to Achieve Peace with Eritrea'),
(2018, 'Physics', 'Arthur Ashkin, Gérard Mourou, Donna Strickland', 'USA, France, Canada', 'Laser Physics'),
(2018, 'Chemistry', 'Frances H. Arnold, George P. Smith, Sir Gregory P. Winter', 'USA, USA, UK', 'Directed Evolution of Enzymes'),
(2018, 'Physiology or Medicine', 'James P. Allison, Tasuku Honjo', 'USA, Japan', 'Cancer Therapy by Inhibition of Negative Immune Regulation'),
(2018, 'Literature', 'Olga Tokarczuk', 'Poland', 'Narrative Imagination That Crosses Boundaries');

-- Q1 ---> • Show the winner of the 2023 prize for Literature.

select * from nobel_win
where subject ="Literature" AND year=2023;

-- Q2----> Show all the details of the winners with first name start with A.
select * from nobel_win 
where winner like "A%";

-- Q3 ---> Show all the winners in Physics for 2023 together with the winner of Chemistry for 2020.
 Select *  from nobel_win 
 where subject ="Physics" And year=2023 
 UNION
 Select *  from nobel_win 
 where subject ="Chemistry" And year=2020;
 
 -- Q4----> • Show all the winners of Nobel prize in the year 2023 except the subject Physics and chemistry.
 select * from nobel_win 
 where subject not in ("Physics","Chemistry") AND Year =2023;
 
  -- Q5 ----> • Find all the details of the Nobel winners for the subject not started with the letter 'P' and arranged
-- the list as the most recent comes first, then by name in order

select * from nobel_win
where subject not like "M%"
order by year desc, winner asc;




 
 




 
