-- =====================================================
-- FILE: 05_create_policies_table.sql
-- PURPOSE: Create Policies Fact Table
-- =====================================================

CREATE TABLE policies AS
SELECT
    customer_id,
    annual_premium,
    policy_sales_channel,
    vintage,
    response
FROM insurance_clean;

ALTER TABLE policies
ADD CONSTRAINT fk_customer
FOREIGN KEY (customer_id)
REFERENCES customers(customer_id);]
