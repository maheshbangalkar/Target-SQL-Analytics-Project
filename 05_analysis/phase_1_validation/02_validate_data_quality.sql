-- Validate

-- Referential integrity between tables
SELECT o.*
FROM orders o
LEFT JOIN customers c
  ON o.customer_id = c.customer_id
WHERE c.customer_id IS NULL;
-- Result meaning
-- If rows are returned → referential integrity is broken
-- If zero rows → integrity is valid

-- Presence of nulls and inconsistent values

-- Table: customers
SELECT
    COUNT(*) FILTER (WHERE customer_id IS NULL)                 AS customer_id_nulls,
    COUNT(*) FILTER (WHERE customer_unique_id IS NULL)          AS customer_unique_id_nulls,
    COUNT(*) FILTER (WHERE customer_zip_code_prefix IS NULL)    AS customer_zip_code_prefix_nulls,
    COUNT(*) FILTER (WHERE customer_city IS NULL)               AS customer_city_nulls,
    COUNT(*) FILTER (WHERE customer_state IS NULL)              AS customer_state_nulls
FROM customers;

-- Table: geolocation
SELECT
    COUNT(*) FILTER (WHERE geolocation_zip_code_prefix IS NULL) AS geolocation_zip_code_prefix_nulls,
    COUNT(*) FILTER (WHERE geolocation_lat IS NULL)             AS geolocation_lat_nulls,
    COUNT(*) FILTER (WHERE geolocation_lng IS NULL)             AS geolocation_lng_nulls,
    COUNT(*) FILTER (WHERE geolocation_city IS NULL)            AS geolocation_city_nulls,
    COUNT(*) FILTER (WHERE geolocation_state IS NULL)           AS geolocation_state_nulls
FROM geolocation;

-- Table: order_items
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL)            AS order_id_nulls,
    COUNT(*) FILTER (WHERE order_item_id IS NULL)       AS order_item_id_nulls,
    COUNT(*) FILTER (WHERE product_id IS NULL)          AS product_id_nulls,
    COUNT(*) FILTER (WHERE seller_id IS NULL)           AS seller_id_nulls,
    COUNT(*) FILTER (WHERE shipping_limit_date IS NULL) AS shipping_limit_date_nulls,
    COUNT(*) FILTER (WHERE price IS NULL)               AS price_nulls,
    COUNT(*) FILTER (WHERE freight_value IS NULL)       AS freight_value_nulls
FROM order_items;

-- Table: orders
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL)                         AS order_id_nulls,
    COUNT(*) FILTER (WHERE customer_id IS NULL)                      AS customer_id_nulls,
    COUNT(*) FILTER (WHERE order_status IS NULL)                     AS order_status_nulls,
    COUNT(*) FILTER (WHERE order_purchase_timestamp IS NULL)         AS order_purchase_timestamp_nulls,
    COUNT(*) FILTER (WHERE order_approved_at IS NULL)                AS order_approved_at_nulls,
    COUNT(*) FILTER (WHERE order_delivered_carrier_date IS NULL)     AS order_delivered_carrier_date_nulls,
    COUNT(*) FILTER (WHERE order_delivered_customer_date IS NULL)    AS order_delivered_customer_date_nulls,
    COUNT(*) FILTER (WHERE order_estimated_delivery_date IS NULL)    AS order_estimated_delivery_date_nulls
FROM orders;

-- Table: payments
SELECT
    COUNT(*) FILTER (WHERE order_id IS NULL)               AS order_id_nulls,
    COUNT(*) FILTER (WHERE payment_sequential IS NULL)    AS payment_sequential_nulls,
    COUNT(*) FILTER (WHERE payment_type IS NULL)          AS payment_type_nulls,
    COUNT(*) FILTER (WHERE payment_installments IS NULL)  AS payment_installments_nulls,
    COUNT(*) FILTER (WHERE payment_value IS NULL)         AS payment_value_nulls
FROM payments;

-- Table: products
SELECT
    COUNT(*) FILTER (WHERE product_id IS NULL)                     AS product_id_nulls,
    COUNT(*) FILTER (WHERE product_category_name IS NULL)          AS product_category_name_nulls,
    COUNT(*) FILTER (WHERE product_name_length IS NULL)            AS product_name_length_nulls,
    COUNT(*) FILTER (WHERE product_description_length IS NULL)     AS product_description_length_nulls,
    COUNT(*) FILTER (WHERE product_photos_qty IS NULL)             AS product_photos_qty_nulls,
    COUNT(*) FILTER (WHERE product_weight_g IS NULL)               AS product_weight_g_nulls,
    COUNT(*) FILTER (WHERE product_length_cm IS NULL)              AS product_length_cm_nulls,
    COUNT(*) FILTER (WHERE product_height_cm IS NULL)              AS product_height_cm_nulls,
    COUNT(*) FILTER (WHERE product_width_cm IS NULL)               AS product_width_cm_nulls
FROM products;

-- Table: reviews
SELECT
    COUNT(*) FILTER (WHERE review_id IS NULL)              AS review_id_nulls,
    COUNT(*) FILTER (WHERE order_id IS NULL)               AS order_id_nulls,
    COUNT(*) FILTER (WHERE review_score IS NULL)           AS review_score_nulls,
    COUNT(*) FILTER (WHERE review_comment_title IS NULL)   AS review_comment_title_nulls,
    COUNT(*) FILTER (WHERE review_comment_message IS NULL) AS review_comment_message_nulls,
    COUNT(*) FILTER (WHERE review_creation_date IS NULL)   AS review_creation_date_nulls,
    COUNT(*) FILTER (WHERE review_answer_timestamp IS NULL)AS review_answer_timestamp_nulls
FROM reviews;

-- Table: sellers
SELECT
    COUNT(*) FILTER (WHERE seller_id IS NULL)              AS seller_id_nulls,
    COUNT(*) FILTER (WHERE seller_zip_code_prefix IS NULL) AS seller_zip_code_prefix_nulls,
    COUNT(*) FILTER (WHERE seller_city IS NULL)            AS seller_city_nulls,
    COUNT(*) FILTER (WHERE seller_state IS NULL)           AS seller_state_nulls
FROM sellers;