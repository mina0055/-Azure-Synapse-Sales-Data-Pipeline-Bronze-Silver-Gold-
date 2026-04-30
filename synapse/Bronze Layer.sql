create schema bronze;

CREATE table bronze.sales
(
    id VARCHAR(50),
    timestamp	VARCHAR(50), 
    quantity	VARCHAR(50), 
    product_id VARCHAR(50),
    product_name VARCHAR(50),
    unit_price VARCHAR(50),	
    total_amount VARCHAR(50),
    store VARCHAR(50),
    payment_method VARCHAR(50),
    customer_id VARCHAR(50),
    customer_type VARCHAR(50),
    year VARCHAR(50),
    month VARCHAR(50),
    day VARCHAR(50),
    day_name VARCHAR(50),
    hour VARCHAR(50)
)


SELECT * from bronze.sales

COPY into bronze.sales
from 'https://storageaccount3257.dfs.core.windows.net/datalake/retail_sale_cleaned.csv'
WITH (
    FILE_TYPE = 'csv',
    FIRSTROW = 2,    
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0A'
)


SELECT * from bronze.sales

select COUNT(id) from bronze.sales
