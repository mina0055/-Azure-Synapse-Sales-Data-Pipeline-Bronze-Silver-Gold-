CREATE SCHEMA silver;

CREATE table silver.sales 
(
    id VARCHAR(50),
    quantity INT, 
    product_id	VARCHAR(50), 
    product_name    VARCHAR(50), 
    unit_price FLOAT,
    total_amount FLOAT,
    store VARCHAR(50),	
    payment_method VARCHAR(50),
    customer_id VARCHAR(50),
    customer_type VARCHAR(50),
    year VARCHAR(50),
    month VARCHAR(50),
    day VARCHAR(50),
    day_name VARCHAR(50),
    hour INT
)

SELECT * from silver.sales



INSERT into silver.sales
SELECT 
-- OrderID
TRIM(ISNULL(id, -1)) as id,

-- quantity
abs(quantity) as quantity,

-- productID
TRIM(ISNULL(product_id, -1)) as product_id,
-- Product_name
upper(TRIM(ISNULL(product_name, 'Unknown'))) as product_name,

-- unit_price
TRIM(ISNULL(unit_price, -1)) as unit_price,

-- Total_Amount
total_amount as total_amount,

-- store
upper(TRIM(ISNULL(store, 'Unknown'))) as store,

-- payment_method
upper(TRIM(ISNULL(payment_method, 'Unknown'))) as payment_method,

--customer_id
customer_id as customer_id ,

-- customer_type
upper(TRIM(ISNULL(customer_type, 'Unknown'))) as customer_type,

year , month , day ,
day_name ,

-- hour
try_cast(hour as int) as Hour

from bronze.sales


SELECT * from bronze.sales

SELECT * from silver.sales

SELECT COUNT(id) from silver.sales


