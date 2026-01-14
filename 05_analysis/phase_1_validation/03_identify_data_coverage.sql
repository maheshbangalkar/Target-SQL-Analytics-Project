-- Identify

-- Order date range covered by the dataset 
SELECT
    MIN(order_purchase_timestamp) AS start_date,
    MAX(order_purchase_timestamp) AS end_date,
    MAX(order_purchase_timestamp)::date - MIN(order_purchase_timestamp)::date AS total_days
FROM orders;

-- Number of unique customer cities and states 
SELECT
    COUNT(DISTINCT customer_city)  AS unique_customer_cities,
    COUNT(DISTINCT customer_state) AS unique_customer_states
FROM customers;