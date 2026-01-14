# Target Brazil E-commerce SQL Analytics Project

## 📌 Project Overview
This project analyzes Target’s Brazilian e-commerce operations using a
real-world dataset of ~100,000 orders placed between 2016 and 2018.

The goal is to derive business insights using SQL through data validation,
time-series analysis, regional trends, revenue impact, delivery performance,
and payment behavior.

---

## 🛠 Tech Stack
- PostgreSQL  
- SQL  
- Azure Data Studio  
- CSV datasets  

---

## 📂 Project Structure
01_data     → Raw e-commerce datasets  
02_docs     → Requirements, schema, and assumptions  
03_schema   → Database creation and table definitions  
04_load     → Data ingestion scripts  
05_analysis → Phase-wise analytical SQL queries  
06_results  → CSV outputs and summarized insights


---

## 🔍 Analysis Workflow
1. Data inspection and schema validation  
2. Data quality and coverage checks  
3. Time-based order and volume analysis  
4. Regional and state-level performance analysis  
5. Revenue and economic impact assessment  
6. Delivery performance and logistics metrics  
7. Payment method and installment behavior analysis  

Each phase builds on the previous one to ensure the insights are accurate,
reliable, and business-relevant.

---

## 🚀 How to Run the Project

### 1️⃣ Create Database and Tables
Run scripts from:  
📂 [03_schema](./03_schema/)

### 2️⃣ Load Raw Data
Run scripts from:  
📂 [04_load](./04_load/)

### 3️⃣ Execute Analysis Queries
Run SQL scripts phase-by-phase from:  
📂 [05_analysis](./05_analysis/)

### 4️⃣ Review Results
Final outputs are available as CSV files in:  
📂 [06_results](./06_results/)

---

## 📊 Results & Insights
All query outputs are stored as CSV files for transparency and reproducibility.

- Results are organized by analytical phase, mirroring the structure of
  `05_analysis`
- Each result file directly maps to one or more SQL queries
- High-level findings and business interpretations are documented here:

📄 **Detailed Results & Insights:**  
📂 [06_results/results.md](./06_results/results.md)

---

## ✅ Notes
- CSV format is used for portability and easy version control  
- Excel files may be used locally for exploration but are not tracked in this repository  
- Partial data in early 2016 and late 2018 should be considered when interpreting growth trends  
