-- =========================================================
-- EXPLANATION:
-- Indexes in this file are created on frequently queried
-- columns such as transaction amount and account ID.
--
-- These indexes are actively utilized in filtering and
-- join operations across the project to reduce query
-- execution time and avoid unnecessary full table scans.
--
-- The presence of these indexes supports optimized joins
-- and high-volume transactional analysis.
-- =========================================================

CREATE INDEX idx_transaction_amount ON transactions(amount);
CREATE INDEX idx_account_id ON transactions(account_id);
-- Performance validation for index usage
EXPLAIN ANALYZE
SELECT *
FROM transactions
WHERE amount > 20000;

-- Performance validation for index usage on account_id
EXPLAIN ANALYZE
SELECT *    
FROM transactions
WHERE account_id = ACC000336;

