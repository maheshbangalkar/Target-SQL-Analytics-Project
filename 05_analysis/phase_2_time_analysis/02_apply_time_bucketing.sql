-- Implement time-bucketing logic to classify order timestamps into: 
-- • Dawn (00–06) 
-- • Morning (07–12) 
-- • Afternoon (13–18) 
-- • Night (19–23)

WITH categorized_orders AS (
    SELECT
        CASE
            WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 0 AND 6  THEN 'Dawn'
            WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 7 AND 12 THEN 'Mornings'
            WHEN EXTRACT(HOUR FROM order_purchase_timestamp) BETWEEN 13 AND 18 THEN 'Afternoon'
            ELSE 'Night'
        END AS day_duration
    FROM orders
)
SELECT
    day_duration,
    COUNT(*) AS order_count
FROM categorized_orders
GROUP BY day_duration
ORDER BY
    CASE day_duration
        WHEN 'Dawn' THEN 1
        WHEN 'Mornings' THEN 2
        WHEN 'Afternoon' THEN 3
        WHEN 'Night' THEN 4
    END;