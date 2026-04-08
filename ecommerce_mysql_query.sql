create database ecommerce;
use ecommerce;
SELECT * FROM ecommerce.dataset;
DESCRIBE ecommerce.dataset;

SELECT COUNT(*) FROM ecommerce.dataset;

SELECT *
FROM ecommerce.dataset
WHERE `Customer Name` IS NULL;

SELECT *
FROM ecommerce.dataset
WHERE Customer_Name IS NULL;

DELETE FROM dataset
WHERE Customer_Name IS NULL 
   OR Sales IS NULL;


set sql_safe_updates=0;

ALTER TABLE dataset
RENAME COLUMN `Customer_Name` TO customer_name;

ALTER TABLE dataset
RENAME COLUMN `Order_Date` TO order_date;

SELECT Order_Date FROM dataset;

SELECT Order_Date FROM dataset;

ALTER TABLE dataset
RENAME COLUMN `Product Name` TO Product_Name;

SELECT Customer_Name, Product_Name, COUNT(*)
FROM  ecommerce.dataset
GROUP BY Customer_Name, Product_Name
HAVING COUNT(*) > 1;

ALTER TABLE dataset
RENAME COLUMN `Row ID` TO Row_ID;

DELETE t1
FROM ecommerce.dataset t1
JOIN ecommerce.dataset t2 
ON t1.Customer_Name = t2.Customer_Name
AND t1.Product_Name = t2.Product_Name
AND t1.Order_Date = t2.Order_Date
AND t1.Row_ID > t2.Row_ID;

SELECT Sales FROM dataset;

select product_Name,sum(Sales) from dataset
group by product_Name 
order by sum(Sales) desc;

SELECT Product_Name, SUM(Sales)
FROM dataset
GROUP BY Product_Name
ORDER BY SUM(Sales) DESC;

SELECT *
FROM dataset
WHERE Customer_Name IS NULL 
   OR Customer_Name = '';

SELECT Order_Date FROM dataset;

SELECT Customer_Name, SUM(Sales)
FROM dataset
GROUP BY Customer_Name
ORDER BY SUM(Sales) DESC;

select order_date from dataset

UPDATE ecommerce.dataset
SET order_date = STR_TO_DATE(order_date, '%d-%m-%y');

UPDATE ecommerce.dataset
SET order_date = 
CASE
    WHEN order_date LIKE '%-%' THEN STR_TO_DATE(order_date, '%d-%m-%Y')
    WHEN order_date LIKE '%/%' THEN STR_TO_DATE(order_date, '%m/%d/%Y')
END;


SELECT order_date, COUNT(product_name) AS product_count
FROM dataset
WHERE YEAR(order_date) = 2015
GROUP BY order_date
order by product_count desc;



select monthname(order_date),round(sum(Sales),0) as total
from dataset
group by monthname(order_date)
order by monthname(order_date) asc;


select year(order_date) as year,
       round(sum(Sales),0) as total_revenue
from dataset
group by year
order by year asc;



select sub_category,round(sum(Sales),0) as total from dataset
group by sub_category;



SELECT category, SUM(profit) AS total_profit
FROM dataset
GROUP BY category;

SELECT 
    category,
    ROUND((SUM(profit) * 100 / 
          (SELECT SUM(profit) FROM dataset)
         ), 2) AS profit_percentage
FROM dataset
GROUP BY category;



ALTER TABLE dataset
RENAME COLUMN `Sub-Category` TO sub_category;

ALTER TABLE dataset
RENAME COLUMN `Category` TO category;

SELECT * FROM ecommerce.dataset;


select Region,round(sum(Sales),0)as total from dataset
group by Region;

select Region, round(sum(Sales),0) as total_sales
from dataset
group by Region
order by total_sales desc;

select customer_name,round(sum(Sales),0) as customer_sales from dataset
group by customer_name
order by customer_sales desc limit 0,5;

SELECT Product_Name, round(SUM(Sales),0) AS total_sales
FROM dataset
GROUP BY Product_Name
ORDER BY total_sales DESC;

SELECT Segment,
ROUND(SUM(Sales) / SUM(Profit), 2) AS sales_profit_ratio
FROM dataset
GROUP BY Segment;

select State,round(sum(Sales),0) as total_sales from dataset
group by State;


select 
    monthname(order_date) as month,
    round(sum(Sales),0) as total
from dataset
group by month(order_date), monthname(order_date)
order by month(order_date);

select State,round(sum(Sales),0) as Total_sales from dataset
group by State
order by Total_sales desc limit 10;

