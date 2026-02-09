-- =========================================================
-- EXPLANATION:
-- This stored procedure aggregates transaction data by
-- channel to provide quick fraud statistics.
--
-- The procedure encapsulates business logic to allow
-- repeated execution with consistent performance and
-- reduced query complexity for end users.
-- =========================================================

DELIMITER $$

CREATE PROCEDURE fraud_by_channel()
BEGIN
    SELECT
        channel,
        COUNT(*) AS total_txns,
        SUM(is_fraud) AS fraud_txns
    FROM transactions
    GROUP BY channel;
END$$

DELIMITER ;

-- Call procedure
CALL fraud_by_channel();


