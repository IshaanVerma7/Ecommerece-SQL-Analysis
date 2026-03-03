# Ecommerece-SQL-Analysis
# Project Overview
 This project involves designing a comprehensive relational database for an e-commerce platform. It demonstrates my ability to create a structured data environment, ensure data quality through constraints, and extract meaningful business insights using advanced SQL queries.
# 🏗️ Database Architecture
The database consists of four core tables: Users, Products, Orders, and Order_Items.

Data Integrity Features:
Primary & Foreign Keys: Established to maintain referential integrity across the system.

CHECK Constraints: Implemented to prevent business logic errors (e.g., price > 0, stock >= 0).

NOT NULL: Applied to critical fields like email and product_name to ensure data completeness.
# Project Workflow
1. Schema Setup (01_schema_setup.sql)
Created the physical database structure. Used normalization principles to reduce data redundancy.

2. Data Cleaning (03_data_cleaning.sql)
I identified a common e-commerce issue: Duplicate Orders.

Method: Used a Common Table Expression (CTE) with the **ROW_NUMBER() window function.

Result: Successfully identified and removed duplicate rows while keeping the unique original record.
3. Business Analysis (04_analytical_queries.sql)
Top-Selling Products: Identified products generating the highest revenue using **SUM()** and **JOIN**.

Customer Loyalty: Filtered for "Power Users" (customers with multiple orders) using **GROUP BY** and **HAVING clauses**.
