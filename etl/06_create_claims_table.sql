-- =====================================================
-- FILE: 06_create_claims_table.sql
-- PURPOSE: Create Claims Table and Simulate Claim Data
-- =====================================================

CREATE TABLE claims (
    claim_id SERIAL PRIMARY KEY,
    customer_id INT,
    claim_amount NUMERIC,
    claim_date DATE,
    fraud_flag BOOLEAN
);

INSERT INTO claims (customer_id, claim_amount, claim_date, fraud_flag)
SELECT
    customer_id,
    (RANDOM()*100000)::INT,
    CURRENT_DATE - (RANDOM()*365)::INT,
    CASE WHEN RANDOM() > 0.85 THEN TRUE ELSE FALSE END
FROM customers
WHERE RANDOM() < 0.3;
