
CREATE DATABASE  optimization ;
USE optimization ;


CREATE TABLE customers (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL
);


CREATE TABLE orders (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    created_at DATETIME NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);


CREATE TABLE order_items (
    id INT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id)
);



INSERT INTO customers (id, name, email) VALUES
(10, 'John Doe', 'john@example.com'),
(20, 'Alice Smith', 'alice@example.com');


INSERT INTO orders (id, customer_id, total_amount, created_at) VALUES
(1, 10, 200.00, '2024-01-05 10:30:00'),
(2, 20, 450.00, '2024-01-07 12:00:00'),
(3, 10, 150.00, '2024-02-10 14:20:00');


INSERT INTO order_items (id, order_id, product_id, quantity, price) VALUES
(1, 1, 5, 2, 100.00),
(2, 2, 8, 3, 150.00),
(3, 3, 2, 1, 150.00);





-- 1
SELECT c.id, c.name, SUM(o.total_amount) AS total_spent
FROM customers c
JOIN orders o ON c.id = o.customer_id
WHERE o.created_at >= DATE_SUB(NOW(), INTERVAL 6 MONTH)
GROUP BY c.id, c.name
ORDER BY total_spent DESC
LIMIT 5;

-- 2
SELECT 
    o.id AS order_id,
    o.customer_id,
    o.created_at,
    oi.product_id,
    oi.quantity,
    oi.price
FROM orders o
JOIN order_items oi 
    ON o.id = oi.order_id
ORDER BY o.id;






