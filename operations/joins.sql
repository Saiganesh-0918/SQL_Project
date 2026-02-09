-- =========================================================
-- EXPLANATION:
-- This file contains multiple JOIN examples including
-- INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL OUTER JOIN.
--
-- Joins are performed on indexed foreign key columns such
-- as `account_id` and `customer_id`, ensuring efficient
-- data retrieval when working with large datasets.
--
-- These examples demonstrate how relational integrity
-- and indexed joins improve query performance in
-- transaction-heavy systems.
-- =========================================================

-- Example 1: Inner Join to get customer details for fraudulent transactions
SELECT
    t.transaction_id,
    c.customer_name,
    c.city,
    t.amount,
    t.channel,
    c.risk_category
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE t.is_fraud = 1;
-- Example 2: Left Join to get all customers and their transactions, including those without transactions
SELECT  
    c.customer_id,
    c.customer_name,
    t.transaction_id,
    t.amount,
    t.channel
FROM customers c
LEFT JOIN accounts a ON c.customer_id = a.customer_id
LEFT JOIN transactions t ON a.account_id = t.account_id;
-- Example 3: Right Join to get all transactions and their associated customers, including transactions without 
-- associated customers
SELECT
    t.transaction_id,
    t.amount,
    c.customer_name,
    c.city
FROM transactions t
RIGHT JOIN accounts a ON t.account_id = a.account_id
RIGHT JOIN customers c ON a.customer_id = c.customer_id;
-- Example 4: Full Outer Join to get all customers and transactions, matching where possible
SELECT  
    c.customer_id,
    c.customer_name,
    t.transaction_id,
    t.amount,
    t.channel
FROM customers c
FULL OUTER JOIN accounts a ON c.customer_id = a.customer_id
FULL OUTER JOIN transactions t ON a.account_id = t.account_id;

-- Index usage in joins
EXPLAIN ANALYZE
SELECT
    t.transaction_id,
    c.customer_name,
    t.amount
FROM transactions t
JOIN accounts a ON t.account_id = a.account_id
JOIN customers c ON a.customer_id = c.customer_id
WHERE c.customer_id = CUST000123;