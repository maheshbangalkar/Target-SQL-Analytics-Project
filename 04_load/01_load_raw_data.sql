-- Load all datasets into a relational database.

-- Table: geolocation
COPY geolocation (
    geolocation_zip_code_prefix,
    geolocation_lat,
    geolocation_lng,
    geolocation_city,
    geolocation_state
)
FROM 'Dataset/geolocation.csv'
CSV HEADER;


-- Table: customers
COPY customers (
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    customer_city,
    customer_state
)
FROM 'Dataset/customers.csv'
CSV HEADER;


-- Table: sellers
COPY sellers (
    seller_id,
    seller_zip_code_prefix,
    seller_city,
    seller_state
)
FROM 'Dataset/sellers.csv'
CSV HEADER;


-- Table: products
COPY products (
    product_id,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
)
FROM 'Dataset/products.csv'
CSV HEADER;


-- Table: orders
COPY orders (
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date,
    order_estimated_delivery_date
)
FROM 'Dataset/orders.csv'
CSV HEADER;


-- Table: order_items
COPY order_items (
    order_id,
    order_item_id,
    product_id,
    seller_id,
    shipping_limit_date,
    price,
    freight_value
)
FROM 'Dataset/order_items.csv'
CSV HEADER;


-- Table: payments
COPY payments (
    order_id,
    payment_sequential,
    payment_type,
    payment_installments,
    payment_value
)
FROM 'Dataset/payments.csv'
CSV HEADER;


-- Table: reviews
DROP TABLE IF EXISTS reviews_stage;

CREATE TEMP TABLE reviews_stage (
    review_id TEXT,
    order_id TEXT,
    review_score TEXT,
    review_comment_title TEXT,
    review_comment_message TEXT,
    review_creation_date TEXT,
    review_answer_timestamp TEXT
);

COPY reviews_stage
FROM 'Dataset/order_reviews.csv'
WITH (
    FORMAT csv,
    HEADER true,
    NULL '',
    ENCODING 'LATIN1'
);

INSERT INTO reviews (
    review_id,
    order_id,
    review_score,
    review_comment_title,
    review_comment_message,
    review_creation_date,
    review_answer_timestamp
)
SELECT
    review_id::UUID,
    order_id::UUID,
    NULLIF(review_score, '')::INTEGER,
    review_comment_title,
    review_comment_message,
    TO_TIMESTAMP(review_creation_date, 'DD-MM-YYYY HH24.MI'),
    CASE
        WHEN review_answer_timestamp IS NULL
             OR review_answer_timestamp = ''
        THEN NULL
        ELSE TO_TIMESTAMP(review_answer_timestamp, 'DD-MM-YYYY HH24.MI')
    END
FROM reviews_stage
ON CONFLICT (review_id) DO NOTHING;

DROP TABLE IF EXISTS reviews_stage;
