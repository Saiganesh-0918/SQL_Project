-- Customers Table
CREATE TABLE customers (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    risk_category VARCHAR(10)
);

-- Accounts Table
CREATE TABLE accounts (
    account_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10),
    account_type VARCHAR(20),
    balance DECIMAL(12,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Transactions Table
CREATE TABLE transactions (
    transaction_id VARCHAR(10) PRIMARY KEY,
    account_id VARCHAR(10),
    transaction_date DATETIME,
    channel VARCHAR(20),
    merchant VARCHAR(50),
    amount DECIMAL(12,2),
    is_fraud INT,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
