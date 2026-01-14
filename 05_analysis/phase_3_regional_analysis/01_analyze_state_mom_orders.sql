-- Compute month-on-month order volume per state.

SELECT
    c.customer_state,
    DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
    COUNT(*) AS total_orders
FROM customers c
JOIN orders o
  ON c.customer_id = o.customer_id
GROUP BY
    c.customer_state,
    DATE_TRUNC('month', o.order_purchase_timestamp)
ORDER BY
    c.customer_state,
    order_month;