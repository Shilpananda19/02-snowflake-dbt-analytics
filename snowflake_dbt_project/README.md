# Snowflake + dbt Analytics Platform

## Overview

This project demonstrates an end-to-end analytics engineering workflow using Snowflake and dbt.

The pipeline ingests customer, order, and product data into Snowflake RAW tables and transforms the data through staging, intermediate, and mart layers using dbt.

The project focuses on:

- Snowflake data warehousing
- dbt ELT transformations
- Layered data modeling
- SQL transformations
- dbt model dependencies using `source()` and `ref()`
- Data quality testing
- Business-ready analytical marts

## Architecture

```text
CSV Files
    |
    v
Snowflake RAW
    |
    | source()
    v
Staging Layer
    |
    | ref()
    v
Intermediate Layer
    |
    | ref()
    v
Marts Layer
    |
    v
Analytics / BI
```

## Snowflake Layers
DBT_ANALYTICS
|
+-- RAW
|   +-- CUSTOMERS
|   +-- ORDERS
|   +-- PRODUCTS
|
+-- DBT_DEV
    |
    +-- STAGING
    |   +-- STG_CUSTOMERS
    |   +-- STG_ORDERS
    |   +-- STG_PRODUCTS
    |
    +-- INTERMEDIATE
    |   +-- INT_ORDERS_ENRICHED
    |   +-- INT_CUSTOMER_ORDER_METRICS
    |
    +-- MARTS
        +-- CUSTOMER_ORDER_SUMMARY
        +-- PRODUCT_SALES_SUMMARY

## Data Layers

### RAW
Contains source data loaded from CSV files into Snowflake tables.

CUSTOMERS
ORDERS
PRODUCTS

### STAGING
Contains lightly transformed dbt views that standardize and expose the raw source data.

Models:
stg_customers
stg_orders
stg_products

Materialization:
`VIEW`

### INTERMEDIATE
Contains reusable transformation logic and joins.

Models:
int_orders_enriched
int_customer_order_metrics

Key transformations include:
Customer and product enrichment
Order-level calculations
Order totals
Customer-level order metrics
Total spend
Average order value

Materialization:
`VIEW`

### MARTS
Contains business-ready analytical datasets.

Models:
customer_order_summary
product_sales_summary

These models are designed for downstream analytics and BI consumption.

Materialization:
`TABLE`

## Data Quality

The project uses dbt tests at multiple layers.

### Generic tests

Implemented using dbt YAML properties:
not_null
unique
relationships

### Singular tests

Custom SQL tests validate business rules such as:
Order quantities must be positive
Unit prices must not be negative
Product categories must contain valid values

### Test Results

```text
51 / 51 dbt tests passed
```

The final mart datasets were also validated against expected business totals in Snowflake.

## dbt Commands

Parse the project:
```powershell
dbt parse --project-dir ./snowflake_dbt_project
```
Build models and run tests:
```powershell
dbt build --project-dir ./snowflake_dbt_project
```
Run tests:
```powershell
dbt test --project-dir ./snowflake_dbt_project
```
Run models:
```powershell
dbt run --project-dir ./snowflake_dbt_project
```

## Technologies
Snowflake
dbt Core
dbt Snowflake Adapter
SQL
Python
Git / GitHub

## Key Concepts Demonstrated
ELT architecture
Layered data modeling
dbt source()
dbt ref()
View vs table materialization
Model dependencies
Data quality testing
Referential integrity
Business-rule validation
Analytical data marts