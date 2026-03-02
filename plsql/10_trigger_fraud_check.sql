-- =====================================================
-- FILE: 10_trigger_fraud_check.sql
-- PURPOSE: Trigger for Automatic Fraud Detection
--          During Claim Insertion
-- =====================================================

-- Trigger Function
CREATE OR REPLACE FUNCTION fraud_check()
RETURNS TRIGGER AS
$$
BEGIN
    IF NEW.claim_amount > 80000 THEN
        NEW.fraud_flag := TRUE;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;



-- Create Trigger
CREATE TRIGGER trg_fraud_check
BEFORE INSERT ON claims
FOR EACH ROW
EXECUTE FUNCTION fraud_check();



-- =====================================================
-- TRIGGER TEST (Optional)
-- Insert sample record to test automatic fraud flag
-- =====================================================

-- Example Test Insert
-- INSERT INTO claims (customer_id, claim_amount, claim_date, fraud_flag)
-- VALUES (101, 90000, CURRENT_DATE, FALSE);

-- After insertion, fraud_flag will automatically become TRUE
