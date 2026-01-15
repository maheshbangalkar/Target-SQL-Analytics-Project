# Assumptions
## Target Brazil E-commerce SQL Analytics Project

This document outlines the key assumptions made before starting the data analysis.
These assumptions help ensure consistency, clarity, and correct interpretation of
the dataset throughout the project.

---

### 1. Dataset Scope & Timeframe 

- The dataset contains historical e-commerce transactions from **2016 to 2018**.
- All analysis is limited to this time period only.
- No forecasting or predictions beyond 2018 are included.
- Partial-year comparisons (for example, January to August) are done based on
  business requirements.

---

### 2. Order Lifecycle 

- Each `order_id` represents a unique customer order.
- Orders with statuses such as:
  - `delivered`
  - `shipped`
  - `canceled`
  are handled based on their relevance to the analysis.
- Delivery performance metrics are calculated only for orders that have valid
  delivery dates.
- Canceled or incomplete orders do not correctly represent delivery performance.

---

### 3. Revenue & Monetary Value 

- `payment_value` is treated as the final amount paid by the customer.
- Revenue analysis is based on payment data, not product listed prices.
- Freight cost (`freight_value`) is analyzed separately from product revenue.
- Payment data reflects the actual money received by the business.

---

### 4. Multi-Item Order 

- A single order can contain multiple products.
- Revenue and freight calculations:
  - Use order-level payment data
  - Use item-level freight data where applicable
- Revenue is not duplicated for multi-item orders.

---

### 5. Time-Based Classification 

Orders are grouped into the following time slots based on purchase time:

| Time Bucket | Hour Range |
|------------|------------|
| Dawn | 00:00 – 06:00 |
| Morning | 07:00 – 12:00 |
| Afternoon | 13:00 – 18:00 |
| Night | 19:00 – 23:00 |

- Classification is based on `order_purchase_timestamp`.
- All timestamps are assumed to be in a consistent timezone.
- This helps understand customer ordering behavior during different times of the day.

---

### 6. Regional & Location 

- State-level analysis uses:
  - `customer_state` for customer demand
  - `seller_state` where seller-side insights are required
- Zip code prefixes are assumed to correctly map to cities and states using the
  `geolocation` table.
- City-level analysis is optional and can be extended if needed.

---

### 7. Delivery Performance 

Delivery metrics are calculated as:

- **Actual delivery time (days):**  
  `order_delivered_customer_date - order_purchase_timestamp`

- **Estimated vs actual delivery difference (days):**  
  `order_delivered_customer_date - order_estimated_delivery_date`

Additional info:
- A negative value means delivery was faster than estimated (Eg. -5 : delivered 5 days before)
- A positive value means delivery was delayed (Eg. 5 : delivered 5 days late)
- Orders without delivery dates are excluded from delivery analysis

---

### 8. Payment System 

- An order can have:
  - A single payment
  - Multiple payments (installments / EMI)
- `payment_installments` indicates customer payment behavior.
- Payment types are analyzed month-over-month to identify trends.
- Helps understand how customers prefer to pay and manage payments.

---

### 9. Data Quality & Integrity 

- All primary key and foreign key relationships are validated.
- Minor null values are allowed if they do not affect key metrics.
- No artificial data filling or imputation is performed.

---

### 10. Analytical Responsibility Assumption

- This project focuses only on data analysis and insights.
- It does not include operational or system-level fixes.
- Insights are intended to support:
  - Business decision-making
  - Logistics optimization
  - Strategic discussions
- Final decisions remain with business stakeholders.

---

### Summary

> These assumptions ensure the analysis is accurate, scalable, and aligned with real-world e-commerce data practices, while supporting meaningful business insights.

---
