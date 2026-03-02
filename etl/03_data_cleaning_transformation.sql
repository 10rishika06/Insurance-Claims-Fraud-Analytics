-- =====================================================
-- FILE: 03_data_cleaning_transformation.sql
-- PURPOSE: Clean and Transform Raw Data
-- =====================================================

CREATE TABLE insurance_clean AS
SELECT
    CAST(id AS INTEGER) AS customer_id,
    CAST(gender AS VARCHAR(10)) AS gender,
    CAST(age AS INTEGER) AS age,
    CAST(driving_license AS INTEGER) AS driving_license,
    CAST(region_code AS INTEGER) AS region_code,
    CAST(previously_insured AS INTEGER) AS previously_insured,
    CAST(vehicle_age AS VARCHAR(20)) AS vehicle_age,
    CAST(vechicle_damage AS VARCHAR(10)) AS vehicle_damage,
    CAST(annual_premium AS DECIMAL(12,2)) AS annual_premium,
    CAST(policy_sales_channel AS INTEGER) AS policy_sales_channel,
    CAST(vintage AS INTEGER) AS vintage,
    CAST(response AS INTEGER) AS response
FROM insurance_raw
WHERE id IS NOT NULL;

ALTER TABLE insurance_clean
ADD PRIMARY KEY (customer_id);
