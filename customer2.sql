SELECT 
    o.order_id, 
    c.name AS customer_name, 
    o.total_price 
FROM Orderstable o
JOIN Customerstable c ON o.customer_id = c.customer_id;

SELECT DISTINCT c.name
FROM Customerstable c
JOIN Orderstable o ON c.customer_id = o.customer_id
WHERE YEAR(o.order_date) = 2024;

SELECT 
    p.name AS product_name, 
    SUM(o.quantity) AS total_sold, 
    SUM(o.total_price) AS total_revenue
FROM Orderstable o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name;


----Identify the product with the highest revenue.

SELECT TOP 1
    p.name AS product_name, 
    SUM(o.total_price) AS revenue
FROM Orderstable o
JOIN Products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY revenue DESC;

---Calculate the average order value per customer.
SELECT 
    c.name AS customer_name, 
    AVG(o.total_price) AS avg_order_value
FROM Customerstable c
JOIN Orderstable o ON c.customer_id = o.customer_id
GROUP BY c.name;

---Retrieve customers who ordered products with stock below 30.

SELECT DISTINCT c.name
FROM Customerstable c
JOIN Orderstable o ON c.customer_id = o.customer_id
JOIN Products p ON o.product_id = p.product_id
WHERE p.stock <= 60;


ALTER TABLE Customerstable
ADD referrer_id INT;


-- Set referrer_id to NULL for the first customer (no referrer)
UPDATE Customerstable
SET referrer_id = NULL
WHERE customer_id = 1;

-- Assign customer 1 as the referrer for customers 2 and 3
UPDATE Customerstable
SET referrer_id = 1
WHERE customer_id IN (2, 3);

-- Optionally, assign customer 2 as the referrer for customer 4
UPDATE Customerstable
SET referrer_id = 2
WHERE customer_id = 4;

-- Assign customer 3 as the referrer for customer 5
UPDATE Customerstable
SET referrer_id = 3
WHERE customer_id = 5;


-- Make sure any previous statements end with a semicolon
WITH referral_tree AS (
    -- Anchor: Customers without referrers
    SELECT 
        customer_id, 
        name, 
        referrer_id, 
        0 AS level
    FROM Customerstable
    WHERE referrer_id IS NULL

    UNION ALL

    -- Recursive: Customers referred by someone in the tree
    SELECT 
        c.customer_id, 
        c.name, 
        c.referrer_id, 
        rt.level + 1
    FROM Customerstable c
    INNER JOIN referral_tree rt ON c.referrer_id = rt.customer_id
    
)



-- Final query to retrieve the referral hierarchy
SELECT 
    customer_id, 
    name, 
    referrer_id, 
    level
FROM referral_tree
ORDER BY level, customer_id;



--Stored Procedure Queries

CREATE PROCEDURE GetCustomersByCity1
    @City NVARCHAR(50)

AS
BEGIN
    SELECT customer_id, name, email, city, created_at
    FROM Customerstable
    WHERE city = @City;
END;


EXEC GetCustomersByCity1 @City = 'New York';

CREATE PROCEDURE GetCustomerOrderCount2
    @CustomerID INT,
    @OrderCount INT OUTPUT
AS
BEGIN
    SELECT @OrderCount = COUNT(*)
    FROM Orderstable
    WHERE customer_id = @CustomerID;
END;


DECLARE @Count INT;
EXEC GetCustomerOrderCount1 @CustomerID = 1, @OrderCount = @Count OUTPUT;
SELECT @Count AS Ordercount;




SELECT name, email
FROM Customerstable
WHERE customer_id IN (
    SELECT customer_id
    FROM Orderstable
    WHERE total_price > 500
);

SELECT 
    c.customer_id, 
    c.name, 
    c.email, 
    (SELECT COUNT(*)
     FROM Orderstable o
     WHERE o.customer_id = c.customer_id) AS total_orders
FROM Customerstable c;


SELECT name
FROM Products
WHERE product_id NOT IN (
    SELECT DISTINCT product_id
    FROM Orderstable
);


SELECT name, email
FROM Customerstable
WHERE customer_id IN (
    SELECT customer_id
    FROM Orderstable
    GROUP BY customer_id
    HAVING SUM(total_price) > (
        SELECT AVG(total_price)
        FROM Orderstable
    )
);



SELECT 
    c.name, 
    t.total_spent
FROM Customerstable c
JOIN (
    SELECT 
        customer_id, 
        SUM(total_price) AS total_spent
    FROM Orderstable
    GROUP BY customer_id
) t ON c.customer_id = t.customer_id;


SELECT product_id, name
FROM products
WHERE product_id NOT IN (SELECT product_id FROM orderstable);


----Customers Who Ordered More Than the Average Order Quantity
---Find customers who placed orders greater than the average order quantity.

SELECT customer_id, COUNT(order_id) AS total_orders
FROM orderstable
GROUP BY customer_id
HAVING COUNT(order_id) > (SELECT AVG(total_orders) 
                          FROM (SELECT COUNT(order_id) AS total_orders
                                FROM orderstable
                                GROUP BY customer_id) subquery);


---Delete Duplicate in Table

SELECT emp_id, COUNT(*)
FROM employees
GROUP BY emp_id
HAVING COUNT(*) > 1;




-----Find Students With Better Scores Than the Class Average
---Find students who scored above the average for their class.

SELECT student_id, name, score, class_id
FROM studentss1
WHERE score > (SELECT AVG(score)
               FROM studentss2);


SELECT customer_id, order_id, product_id
FROM orderstable
WHERE product_id = (SELECT product_id
                    FROM products
                    WHERE price = (SELECT MAX(price) FROM products));




BEGIN TRANSACTION;

-- Debit from account A
UPDATE accounts
SET balance = balance - 500
WHERE account_id = 1;

-- Credit to account B
UPDATE accounts
SET balance = balance + 500
WHERE account_id = 2;

-- Simulate an error (comment this out for a successful transaction)
-- ROLLBACK;

COMMIT;

BEGIN TRANSACTION;

-- Insert into the parent table
INSERT INTO departments (department_id, department_name)
VALUES (101, 'Sales');

-- Insert into the child table (valid due to foreign key constraint)
INSERT INTO employees (emp_id, name, department_id)
VALUES (1001, 'John Doe', 101);

COMMIT;

-- Attempt to violate consistency (this will fail)
INSERT INTO employees (emp_id, name, department_id)
VALUES (1002, 'Jane Doe', 999); -- 999 doesn't exist in departments


----Isolation

-- Transaction A
BEGIN TRANSACTION;
UPDATE accounts SET balance = balance - 100 WHERE account_id = 1;

-- Transaction B
SELECT balance FROM accounts WHERE account_id = 1; -- Will not see the uncommitted update

-- Commit Transaction A
COMMIT;


---Durability

BEGIN TRANSACTION;

INSERT INTO logs (log_id, message, created_at)
VALUES (2, 'Transaction initiated', '2025-06-14 14:49:50.870');

COMMIT;

-- Simulate a crash (e.g., power failure)
-- Verify durability by checking the `logs` table after recovery.
SELECT * FROM logs WHERE log_id = 2; -- The row persists in the database.

--ACID

BEGIN TRANSACTION;

-- Check sufficient balance
IF (SELECT balance FROM accounts WHERE account_id = 1) >= 1000 BEGIN
    -- Debit from account A
    UPDATE accounts SET balance = balance - 1000 WHERE account_id = 1;

    -- Credit to account B
    UPDATE accounts SET balance = balance + 1000 WHERE account_id = 2;

    -- Commit transaction
    COMMIT;
END
ELSE
BEGIN
    -- Rollback if insufficient balance
    ROLLBACK;
END;