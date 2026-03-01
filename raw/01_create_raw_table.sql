-- =====================================================
-- FILE: 01_create_raw_table.sql
-- PURPOSE: Create Raw Table to Load Kaggle CSV Data
-- =====================================================

CREATE TABLE insurance_raw ( 
    id TEXT,
    gender TEXT,
    age TEXT,
    driving_license TEXT,
    region_code TEXT,
    previously_insured TEXT,
    vehicle_age TEXT,
    vechicle_damage TEXT,
    annual_premium TEXT,
    policy_sales_channel TEXT,
    vintage TEXT,
    response TEXT
);
