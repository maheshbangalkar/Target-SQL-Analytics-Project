-- Using a single optimized query, compute: 
-- Delivery time (days):  
-- • time_to_deliver = order_delivered_customer_date - order_purchase_timestamp 
-- Estimated vs actual delivery difference (days):   
-- • diff_estimated_delivery = order_delivered_customer_date - order_estimated_delivery_date 
SELECT
    order_id,
    (order_delivered_customer_date::date
     - order_purchase_timestamp::date) AS time_to_deliver_days,
    (order_delivered_customer_date::date
     - order_estimated_delivery_date::date) AS diff_estimated_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;