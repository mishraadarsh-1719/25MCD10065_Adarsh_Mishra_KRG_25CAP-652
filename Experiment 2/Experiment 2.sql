create database dbb;
use dbb;

CREATE TABLE customer_orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    product VARCHAR(50),
    quantity INT,
    price NUMERIC(10,2),
    order_date DATE
);

INSERT INTO customer_orders (order_id, customer_name, product, quantity, price, order_date) VALUES
(1001,'Amit', 'Laptop', 1, 55000, '2024-01-10'),
(2002,'Neha', 'Mobile', 2, 30000, '2024-01-12'),
(3003,'Ravi', 'Laptop', 1, 60000, '2024-01-15'),
(4004,'Priya', 'Tablet', 3, 45000, '2024-01-18'),
(5005,'Karan', 'Mobile', 1, 15000, '2024-01-20'),
(6006,'Anita', 'Laptop', 2, 110000, '2024-01-22');

SELECT * 
FROM customer_orders
WHERE price > 40000;

SELECT customer_name, product, price
FROM customer_orders
ORDER BY price ASC;

SELECT customer_name, product, price
FROM customer_orders
ORDER BY price DESC;

SELECT customer_name, product, price
FROM customer_orders
ORDER BY product ASC, price DESC;

SELECT product, SUM(price) AS total_sales
FROM customer_orders
GROUP BY product;

SELECT product, SUM(price) AS total_sales
FROM customer_orders
GROUP BY product
HAVING SUM(price) > 70000;