-- =====================================================
-- FILE: 11_dashboard_view.sql
-- PURPOSE: Create Reporting View for Power BI Dashboard
-- =====================================================

CREATE OR REPLACE VIEW vw_dashboard AS
SELECT 
    c.region_code,
    c.gender,
    COUNT(cl.claim_id) AS total_claims,
    SUM(cl.claim_amount) AS total_claim_amount,
    ROUND(
        (SUM(cl.claim_amount) / NULLIF(SUM(p.annual_premium), 0)) * 100,
        2
    ) AS loss_ratio
FROM customers c
JOIN policies p
ON c.customer_id = p.customer_id
LEFT JOIN claims cl
ON c.customer_id = cl.customer_id
GROUP BY c.region_code, c.gender;



-- =====================================================
-- VIEW TEST QUERY
-- =====================================================

SELECT * FROM vw_dashboard;
