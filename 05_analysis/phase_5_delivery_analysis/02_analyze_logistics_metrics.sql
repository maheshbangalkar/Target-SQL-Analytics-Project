-- Identify: 
-- • Top 5 states with highest average freight cost 
-- • Top 5 states with lowest average freight cost 
WITH order_freight AS (
    SELECT
        c.customer_state,
        o.order_id,
        SUM(i.freight_value) AS order_freight_value
    FROM customers c
    JOIN orders o
      ON o.customer_id = c.customer_id
    JOIN order_items i
      ON i.order_id = o.order_id
    GROUP BY
        c.customer_state,
        o.order_id
),
avg_freight_by_state AS (
    SELECT
        customer_state,
        ROUND(AVG(order_freight_value), 2) AS avg_freight_value
    FROM order_freight
    GROUP BY customer_state
),
ranked AS (
    SELECT
        customer_state,
        avg_freight_value,
        ROW_NUMBER() OVER (ORDER BY avg_freight_value) AS low_rank,
        ROW_NUMBER() OVER (ORDER BY avg_freight_value DESC) AS high_rank
    FROM avg_freight_by_state
)
SELECT
    low.customer_state   AS lowest_freight_state,
    low.avg_freight_value AS lowest_avg_freight,
    high.customer_state  AS highest_freight_state,
    high.avg_freight_value AS highest_avg_freight
FROM ranked low
JOIN ranked high
  ON low.low_rank = high.high_rank
WHERE low.low_rank <= 5
ORDER BY low.avg_freight_value;

-- Identify: 
-- • Top 5 states with slowest average delivery 
-- • Top 5 states with fastest average delivery 
WITH order_to_deliver AS (
    SELECT
        c.customer_state,
        o.order_id,
        (o.order_delivered_customer_date::date
         - o.order_purchase_timestamp::date) AS time_to_deliver
    FROM customers c
    JOIN orders o
      ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
),
avg_time_to_deliver AS (
    SELECT
        customer_state,
        ROUND(AVG(time_to_deliver), 2) AS avg_time_to_deliver
    FROM order_to_deliver
    GROUP BY customer_state
),
ranked_delivery AS (
    SELECT
        customer_state,
        avg_time_to_deliver,
        ROW_NUMBER() OVER (ORDER BY avg_time_to_deliver) AS fast_rank,
        ROW_NUMBER() OVER (ORDER BY avg_time_to_deliver DESC) AS slow_rank
    FROM avg_time_to_deliver
)
SELECT
    fast.customer_state AS fastest_delivery_state,
    fast.avg_time_to_deliver AS fastest_avg_days,
    slow.customer_state AS slowest_delivery_state,
    slow.avg_time_to_deliver AS slowest_avg_days
FROM ranked_delivery fast
JOIN ranked_delivery slow
  ON fast.fast_rank = slow.slow_rank
WHERE fast.fast_rank <= 5
ORDER BY fastest_avg_days;

-- Identify: 
-- • Top 5 states where deliveries are significantly faster than estimated 
WITH order_delivery_times AS (
    SELECT
        c.customer_state,
        (o.order_delivered_customer_date::date
         - o.order_purchase_timestamp::date) AS actual_delivery_days,
        (o.order_estimated_delivery_date::date
         - o.order_purchase_timestamp::date) AS estimated_delivery_days
    FROM customers c
    JOIN orders o
      ON o.customer_id = c.customer_id
    WHERE o.order_status = 'delivered'
),
state_delivery_avg AS (
    SELECT
        customer_state,
        ROUND(AVG(actual_delivery_days), 2) AS avg_actual_delivery_days,
        ROUND(AVG(estimated_delivery_days), 2) AS avg_estimated_delivery_days,
        ROUND(
            AVG(estimated_delivery_days) - AVG(actual_delivery_days),
            2
        ) AS avg_days_faster
    FROM order_delivery_times
    GROUP BY customer_state
)
SELECT
    customer_state,
    avg_actual_delivery_days,
    avg_estimated_delivery_days,
    avg_days_faster
FROM state_delivery_avg
WHERE avg_days_faster > 0
ORDER BY avg_days_faster DESC
LIMIT 5;