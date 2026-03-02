-- =====================================================
-- FILE: 08_function_get_total_claim.sql
-- PURPOSE: Function to Calculate Total Claim Amount
--          for a Given Customer
-- =====================================================

CREATE OR REPLACE FUNCTION get_total_claim(p_customer_id INT)
RETURNS NUMERIC AS
$$
DECLARE
    total_claim NUMERIC;
BEGIN
    SELECT SUM(claim_amount)
    INTO total_claim
    FROM claims
    WHERE customer_id = p_customer_id;

    RETURN COALESCE(total_claim, 0);
END;
$$ LANGUAGE plpgsql;



-- =====================================================
-- FUNCTION TEST EXECUTION
-- =====================================================

-- Example: Get total claim amount for customer_id = 100
SELECT get_total_claim(100);
