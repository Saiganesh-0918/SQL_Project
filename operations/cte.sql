-- =========================================================
-- EXPLANATION:
-- This file demonstrates the use of Common Table
-- Expressions (CTEs) to simplify complex fraud analysis
-- queries.
--
-- Indexes on transactional columns (such as `amount`)
-- are leveraged inside the CTEs to reduce scan cost and
-- improve readability without impacting performance.
--
-- The CTE approach helps in breaking down large analytical
-- queries into reusable and optimized logical steps.
-- =========================================================

WITH fraud_summary AS (
    SELECT
        a.customer_id,
        COUNT(*) AS total_txns,
        SUM(t.is_fraud) AS fraud_txns
    FROM transactions t
    JOIN accounts a ON t.account_id = a.account_id
    GROUP BY a.customer_id
)
SELECT
    customer_id,
    fraud_txns,
    total_txns,
    ROUND(fraud_txns * 100.0 / total_txns, 2) AS fraud_rate
FROM fraud_summary
WHERE fraud_txns > 0;

-- CTE to summarize daily transactions
WITH daily_txn_summary AS ( 
    SELECT
        DATE(transaction_date) AS txn_date,
        COUNT(*) AS total_txns,
        SUM(is_fraud) AS fraud_txns
    FROM transactions
    GROUP BY DATE(transaction_date)
)
SELECT
    txn_date,
    total_txns,
    fraud_txns,
    ROUND(fraud_txns * 100.0 / total_txns, 2) AS fraud_rate
FROM daily_txn_summary
ORDER BY txn_date DESC;


-- CTE to get high-value transactions utilizing index on amount
WITH high_value_txns AS (
    SELECT
        transaction_id,
        account_id,
        amount,
        channel,
        is_fraud
    FROM transactions WITH (INDEX(idx_transaction_amount))
    WHERE amount > 20000
)
SELECT *
FROM high_value_txns    
WHERE is_fraud = 1;   