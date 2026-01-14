-- Calculate the percentage increase in total order value from 2017 to 2018 
-- • Limit analysis to January–August 
-- • Use payment_value as the monetary metric
-- (Aggregate total order cost per year (Jan–Aug only))

WITH yearly_cost AS (
    SELECT
        EXTRACT(YEAR FROM o.order_purchase_timestamp) AS year,
        SUM(p.payment_value) AS total_cost
    FROM orders o
    JOIN payments p
        ON p.order_id = o.order_id
    WHERE EXTRACT(YEAR FROM o.order_purchase_timestamp) IN (2017, 2018)
        AND EXTRACT(MONTH FROM o.order_purchase_timestamp) BETWEEN 1 AND 8
    GROUP BY EXTRACT(YEAR FROM o.order_purchase_timestamp)
)
SELECT
    y2017.total_cost AS cost_in_2017,
    y2018.total_cost AS cost_in_2018,
    ROUND(
        (y2018.total_cost - y2017.total_cost)
        / y2017.total_cost * 100,
        2
    ) AS pct_increase
FROM yearly_cost y2017
JOIN yearly_cost y2018
ON y2017.year = 2017
AND y2018.year = 2018;