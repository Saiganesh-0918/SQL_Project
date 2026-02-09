-- =========================================================
-- EXPLANATION:
-- This file defines SQL views used for fraud monitoring
-- dashboards and reporting.
--
-- Views provide an abstraction layer over complex queries,
-- improving maintainability while enabling fast access to
-- pre-aggregated fraud metrics.
-- =========================================================

CREATE VIEW fraud_dashboard AS
SELECT
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions
FROM transactions;

-- View usage
SELECT * FROM fraud_dashboard;


-- View to summarize transactions by channel
CREATE VIEW channel_fraud_summary AS    
SELECT
    channel,
    COUNT(*) AS total_txns,
    SUM(is_fraud) AS fraud_txns
FROM transactions
GROUP BY channel;
-- View usage
SELECT * FROM channel_fraud_summary;
-- View to summarize daily transactions
CREATE VIEW daily_transaction_summary AS
SELECT
    DATE(transaction_date) AS transaction_day,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_transactions
FROM transactions
GROUP BY DATE(transaction_date);
