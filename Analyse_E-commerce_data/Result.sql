-- crate a database E_Commerce_data;
create database Ecommerce_salesdata;

use Ecommerce_salesdata;

-- command to gerenrate SQL file from Datasets
-- 1 download the anaconda
-- 2 open the anaconda prompt
-- 3 go to file lacation where the data set is stored on your local computer through  anaconda command prompt
-- 4 write pip install csv kit
-- 5 write  --> csvsql --dialect mysql --snifflimit 15000 Sales_Dataset.csv > Result.sql
-- if you are come with error like  ['csvsql' is not recognized as an internal or external command,operable program or batch file. ] 
-- then set the path of bcz 
/*  The warning indicates that the csvkit scripts, including csvsql, are installed in a directory that is not included in your system's PATH environment variable. 
     This means the system can't locate these scripts globally when you type csvsql. --> set the path using environmental variable */ 
-- 6 this will create the sql file of named Result then open the file through notepad  in this file there is crrate table query and use it directly in sql workbench to create tabble
CREATE TABLE `Sales_Dataset` (
	order_id VARCHAR(15) NOT NULL, 
	order_date DATE NOT NULL, 
	ship_date DATE NOT NULL, 
	ship_mode VARCHAR(14) NOT NULL, 
	customer_name VARCHAR(22) NOT NULL, 
	segment VARCHAR(11) NOT NULL, 
	state VARCHAR(36) NOT NULL, 
	country VARCHAR(32) NOT NULL, 
	market VARCHAR(6) NOT NULL, 
	region VARCHAR(14) NOT NULL, 
	product_id VARCHAR(16) NOT NULL, 
	category VARCHAR(15) NOT NULL, 
	sub_category VARCHAR(11) NOT NULL, 
	product_name VARCHAR(127) NOT NULL, 
	sales DECIMAL(38, 0) NOT NULL, 
	quantity DECIMAL(38, 0) NOT NULL, 
	discount DECIMAL(38, 3) NOT NULL, 
	profit DECIMAL(38, 5) NOT NULL, 
	shipping_cost DECIMAL(38, 2) NOT NULL, 
	order_priority VARCHAR(8) NOT NULL, 
	year DECIMAL(38, 0) NOT NULL
);
show tables;
desc Sales_Dataset;

-- steps to load the data from sales_dataset.csv file to Sales_Dataset table 
	LOAD DATA INFILE 'D:/Mysql Practice/Analyse_E-commerce_data/Sales_Dataset.csv'
    INTO TABLE Sales_Dataset
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY'\n'
    IGNORE 1 ROWS;  -- bcz first row contains header
 -- wherever U trying to load that data it shows one of the famous error -->error 1290
 -- MYSQL is running at secure-file-private error
 -- step  go to file location where mysql is installed  ---> c drive  first of all got to show  view-->show --> hidden items-->
 /* there u see program data --> mysql folder-- mysql server  then open the notepad donot open it manually --> open as  run as administrator 
  after the  in notepad goto file -> open then budefault u will at the path that u open through file explorer -- then select all file then there is [my] file and open it 
  use CTRl F and search for  secure-file-priv then there will be like this --->secure-file-priv="C:/ProgramData/MySQL/MySQL Server 8.0/Uploads"
delete what ever in between " " left as empty
 
 */
 
 select * from Sales_Dataset; 
 
 -- select the top 3 states having highest shipping cost 
 -- state higherst_sum_shipping_cost
 
 select state, sum(shipping_cost) as sum_shipping_cost
 from sales_Dataset
 group by state
 order by sum_shipping_cost desc
 limit 3;
 
 -- common table expression -- complexity of any given query + reusability of the query
 
 with state as (
    select state, sum(shipping_cost) as sum_shipping_cost
 from sales_Dataset
 group by state
 order by sum_shipping_cost desc
 limit 3
 )select * from state;
 
 
 
