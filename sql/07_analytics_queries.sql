-- =====================================================
-- FILE: 07_analytics_queries.sql
-- PURPOSE: Business & Analytical Queries
-- DESCRIPTION:
-- This file contains validation checks, KPI calculations,
-- fraud analysis, and advanced SQL reporting queries.
-- =====================================================



-- =====================================================
-- 0. DATA VALIDATION & RECORD COUNTS
-- Used for sanity check and dashboard KPI cards
-- =====================================================

-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Policies
SELECT COUNT(*) AS total_policies
FROM policies;

-- Total Claims
SELECT COUNT(*) AS total_claims
FROM claims;



-- =====================================================
-- 1. High Value Claims (Above Average Claim Amount)
-- =====================================================

WITH avg_claim AS (
    SELECT AVG(claim_amount) AS avg_amt 
    FROM claims
)
SELECT 
    claim_id, 
    customer_id, 
    claim_amount
FROM claims, avg_claim
WHERE claim_amount > avg_amt
ORDER BY claim_amount DESC;



-- =====================================================
-- 2. Premium Ranking (Window Function Usage)
-- =====================================================

SELECT 
    customer_id,
    annual_premium,
    RANK() OVER (ORDER BY annual_premium DESC) AS premium_rank
FROM policies;



-- =====================================================
-- 3. Overall Loss Ratio Calculation
-- Business KPI: Claims vs Premium
-- =====================================================

SELECT 
    SUM(p.annual_premium) AS total_premium,
    SUM(cl.claim_amount) AS total_claim_amount,
    ROUND(
        (SUM(cl.claim_amount) / NULLIF(SUM(p.annual_premium), 0)) * 100, 
        2
    ) AS loss_ratio_percentage
FROM policies p
JOIN claims cl 
ON p.customer_id = cl.customer_id;



-- =====================================================
-- 4. Top 10 Customers by Total Claim Amount
-- =====================================================

SELECT 
    c.customer_id,
    c.gender,
    SUM(cl.claim_amount) AS total_claim
FROM customers c
JOIN claims cl
ON c.customer_id = cl.customer_id
GROUP BY c.customer_id, c.gender
ORDER BY total_claim DESC
LIMIT 10;



-- =====================================================
-- 5. Fraud Percentage by Region
-- =====================================================

SELECT 
    c.region_code,
    COUNT(cl.claim_id) AS total_claims,
    SUM(CASE WHEN cl.fraud_flag = TRUE THEN 1 ELSE 0 END) AS fraud_count,
    ROUND(
        (SUM(CASE WHEN cl.fraud_flag = TRUE THEN 1 ELSE 0 END) * 100.0)
        / NULLIF(COUNT(cl.claim_id), 0), 
        2
    ) AS fraud_percentage
FROM customers c
JOIN claims cl
ON c.customer_id = cl.customer_id
GROUP BY c.region_code
ORDER BY fraud_percentage DESC;



-- =====================================================
-- 6. Customers Without Any Claims
-- =====================================================

SELECT 
    c.customer_id,
    c.gender
FROM customers c
LEFT JOIN claims cl
ON c.customer_id = cl.customer_id
WHERE cl.customer_id IS NULL;



-- =====================================================
-- 7. Claim Analysis by Age Group
-- =====================================================

SELECT 
    CASE 
        WHEN c.age < 25 THEN 'Young'
        WHEN c.age BETWEEN 25 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS age_group,
    COUNT(cl.claim_id) AS total_claims,
    SUM(cl.claim_amount) AS total_claim_amount
FROM customers c
JOIN claims cl
ON c.customer_id = cl.customer_id
GROUP BY age_group
ORDER BY total_claim_amount DESC;
