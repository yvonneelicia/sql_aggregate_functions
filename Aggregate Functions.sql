-- Aggregate Functions --

/* What are aggregate functions?
Functions that operate on a set of rows to calculate and return a single value.

AVG () 	Returns a column's avergae value
COUNT () Returns the number of rows in a column
MAX () Returns a column's highest value
MIN () Returns a column's lowest value
SUM () Returns the sum of a column's values

*/

-- The AVG() Function --
/* 
The AVG () is used to return the average value of a specific column by counting both the number of rows in the table and the sum
of their values. AVG () can be used to return the average value of all columns or of specific columns or rows 
*/

-- Retrieve average product price from products table --
SELECT AVG(p.buyPrice) as avgProductPrice
FROM classicmodels.products as p; 

SELECT AVG(prod.unit_price) as avgProductPrice
FROM sql_inventory.products as prod;

/* Column rows with NULL values are ignored by the AVG () function */

-- The COUNT() Function --
/*
Using the COUNT() function, you can determine teh number of rows in a table or the number of rows that match a specific criterion
*/

-- Count customers in customers table where their name begins with G --
SELECT COUNT(customerNumber) as totalCustomers
FROM classicmodels.customers
WHERE customerName LIKE 'G%';

-- Count employees in employees table where their email has @classicmodelcars.com domain --
SELECT COUNT(employeeNumber) 
FROM classicmodels.employees
WHERE email LIKE '%@classicmodelcars.com%';

-- Count employees where salary is greater than 23,500 --
SELECT COUNT(employee_id) 
FROM hr_system.employees
WHERE salary>23500;

-- The MAX() Function --
/*
The MAX() function returns the highest value in a specified column. MAX() requires that the column name be special
*/

-- Retrieve the highest product price in the products table --
SELECT MAX(p.buyPrice) as maxProductPrice
FROM classicmodels.products as p; -- This statement returns the price of the most expensive item in the products table --


-- The MIN() Function --
/*
The MIN() function returns the lowest value in a specified column. MAX() requires that the column name be special
*/

-- Retrieve the lowest product price in the products table --
SELECT MIN(p.buyPrice) as minProductPrice
FROM classicmodels.products as p; -- Returns the least expensive item in the products table --

-- The SUM() Function --
/*
The SUM() is used to return the total of the values in a specific column.
*/

-- Retrieve total of product price from products table --
SELECT SUM(p.buyPrice) as total
FROM classicmodels.products as p;

-- Retrieve the sum of items ordered where order ID is 6 --
SELECT SUM(quantity) as itemsOrdered
FROM sql_store.order_items 
WHERE order_id = 6; 

-- Retrieve the total order amount from product table where order ID is 6 --
SELECT SUM(unit_price*quantity) as totalPrice
FROM sql_store.order_items 
WHERE order_id = 6; 
/* The function SUM(unit_price*quantity) returns the sum of all the expanded prices in an order and again the WHERE clause ensures
that just the right order items are included */

-- Aggregates on Distinct Values -- 

/* 
The five aggregate functions can all be used in two ways:
> To perform calculations on all rows, specify the ALL argument or specify no argument at all
> To include only unqiue values, specify the DISTINCT argument

ALL is default
The ALL argument doesn't need to be specified because i is the default behaviour. If distinct is not specified, ALL is assumed.
*/

-- Retrieve average product price from products table --
SELECT AVG(DISTINCT p.buyPrice) as avgProductPrice
FROM classicmodels.products as p; -- DISTINCT argument is sed so that the average only takes into account unique prices --

-- Retrieves count of unique product IDs in order_items table --
SELECT COUNT(DISTINCT product_id) 
FROM sql_store.order_items;

-- Combining Aggregate Functions --

/* 
SELECT statements can contain as few or as many aggregate functions as needed 
*/

SELECT COUNT(*) as num_items,
MIN(buyPrice) as minPrice,
MAX(buyPrice) as maxPrice,
AVG(buyPrice) as avgPrice
FROM classicmodels.products;

SELECT COUNT(DISTINCT city)
FROM classicmodels.offices
WHERE city LIKE 'N%';

SELECT COUNT(DISTINCT city)
FROM classicmodels.offices
WHERE city LIKE 't%o'; -- where city starts with T and ends in O --

SELECT COUNT(DISTINCT city)
FROM classicmodels.offices
WHERE city LIKE '%o'; -- where city ends in O --

SELECT COUNT(DISTINCT city)
FROM classicmodels.offices
WHERE city LIKE '%Pa%'; -- where city contains 'Pa' --