--view for complex SELECT
CREATE VIEW customer_order AS
SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    COUNT(o.order_id) AS total_orders,
    SUM(o.order_amount) AS total_spent,
    MAX(o.order_date) AS last_order_date
FROM
    customers c
JOIN 
    orders o ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id, c.customer_name, c.email
ORDER BY
    c.customer_name;

--view for security
CREATE VIEW customer_contact_info AS
SELECT
    customer_id,
    customer_name
FROM
    customers;

--view for abstraction
CREATE VIEW recent_high_value_orders AS
SELECT
    o.order_id,
    c.customer_name,
    o.order_amount,
    o.order_date
FROM
    orders o
JOIN
    customers c ON o.customer_id = c.customer_id
WHERE
    o.order_date >= CURRENT_DATE - INTERVAL '30 days' 
    AND o.order_amount > 100.00 
ORDER BY
    o.order_date DESC