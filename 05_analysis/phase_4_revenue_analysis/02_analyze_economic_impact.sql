-- Compute
-- Total and average order value per state
WITH order_values AS (
    SELECT
        c.customer_state,
        o.order_id,
        SUM(p.payment_value) AS order_value
    FROM customers c
    JOIN orders o
      ON c.customer_id = o.customer_id
    JOIN payments p
      ON p.order_id = o.order_id
    GROUP BY
        c.customer_state,
        o.order_id
)
SELECT
    customer_state,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(order_value), 2) AS total_order_value,
    ROUND(AVG(order_value), 2) AS avg_order_value
FROM order_values
GROUP BY customer_state
ORDER BY customer_state;

-- Total and average freight cost per state
WITH order_freight AS (
    SELECT
        c.customer_state,
        o.order_id,
        SUM(i.freight_value) AS order_freight_value
    FROM orders o
    JOIN order_items i
      ON o.order_id = i.order_id
    JOIN customers c
      ON o.customer_id = c.customer_id
    GROUP BY
        c.customer_state,
        o.order_id
)
SELECT
    customer_state,
    COUNT(order_id) AS total_orders,
    ROUND(SUM(order_freight_value), 2) AS total_freight_value,
    ROUND(AVG(order_freight_value), 2) AS avg_freight_value
FROM order_freight
GROUP BY customer_state
ORDER BY total_freight_value DESC; 