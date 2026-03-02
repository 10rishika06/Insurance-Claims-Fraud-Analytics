-- =====================================================
-- FILE: 04_create_customers_table.sql
-- PURPOSE: Create Customers Dimension Table
-- =====================================================

CREATE TABLE customers AS
SELECT
    customer_id,
    gender,
    age,
    region_code
FROM insurance_clean;

ALTER TABLE customers
ADD PRIMARY KEY (customer_id);
