CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY, 
    customer_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY, 
    customer_id INT NOT NULL,
    order_date DATE DEFAULT CURRENT_DATE,
    order_amount DECIMAL(10, 2) NOT NULL
);

INSERT INTO customers (customer_name, email) VALUES
('Alice Wonderland', 'alice@example.com'),       
('Bob The Builder', 'bob@example.com'),         
('Charlie Chaplin', 'charlie@example.com'),    
('David Copperfield', 'david@example.com');
SELECT * FROM customers;

INSERT INTO orders (customer_id, order_date, order_amount) VALUES
(1, '2025-01-10', 150.00), 
(2, '2025-01-12', 200.50), 
(1, '2025-01-15', 75.25);  
SELECT * FROM orders;

--INNER JOIN
SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.order_amount
FROM
    customers c
INNER JOIN
    orders o ON c.customer_id = o.customer_id
ORDER BY
    c.customer_name, o.order_date;

--LEFT JOIN
SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.order_amount
FROM
    customers c
LEFT JOIN
    orders o ON c.customer_id = o.customer_id
ORDER BY
    c.customer_name, o.order_date;


--RIGHT JOIN
SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    o.order_id,
    o.order_date,
    o.order_amount
FROM
    customers c
RIGHT JOIN
    orders o ON c.customer_id = o.customer_id
ORDER BY
    c.customer_name, o.order_date;


--FULL OUTER JOIN
SELECT
    c.customer_id AS customer_id_from_customers,
    c.customer_name,
    c.email,
    o.order_id,
    o.customer_id AS customer_id_from_orders,
    o.order_date,
    o.order_amount
FROM
    customers c
FULL OUTER JOIN
    orders o ON c.customer_id = o.customer_id
ORDER BY
    c.customer_name, o.order_date;