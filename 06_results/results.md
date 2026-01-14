## Analytical Results Summary

This directory contains CSV outputs generated from analytical SQL queries
executed across multiple phases of the project.

Each CSV file represents a single logical analytical output and directly
corresponds to one or more SQL queries located in the `05_analysis`
directory. Results are organized by analytical phase to ensure clarity,
traceability, and reproducibility.

---

## 📁 Result Files by Phase

- **Phase 1 – Data Validation & Coverage**  
  📂 [phase_1_validation](./phase_1_validation)

- **Phase 2 – Time & Order Volume Analysis**  
  📂 [phase_2_time_analysis](./phase_2_time_analysis)

- **Phase 3 – Regional & State-Level Analysis**  
  📂 [phase_3_regional_analysis](./phase_3_regional_analysis)

- **Phase 4 – Revenue & Economic Impact Analysis**  
  📂 [phase_4_revenue_analysis](./phase_4_revenue_analysis)

- **Phase 5 – Delivery Performance & Logistics**  
  📂 [phase_5_delivery_analysis](./phase_5_delivery_analysis)

- **Phase 6 – Payment Method Analysis**  
  📂 [phase_6_payment_analysis](./phase_6_payment_analysis)

---

## Notes
- Results are stored in CSV format for transparency and reproducibility
- Output files are organized by analytical phase
- Detailed interpretations can be derived by combining phase-level results

---

## Insights
**Dataset Time Coverage**

📄 Result: [03_identify_order_date_range.csv](./phase_1_validation/03_identify_order_date_range.csv)
- The dataset spans 773 days, from September 2016 to October 2018.
- Since the data does not cover full calendar years at the start and end, early 2016 and late 2018 should be treated as partial periods when interpreting growth metrics.

**Customer Geographic Coverage**

📄  Result: [03_identify_customer_geography_coverage.csv](./phase_1_validation/03_identify_customer_geography_coverage.csv)
- Customers come from 4,119 different cities across 27 states in Brazil.
- This shows a very wide geographic spread and strong nationwide reach.

**Average Monthly Orders**

📄  Result: [01_analyze_order_volume_avg_monthly.csv](./phase_2_time_analysis/01_analyze_order_volume_avg_monthly.csv)
- Orders are steady from January to August, usually between 4,000 and 5,500 orders per month.
- November has the highest number of orders, clearly standing out from all other months.
- September and October have very low order counts, which is likely because the data for these months is incomplete, not because business actually dropped.
- December has fewer orders compared to November, but still shows healthy activity, likely influenced by year-end shopping.

**Month-over-Month (MoM) Order Growth**

📄  Result: [01_analyze_order_volume_mom_growth.csv](./phase_2_time_analysis/01_analyze_order_volume_mom_growth.csv)
- Order volume grew rapidly during 2017, showing strong adoption and platform expansion.
- November 2017 stands out with a sharp increase in orders, likely drivern by major sales events.
- Some months show very large growth or decline percentages due to incomplete or inconsistent data coverage.
- In 2018, growth becomes more stable, indicating the business had reached a more mature and consistent phase.
- Extremelt low order counts in September and October 2018 are due to imcomplete data, not an actual drop in demand.

**Year-over-Year (YoY) Order Growth**

📄  Result: [01_analyze_order_volume_yoy_growth.csv](./phase_2_time_analysis/01_analyze_order_volume_yoy_growth.csv)
- Orders increased very sharply in 2017 compared to 2016.
- The extremely high growth in 2017 is inflated because 2016 contains only partial data.
- In 2018, order growth is around 20%, which reflects real and healthy business expansion.
- This shows that after an initial ramp-up phase, the platform moved into more stable growth stage.

**Order Distribution by Time of Day**

📄  Result: [02_apply_time_bucketing_results.csv](./phase_2_time_analysis/02_apply_time_bucketing_results.csv)
- Most orders are placed during the Afternoon, making it the busiest time of the day.
- Mornings and Nights also see a high number of orders, showing consistent activity throughout the day.
- Early morning (Dawn) has the lowest number of orders compared to other time periods.
- Overall, customer activity is strong during regular daytime and evening hours.

**Month-over-Month (MoM) Order Growth Insights**

📄  Result: [01_analyze_state_mom_orders_results.csv](./phase_3_regional_analysis/01_analyze_state_mom_orders_results.csv)
- Large states like SP, RJ, MG, and PR contribute the highest number of orders.
- Smaller states (like AC, RR, AP) have consistently low order volumes.
- Almost all states show a clear increase from early 2017 to late 2017, confirming nationwide growth.
- November consistently shows spikes across many states, again pointing to seasonal sales events.
- Sharp drops in late 2018 (for many states) are due to partial data, not actual loss of demand.

**Customer Distribution by City & State**

📄  Result: [02_customers_by_state_city.csv](./phase_3_regional_analysis/02_customers_by_state_city.csv)
- Customers are spread across thousands of cities and all major Brazilian states.
- Big cities like sao paulo, rio de janeiro, belo horizonte, brasileia, curitiba, and porto alegre contribute the most customers.
- Many smaller cities also have customers, showing wide nationwide reach.
- The platform is not limited to big cities — it has strong penetration across all regions in Brazil.

**Customer Distribution by State**

📄  Result: [02_customers_by_state.csv](./phase_3_regional_analysis/02_customers_by_state.csv)
- SP has the largest customer base by far, with 41,746 customers.
- RJ and MG follow, but with much smaller numbers compared to SP.
- Together, SP, RJ, and MG account for a very large share of total customers, showing that business is heavily concentrated in these regions.
- Southern states like RS, PR, and SC also have strong customer presence, indicating good market penetration.

**Cost Growth Analysis**

📄  Result: [01_calculate_revenue_metrics_results.csv](./phase_4_revenue_analysis/01_calculate_revenue_metrics_results.csv)
- Total cost in 2017: 3,669,022
- Total cost in 2018: 8,694,734
- The total cost more than doubled from 2017 to 2018.
- A 136.98% increase means the business spent almost 2.4 times more in 2018 compared to 2017.
- This sharp rise strongly suggests:
    - Rapid growth in order volume
    - Higher operational and logistics expenses
    - Expansion of business activity across regions

**Freight Cost Metrics by State**

📄  Result: [02_freight_cost_metrics_by_state.csv](./phase_4_revenue_analysis/02_freight_cost_metrics_by_state.csv)
- SP has the highest number of orders (41375).
- Despite the large order volume, SP has a low average freight cost of 17.37, which is among the cheapest.
- States like RR, PB, RO, AC, PI, MA, TO have very low order volumes and very high average freight costs.
- This indicates deliveries are more expensive in remote or less connected regions.
- States such as PA, MA, PI, AL, SE, RN, CE show Moderate to low order volume and High average freight costs.

**Order Value Analysis by State**

📄  Result: [02_order_value_metrics_by_state.csv](./phase_4_revenue_analysis/02_order_value_metrics_by_state.csv)
- SP generates the highest revenue with 41,745 orders and a total order value of ~6M, even though its average order value is low (≈144).
- RJ (12,852 orders, ~2.14M) and MG (11,635 orders, ~1.87M) follow SP, but with much smaller volumes and revenue.
- Together, SP, RJ, and MG contribute the majority of total revenue, showing that business is heavily concentrated in a few major states.
- States like RS (5,466 orders), PR (5,045 orders), and SC (3,637 orders) show strong order activity and steady revenue contribution.
- Smaller states such as PB (avg order ≈264), AC (≈243), RO (≈241), and PA (≈224) have fewer orders but much higher average order values, meaning customers spend more per purchase.
- This shows a clear pattern: large states drive revenue through high order volume, while smaller states drive value through higher spending per order.

**Top 5 States Where Deliveries Are Faster Than Estimated**

📄  Result: [02_delivery_beats_estimate_by_state.csv](./phase_5_delivery_analysis/02_delivery_beats_estimate_by_state.csv)
- AC delivers orders ~21 days faster than estimated (21 days actual vs 41.7 days estimated).
- RO beats delivery estimates by ~20 days, showing strong logistics performance.
- AP delivers orders ~19.7 days earlier than promised.
- AM completes deliveries ~19.6 days faster than estimated.
- RR, despite being a remote state, still delivers orders ~17.3 days earlier than expected.

**Top 5 - Fastest vs Slowest Average Delivery by State**

📄  Result: [02_delivery_speed_extremes_by_state.csv](./phase_5_delivery_analysis/02_delivery_speed_extremes_by_state.csv)
- Fastest Delivery States
    - SP delivers the fastest, with an average delivery time of 8.7 days.
    - PR and MG follow closely, both delivering in ~11.9 days on average.
    - DF completes deliveries in 12.9 days, showing strong logistics efficiency.
    - SC maintains fast delivery with an average of 14.9 days.

- Slowest Delivery States
    - RR has the slowest deliveries, averaging 29.3 days.
    - AP and AM take ~27 days on average to deliver orders.
    - AL delivers in 24.5 days, slower than the national average.
    - PA completes deliveries in 23.7 days.

**Top 5 – Highest vs Lowest Average Freight Cost by State**

📄  Result: [02_freight_cost_extremes_by_state.csv](./phase_5_delivery_analysis/02_freight_cost_extremes_by_state.csv)
- Lowest Average Freight Cost States
    - SP has the lowest average freight cost at 17.37, benefiting from strong logistics and high order volume.
    - MG (23.46), PR (23.58), DF (23.82), and RJ (23.95) also enjoy relatively low delivery costs.
    - These states are well-connected and have efficient infrastructure, which helps keep freight costs down.<br>

- Highest Average Freight Cost States
    - RR has the highest average freight cost at 48.59, nearly 3× higher than SP.
    - PB (48.35) and RO (46.22) follow closely with very high delivery costs.
    - AC (45.52) and PI (43.04) also show significantly higher freight expenses.
    - These states are generally remote or less connected, making deliveries more expensive.

**Month-on-Month Order Trends by Payment Type**

📄  Result: [01_analyze_payment_mom_results.csv](./phase_6_payment_analysis/01_analyze_payment_mom_results.csv)
- Credit Card is the most popular payment method
    - It shows strong growth during 2017.
    - Orders peak in November 2017, likely due to sales or festive seasons.
- UPI usage grows steadily over time.
    - Orders increase consistently from 2016 to 2018.
    - This shows rising adoption of digital payments among customers.
- Voucher payments are used occasionally.
    - Usage increases during promotional periods.
    - Drops after campaigns end, indicating vouchers are offer-driven.
- Debit Card usage remains consistently low compared to other payment types.
    - Even at its peak, it is far behind credit cards and UPI.
    - Customers clearly prefer other payment options.

**Order Distribution by Number of Payment Installments**

📄  Result: [02_analyze_payment_distribution_results.csv](./phase_6_payment_analysis/02_analyze_payment_distribution_results.csv)
- Most orders are paid in a single installment, with 49,057 orders, making it the most preferred option.
- Short installment plans (2–4 installments) are also common:
    - 2 installments: 12,389 orders
    - 3 installments: 10,443 orders
    - 4 installments: 7,088 orders
- As the number of installments increases, the number of orders decreases steadily.
- Long installment plans (10 or more installments) are very rare and used by only a small number of customers.
- Orders with 0 installments are negligible and likely represent special cases or data edge conditions.

- Overall, the analysis shows a platform that experienced rapid early growth, followed by stable expansion, with strong concentration in major states and clear operational challenges in remote regions.