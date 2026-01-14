-- Design queries that: 
-- • Aggregate customers by state
SELECT
    customer_state,
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC;

-- • Enable easy extension to city-level analysis
SELECT
    customer_state,
    customer_city,
    COUNT(*) AS total_customers
FROM (
    SELECT DISTINCT customer_id, customer_state, customer_city
    FROM customers
) t
GROUP BY customer_state, customer_city
ORDER BY customer_state, total_customers DESC;