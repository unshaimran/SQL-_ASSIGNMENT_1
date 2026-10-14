
--Q1: List all brand names from the brands table.

SELECT [brand_name]
FROM [production].[brands];

--Q2: Show the product name and list price of all products,
-- sorted from most expensive to cheapest.

SELECT product_name , list_price
From [production].[products]
ORDER BY list_price DESC;

-- Q3: Find all customers who live in the state of New York (NY).

SELECT *
FROM [sales].[customers]
where state = 'NY'

--Q4: Show only the top 5 most expensive products in the store.

SELECT TOP 5 product_name,list_price
FROM [production].[products]
ORDER BY list_price DESC;

-- Q5: List all products with a price between $200 and $500,
-- sorted by price ascending.

SELECT product_name, list_price 
FROM [production].[products]
where list_price BETWEEN 200 AND 500
ORDER BY list_price ASC;

--Q6: Find all customers whose last name starts with the letter 'S'.

SELECT *
FROM [sales].[customers]
WHERE last_name LIKE 'S%'

 --Q7: List all products that belong to:
-- category 6 (Mountain Bikes) OR category 7 (Road Bikes).

SELECT *
FROM [production].[products]
WHERE category_id = 6
OR category_id = 7

-- Q8: Show all orders that have NOT been shipped yet
-- (shipped_date is missing).

SELECT *
FROM [sales].[orders]
WHERE shipped_date IS  NULL;

-- Q9: Display:
-- product name,
-- brand ID,
-- and a computed column showing 15% off the list price
-- labeled as 'Sale Price'.

SELECT 
product_name,
brand_ID,
list_price * 0.85 AS [Sale_Price]
FROM [production].[products]

-- Q10: Get a unique list of all cities where BikeStores customers live,
-- sorted alphabetically.

SELECT DISTINCT city
FROM [sales].[customers]
ORDER BY city ASC;

-- Q11: List all staff members who are currently active (active = 1),
-- showing their full name and email.

SELECT 
     first_name + ' ' + last_name AS [Full_Name],
     email
From [sales].[staffs]
WHERE active = 1

-- Q12: Using UNION:
-- Get a combined list of all cities from both customers and stores
-- (no duplicates), sorted A–Z.

SELECT city
FROM [sales].[customers]
UNION
SELECT city
FROM [sales].[stores]
ORDER BY city ASC;

-- Q13: Using EXCEPT:
-- Find product IDs that exist in order_items
-- but are NOT in the products table.

SELECT product_ID
FROM [sales].[order_items]

EXCEPT

SELECT product_ID
FROM [production].[products]

-- Q14: List all products from the year 2016
-- with a price greater than $1,500,
-- sorted by price descending.

SELECT *
FROM [production].[products]
WHERE  model_year =2016 AND list_price > $1500
ORDER BY list_price DESC;

-- Q15 (BONUS): Using UNION ALL:
-- Show Trek (brand_id = 9) products from 2016
-- and Surly (brand_id = 8) products from 2017.
-- Include product name, brand, year, and price.
-- Order by year then price descending.

SELECT 
product_name,
'TREK' AS brand,
model_year AS year,
list_price AS price
FROM [production].[products]
WHERE brand_id = 9
AND model_year = 2016


UNION ALL

SELECT 
product_name,
'SURLY' AS brand,
model_year AS year,
list_price AS price
FROM [production].[products]
WHERE brand_id = 8
AND  model_year = 2017
ORDER BY year ASC , price DESC;


