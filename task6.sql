--Scalar subquery
SELECT
    order_id,
    customer_id,
    order_amount
FROM
    orders
WHERE
    order_amount > (SELECT AVG(order_amount) FROM orders);

SELECT
    c.customer_name,
    MAX(o.order_amount) AS customer_highest_order_amount,
    (SELECT MAX(order_amount) FROM orders) AS overall_highest_order_amount
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_name;

--Correlated subquery
SELECT
    c.customer_name,
    o.order_id,
    o.order_amount
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    o.order_amount > (
        SELECT AVG(o2.order_amount)
        FROM orders o2
        WHERE o2.customer_id = c.customer_id 
    );

--subquery inside IN operator
SELECT
    order_id,
    customer_id,
    order_amount
FROM
    orders
WHERE
    customer_id IN (
        SELECT customer_id
        FROM customers
        WHERE customer_name IN ('Alice Wonderland', 'Bob The Builder')
    );

--Subquery inside EXISTS operator
SELECT
    customer_id,
    customer_name
FROM
    customers c
WHERE
    EXISTS (
        SELECT 1
        FROM orders o
        WHERE o.customer_id = c.customer_id 
    );

--Subquery inside = (equality operator)
SELECT
    c.customer_name
FROM
    customers c
JOIN
    orders o ON c.customer_id = o.customer_id
WHERE
    o.order_amount = (SELECT MAX(order_amount) FROM orders);