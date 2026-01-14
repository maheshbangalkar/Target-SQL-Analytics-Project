-- Build queries to analyze

-- Year-over-year growth in order volume
-- Formula: (current_year_orders - previous_year_orders) / previous_year_orders * 100
WITH yearly_orders AS (
    SELECT
        EXTRACT(YEAR FROM order_purchase_timestamp) AS order_year,
        COUNT(*) AS total_orders
    FROM orders
    GROUP BY order_year
)
SELECT
    order_year,
    total_orders,
    LAG(total_orders) OVER (ORDER BY order_year) AS prev_year_orders,
    ROUND(
        (total_orders - LAG(total_orders) OVER (ORDER BY order_year))
        * 100.0
        / NULLIF(LAG(total_orders) OVER (ORDER BY order_year), 0),
        2
    ) AS yoy_growth_percent
FROM yearly_orders
ORDER BY order_year;

-- Average Monthly Orders (Best for Seasonality)
WITH monthly_orders AS (
    SELECT
        EXTRACT(YEAR FROM order_purchase_timestamp)  AS year,
        EXTRACT(MONTH FROM order_purchase_timestamp) AS month,
        COUNT(*) AS orders
    FROM orders
    GROUP BY 1, 2
)
SELECT
    month,
    TO_CHAR(TO_DATE(month::text, 'MM'), 'Month') AS month_name,
    ROUND(AVG(orders)) AS avg_monthly_orders
FROM monthly_orders
GROUP BY
    month,
    TO_CHAR(TO_DATE(month::text, 'MM'), 'Month')
ORDER BY month;

-- Monthly order trends
WITH monthly AS (
    SELECT
        TO_CHAR(order_purchase_timestamp, 'YYYY-MM') AS month,
        COUNT(*) AS total_orders
    FROM public.orders
    GROUP BY month
)
SELECT
    month,
    total_orders,
    LAG(total_orders) OVER (ORDER BY month) AS prev_month_orders,
    ROUND(
        (total_orders - LAG(total_orders) OVER (ORDER BY month))
        * 100.0
        / NULLIF(LAG(total_orders) OVER (ORDER BY month), 0),
        2
    ) AS mom_growth_percent
FROM monthly
ORDER BY month;