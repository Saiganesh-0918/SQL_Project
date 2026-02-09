-- =========================================================
-- EXPLANATION:
-- This file contains multiple examples of fraud detection
-- queries using filtering, aggregation, grouping, and
-- date-based analysis.
--
-- The high-value transaction queries are written in two
-- forms: one without index usage and one explicitly
-- utilizing the index on the `amount` column. This
-- demonstrates how indexing can improve query performance
-- for large transactional datasets.
--
-- These queries were designed to analyze transaction
-- behavior efficiently while minimizing full table scans.
-- =========================================================

-- High-value suspicious transactions
SELECT *
FROM transactions
WHERE amount > 30000;

-- High-value suspicious transactions utilizing index on amount
SELECT *
FROM transactions WITH (INDEX(idx_transaction_amount))
WHERE amount > 30000;
      


-- Overall fraud statistics
SELECT
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions
FROM transactions;
-- Transactions by channel
SELECT
    channel,
    COUNT(*) AS transaction_count,
    SUM(is_fraud) AS fraud_count    
FROM transactions
GROUP BY channel;   
-- Daily transaction summary
SELECT
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions
FROM transactions
GROUP BY DATE(transaction_date)
ORDER BY transaction_day;

