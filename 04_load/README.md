# Data Loading – Raw CSV to PostgreSQL

This directory contains SQL scripts responsible for loading all raw CSV
datasets into the PostgreSQL database.

The scripts assume that:
- Tables are already created (see [03_schema](../03_schema))
- Raw CSV files are available in the [01_data/raw/](../01_data/raw/) directory
- `COPY` command is used for fast and reliable ingestion

---

## Script Overview

### [01_load_raw_data.sql](01_load_raw_data.sql)

This script loads the following datasets into their respective tables:

| Table Name        | Source CSV File           |
|------------------|---------------------------|
| geolocation      | geolocation.csv           |
| customers        | customers.csv             |
| sellers          | sellers.csv               |
| products         | products.csv              |
| orders           | orders.csv                |
| order_items      | order_items.csv           |
| payments         | payments.csv              |
| reviews          | order_reviews.csv         |

---

## Standard Data Loading

Most tables are loaded directly using `COPY` command:

```sql
COPY table_name (columns...)
FROM 'Dataset/file_name.csv'
CSV HEADER;
```
---

## Data Cleaning Note

The `order_reviews.csv` dataset required special handling before loading into
table due to multiple data quality challenges:

- The source file is encoded in **LATIN1**, not UTF-8
- Timestamp columns use **non-standard formats** (`DD-MM-YYYY HH.MM`)
- UUID values are stored as **plain text** in the raw dataset

To safely ingest this data, a **staging table pattern** was used:
1. Raw CSV data was loaded into a temporary staging table with all columns as TEXT
2. Data was validated, cleaned, and transformed (UUID casting, timestamp parsing)
3. Cleaned records were inserted into the final `reviews` table

It helps to ensures reliable ingestion, prevents load failures, and aligns with data.