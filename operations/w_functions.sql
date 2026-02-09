-- =========================================================
-- EXPLANATION:
-- This file demonstrates the use of SQL window functions
-- for advanced transaction analysis such as running totals,
-- moving averages, rankings, and cumulative fraud counts.
--
-- Window functions enable analytical insights without
-- collapsing result sets, making them ideal for financial
-- and fraud detection use cases.
-- =========================================================



-- Number of transactions per account
SELECT
    transaction_id,
    account_id,
    amount,
    COUNT(*) OVER (PARTITION BY account_id) AS txn_count
FROM transactions;

-- Running transaction amount (AML pattern)
SELECT
    transaction_id,
    account_id,
    transaction_date,
    SUM(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS running_total
FROM transactions;

-- Moving average of transaction amounts over last 3 transactions per account
SELECT
    transaction_id,
    account_id,
    amount,
    AVG(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS moving_avg_amount
FROM transactions;
-- Cumulative fraud count per account
SELECT
    transaction_id,
    account_id,
    is_fraud,
    SUM(is_fraud) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_fraud_count
FROM transactions;
-- Rank transactions by amount within each channel
SELECT
    transaction_id,
    channel,
    amount,
    RANK() OVER (
        PARTITION BY channel
        ORDER BY amount DESC
    ) AS amount_rank
FROM transactions;