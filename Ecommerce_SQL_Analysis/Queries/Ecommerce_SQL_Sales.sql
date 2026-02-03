CREATE DATABASE ecommerce_olist;

CREATE TABLE product_category_name_translation (
  product_category_name VARCHAR(100) PRIMARY KEY,
  product_category_name_english VARCHAR(100)
);

CREATE TABLE customers (
customer_id VARCHAR(50) PRIMARY KEY,
  customer_unique_id VARCHAR(50),
  customer_zip_code_prefix INT,
  customer_city VARCHAR(100),
  customer_state CHAR(2)
);

CREATE TABLE sellers(
seller_id VARCHAR(50) PRIMARY KEY,
  seller_zip_code_prefix INT,
  seller_city VARCHAR(100),
  seller_state CHAR(2)
);


CREATE TABLE products (
    product_id VARCHAR(50) PRIMARY KEY,
    product_category_name VARCHAR(100),
    product_name_length INT,
    product_description_length INT,
    product_photos_qty INT,
    product_weight_g INT,
    product_length_cm INT,
    product_height_cm INT,
    product_width_cm INT,
        FOREIGN KEY (product_category_name)
        REFERENCES product_category_name_translation(product_category_name)
);

CREATE TABLE orders (
    order_id VARCHAR(50) PRIMARY KEY,
    customer_id VARCHAR(50),
    order_status VARCHAR(50),
    order_purchase_timestamp VARCHAR(25),
    order_approved_at VARCHAR(25),
    order_delivered_carrier_date VARCHAR(25),
    order_delivered_customer_date VARCHAR(25),
    order_estimated_delivery_date VARCHAR(25),
        FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_id VARCHAR(50),
    order_item_id INT,
    product_id VARCHAR(50),
    seller_id VARCHAR(50),
    shipping_limit_date VARCHAR(25),
    price DECIMAL(10,2),
    freight_value DECIMAL(10,2),
    PRIMARY KEY (order_id, order_item_id),
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
        FOREIGN KEY (product_id)
        REFERENCES products(product_id),
        FOREIGN KEY (seller_id)
        REFERENCES sellers(seller_id)
);

CREATE TABLE order_payments (
    order_id VARCHAR(50),
    payment_sequential INT,
    payment_type VARCHAR(50),
    payment_installments INT,
    payment_value DECIMAL(10,2),
    PRIMARY KEY (order_id, payment_sequential),
        FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE order_reviews (
    review_pk INT PRIMARY KEY,
    review_id VARCHAR(50),
    order_id VARCHAR(50),
    review_score INT,
    review_comment_title VARCHAR(50),
    review_comment_message VARCHAR(500),
    review_creation_date VARCHAR(25),
    review_answer_timestamp VARCHAR(25),
    INDEX (review_id),
    INDEX (order_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE geolocation (
    geolocation_zip_code_prefix INT,
    geolocation_lat DECIMAL(10,6),
    geolocation_lng DECIMAL(10,6),
    geolocation_city VARCHAR(100),
    geolocation_state CHAR(2)
);

1) Total Revenue (overall performance)
SELECT ROUND(SUM(price + freight_value), 2) AS total_revenue
FROM order_items;

2) Monthly Revenue Trend (growth & seasonality)
SELECT DATE_FORMAT(o.order_purchase_timestamp, '%Y-%m') AS month,
       ROUND(SUM(oi.price + freight_value), 2) AS revenue
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id
GROUP BY month
ORDER BY month;

3) Revenue by Product Category (demand drivers)
SELECT COALESCE(t.product_category_name_english, p.product_category_name) AS category,
       ROUND(SUM(oi.price + freight_value), 2) AS revenue
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id
LEFT JOIN product_category_name_translation t
  ON t.product_category_name = p.product_category_name
GROUP BY category
ORDER BY revenue DESC;

4) One-time vs Repeat Customers (customer behaviour)
SELECT 
  CASE WHEN order_count = 1 THEN 'One-time' ELSE 'Repeat' END AS customer_type,
  COUNT(*) AS customers
FROM (
  SELECT customer_id, COUNT(*) AS order_count
  FROM orders
  GROUP BY customer_id
) x
GROUP BY customer_type;

5) Average Review Score (customer satisfaction)
SELECT ROUND(AVG(review_score), 2) AS avg_review_score
FROM order_reviews;