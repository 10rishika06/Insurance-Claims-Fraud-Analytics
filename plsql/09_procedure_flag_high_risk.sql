-- =====================================================
-- FILE: 09_procedure_flag_high_risk.sql
-- PURPOSE: Procedure to Flag High-Risk Claims
--          (Claims > 2x Average Claim Amount)
-- =====================================================

CREATE OR REPLACE PROCEDURE flag_high_risk()
LANGUAGE plpgsql
AS
$$
BEGIN
    UPDATE claims
    SET fraud_flag = TRUE
    WHERE claim_amount > (
        SELECT AVG(claim_amount) * 2 
        FROM claims
    );
END;
$$;



-- =====================================================
-- PROCEDURE EXECUTION
-- =====================================================

-- Call procedure to update fraud flags
CALL flag_high_risk();
