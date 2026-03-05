# Insurance Claims & Fraud Analytics Dashboard

## Project Overview
This project analyzes insurance customer and policy data to identify **claim patterns, fraud indicators, and business profitability**. The solution uses **PostgreSQL for data processing and analytics** and **Power BI for interactive dashboard visualization**.

The project demonstrates an end-to-end analytics workflow including **data cleaning, relational modeling, analytical SQL queries, fraud detection logic, and business intelligence reporting**.

---

## Technologies Used
- PostgreSQL
- SQL
- PL/pgSQL
- Power BI
- GitHub

---

## Database Structure
The project uses the following tables:

- **insurance_raw** – Raw dataset imported from CSV  
- **insurance_clean** – Cleaned and type-converted dataset  
- **customers** – Customer demographic information  
- **policies** – Policy details and premium information  
- **claims** – Simulated claim transactions with fraud flag  

---

## Key SQL Features Implemented
- Data cleaning using `CAST`
- Relational table design with primary & foreign keys
- Window functions (`RANK`)
- Common Table Expressions (CTE)
- Aggregations and business KPI calculations

---

## Advanced Database Components
- **Function:** Calculate total claim amount for a customer  
- **Stored Procedure:** Flag high-risk claims  
- **Trigger:** Automatically detect fraud based on claim amount  
- **View (`vw_dashboard`):** Simplified dataset for Power BI reporting  

---

## Power BI Dashboard

### Page 1 – Executive Overview
Displays high-level business performance.

**KPIs**
- Total Customers
- Total Policies
- Total Claims
- Total Premium
- Total Claim Amount
- Loss Ratio %

**Visualizations**
- Claims by Region
- Gender Distribution
- Claims by Age Group
- Monthly Claim Trend

---

### Page 2 – Profitability & Risk Analysis
Focuses on deeper claim and risk insights.

**Visuals**
- Loss Ratio by Region
- Average Claim Amount
- Top 5 Customers by Claim Amount
- Fraud vs Non-Fraud Claims
- Customer Premium vs Claims Table

**Filters**
- Gender
- Region Code
- Age Group

---

## Business Insight Example
A key KPI used in the dashboard is **Loss Ratio**.

Loss Ratio = Total Claim Amount / Total Premium

This metric helps identify **loss-making regions and potential pricing adjustments**.

---

## Learning Outcomes
- SQL data modeling and analytics
- PostgreSQL functions, procedures, and triggers
- Fraud detection logic
- Business KPI analysis
- Power BI dashboard development

---

## Author
Data Analytics portfolio project demonstrating **SQL, PostgreSQL, and Power BI skills**.
