-- Generate month-on-month order counts grouped by: 
-- • Payment type 
-- (Month-on-Month change per payment type)
WITH monthly_orders AS (
    SELECT
        p.payment_type,
        DATE_TRUNC('month', o.order_purchase_timestamp) AS order_month,
        COUNT(DISTINCT o.order_id) AS order_count
    FROM orders o
    JOIN payments p ON p.order_id = o.order_id
    GROUP BY p.payment_type, DATE_TRUNC('month', o.order_purchase_timestamp)
)
SELECT
    payment_type,
    order_month,
    order_count,
    order_count
      - LAG(order_count) OVER (
            PARTITION BY payment_type
            ORDER BY order_month
        ) AS mom_change
FROM monthly_orders
ORDER BY payment_type, order_month;