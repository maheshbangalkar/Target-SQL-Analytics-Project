-- Table: geolocation

-- DROP TABLE IF EXISTS geolocation;

CREATE TABLE IF NOT EXISTS geolocation (
    geolocation_zip_code_prefix INTEGER,
    geolocation_lat DOUBLE PRECISION,
    geolocation_lng DOUBLE PRECISION,
    geolocation_city VARCHAR(100),
    geolocation_state VARCHAR(10)
);


-- Table: customers

-- DROP TABLE IF EXISTS customers;

CREATE TABLE IF NOT EXISTS customers
(
    customer_id UUID NOT NULL,
    customer_unique_id UUID NOT NULL,
    customer_zip_code_prefix INTEGER,
    customer_city VARCHAR(100),
    customer_state VARCHAR(10),
    CONSTRAINT customers_pkey PRIMARY KEY (customer_id)
);


-- Table: sellers

-- DROP TABLE IF EXISTS sellers;

CREATE TABLE IF NOT EXISTS sellers
(
    seller_id UUID NOT NULL,
    seller_zip_code_prefix INTEGER,
    seller_city VARCHAR(100),
    seller_state VARCHAR(10),
    CONSTRAINT sellers_pkey PRIMARY KEY (seller_id)
);


-- Table: products

-- DROP TABLE IF EXISTS products;

CREATE TABLE IF NOT EXISTS products
(
    product_id UUID NOT NULL,
    product_category_name VARCHAR(100),
    product_name_lenght INTEGER,
    product_description_lenght INTEGER,
    product_photos_qty INTEGER,
    product_weight_g INTEGER,
    product_length_cm INTEGER,
    product_height_cm INTEGER,
    product_width_cm INTEGER,
    CONSTRAINT products_pkey PRIMARY KEY (product_id)
);


-- Table: orders

-- DROP TABLE IF EXISTS orders;

CREATE TABLE IF NOT EXISTS orders
(
    order_id UUID NOT NULL,
    customer_id UUID NOT NULL,
    order_status VARCHAR(30),
    order_purchase_timestamp TIMESTAMP,
    order_approved_at TIMESTAMP,
    order_delivered_carrier_date TIMESTAMP,
    order_delivered_customer_date TIMESTAMP,
    order_estimated_delivery_date TIMESTAMP,
	CONSTRAINT orders_pkey PRIMARY KEY (order_id),
	CONSTRAINT fk_orders_customer FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);


-- Table: order_items

-- DROP TABLE IF EXISTS order_items;

CREATE TABLE IF NOT EXISTS order_items
(
    order_id UUID NOT NULL,
    order_item_id INTEGER NOT NULL,
    product_id UUID NOT NULL,
    seller_id UUID NOT NULL,
    shipping_limit_date TIMESTAMP,
    price NUMERIC(10,2),
    freight_value NUMERIC(10,2),
 	CONSTRAINT order_items_pkey PRIMARY KEY (order_id, order_item_id),
	CONSTRAINT fk_items_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
	CONSTRAINT fk_items_product FOREIGN KEY (product_id) REFERENCES products(product_id),
 	CONSTRAINT fk_items_seller FOREIGN KEY (seller_id) REFERENCES sellers(seller_id)
);


-- Table: payments

-- DROP TABLE IF EXISTS payments;

CREATE TABLE IF NOT EXISTS payments
(
    order_id UUID NOT NULL,
    payment_sequential INTEGER NOT NULL,
    payment_type VARCHAR(50),
    payment_installments INTEGER,
    payment_value NUMERIC(10,2),
  	CONSTRAINT payments_pkey PRIMARY KEY (order_id, payment_sequential),
	CONSTRAINT fk_payments_order FOREIGN KEY (order_id) REFERENCES orders(order_id)
);


-- Table: reviews

-- DROP TABLE IF EXISTS reviews;

CREATE TABLE IF NOT EXISTS reviews
(
    review_id UUID NOT NULL,
    order_id UUID NOT NULL,
    review_score INTEGER,
    review_comment_title VARCHAR(255),
    review_comment_message TEXT,
    review_creation_date TIMESTAMP,
    review_answer_timestamp TIMESTAMP,
    CONSTRAINT reviews_pkey PRIMARY KEY (review_id),
    CONSTRAINT fk_reviews_order FOREIGN KEY (order_id) REFERENCES orders(order_id),
    CONSTRAINT reviews_review_score_check CHECK (review_score BETWEEN 1 AND 5)
);