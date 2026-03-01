-- =====================================================
-- FILE: 02_load_raw_data.sql
-- PURPOSE: Load Kaggle CSV Data into Raw Table
-- NOTE: In this project, data was loaded using pgAdmin GUI.
--       Below is the production-ready COPY command
--       for automated loading.
-- =====================================================

-- Example COPY Command (For Automation)

COPY insurance_raw
FROM 'C:/Rishika/train.csv'
DELIMITER ','
CSV HEADER;
