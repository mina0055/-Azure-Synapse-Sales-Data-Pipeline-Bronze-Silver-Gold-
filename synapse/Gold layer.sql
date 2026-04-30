CREATE SCHEMA gold;

CREATE VIEW gold.vu_sales
as
SELECT 
id,
quantity,
product_id,
product_name,
unit_price,
total_amount,
store,
payment_method,
customer_id,
customer_type,
year,
month,
day,
day_name,
hour
from silver.sales
where id != '-1'
and product_id != '-1'
and product_name !=  'Unknown'
and YEAR < 2027
and unit_price != -1 
and store != 'Unknown'
and payment_method != 'Unknown'
and customer_type  != 'Unknown'


SELECT  * from gold.vu_sales

-- Main Kpis of sales
CREATE view gold.vu_kpis
as
SELECT 
 sum(total_amount) as Total_Amount,
 sum(quantity) as Total_quantity,
 COUNT(distinct id)  as count_ORDER_id
from gold.vu_sales


-- Revenue By Year
CREATE VIEW gold.vu_RevenueByYear
as
SELECT  year,
sum(total_amount) as Total_Amount,
sum(quantity) as Total_quantity,
COUNT(distinct id)  as count_ORDER_id
from gold.vu_sales
GROUP by year


-- Revenue By month
CREATE VIEW gold.vw_monthlyrevenue
as
SELECT  month,
sum(total_amount) as Total_Amount
from gold.vu_sales
GROUP by month

-- Sales by payment type
CREATE VIEW gold.vw_payment_distribution
as
SELECT  payment_method,
sum(total_amount) as Total_Amount
from gold.vu_sales
GROUP by payment_method


-- Top 10 best customers
CREATE VIEW gold.vw_top_customers
as
SELECT  TOP(10) customer_id
from gold.vu_sales
ORDER BY total_amount DESC



