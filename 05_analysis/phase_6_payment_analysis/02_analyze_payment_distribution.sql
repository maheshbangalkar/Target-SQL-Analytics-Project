-- Analyze order distribution by: 
-- • Number of payment instalments 

WITH valid_orders AS (
    SELECT DISTINCT
        order_id,
        payment_installments
    FROM payments
    WHERE payment_value > 0
)
SELECT
    payment_installments,
    COUNT(order_id) AS total_orders
FROM valid_orders
GROUP BY payment_installments
ORDER BY payment_installments;