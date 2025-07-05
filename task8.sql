--PROCEDURE : add new customers and orders
CREATE OR REPLACE PROCEDURE add_new_customer_and_order(
    p_customer_name VARCHAR,
    p_email VARCHAR,
    p_initial_order_amount DECIMAL DEFAULT NULL 
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_customer_id INT;
BEGIN
    -- Insert the new customer
    INSERT INTO customers (customer_name, email)
    VALUES (p_customer_name, p_email)
    RETURNING customer_id INTO v_customer_id; 

    RAISE NOTICE 'Customer "%" (ID: %) added successfully.', p_customer_name, v_customer_id;

    -- Conditional logic: If an initial order amount is provided, create an order
    IF p_initial_order_amount IS NOT NULL AND p_initial_order_amount > 0 THEN
        INSERT INTO orders (customer_id, order_amount)
        VALUES (v_customer_id, p_initial_order_amount);
        RAISE NOTICE 'Initial order for customer % (ID: %) with amount % added.', p_customer_name, v_customer_id, p_initial_order_amount;
    ELSE
        RAISE NOTICE 'No initial order added for customer % (ID: %).', p_customer_name, v_customer_id;
    END IF;

END;
$$;
-- --- Demonstrating Calling the Procedure ---
-- Call 1: Add a new customer with an initial order
CALL add_new_customer_and_order('Emily White', 'emily@example.com', 350.75);

-- Call 2: Add a new customer without an initial order
CALL add_new_customer_and_order('George Black', 'george@example.com');

-- Verify the new customer and order (if any)
SELECT c.customer_name, c.email, o.order_amount, o.order_date
FROM customers c
LEFT JOIN orders o ON c.customer_id = o.customer_id
WHERE c.customer_name IN ('Emily White', 'George Black');

--FUNCTION : getting customer's total spent
CREATE OR REPLACE FUNCTION get_customer_total_spent(p_customer_id INT)
RETURNS DECIMAL
LANGUAGE plpgsql
AS $$
DECLARE
    total_spent DECIMAL;
BEGIN
    SELECT SUM(order_amount)
    INTO total_spent
    FROM orders
    WHERE customer_id = p_customer_id;

    -- Handle case where customer has no orders
    RETURN COALESCE(total_spent, 0.00);
END;
$$;

-- --- Demonstrating Using the Function ---
SELECT
    c.customer_name,
    get_customer_total_spent(c.customer_id) AS total_spent_by_customer
FROM
    customers c
ORDER BY
    c.customer_name;
