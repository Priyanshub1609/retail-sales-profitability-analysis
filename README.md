# Retail Sales & Profitability Analysis (SQL Server)

## Project overview
This project analyzes retail order data with SQL Server to understand revenue, profit, product performance, city performance, loss-making transactions, and monthly trends.

**Dataset:** Synthetic practice dataset generated for this portfolio exercise. It contains 1,000 orders dated in 2025 and 9 columns:
`order_id`, `order_date`, `city`, `category`, `product_name`, `quantity`, `unit_price`, `sales`, and `profit`.

## Tools
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- SQL: aggregation, `GROUP BY`, `HAVING`, CTEs, window functions, date functions, `CASE`-style business classification, ranking, and calculated metrics

## Business questions
1. What are total revenue, profit, units sold, profit margin, and average order value?
2. Which product categories contribute the most revenue and profit?
3. Which cities perform best by revenue, profit, order count, and margin?
4. Which five products generate the most revenue?
5. Are any products unprofitable overall?
6. Which individual orders have negative profit?
7. How do revenue, profit, and order count change by month?
8. Which months rank highest by revenue and profit margin?
9. Which products contribute the most total profit?

## Key results observed during analysis
These values are based on the query results captured during the project. Re-run the SQL file against the dataset to validate them.

- Total orders: **1,000**
- Total revenue: approximately **₹66.26 lakh**
- Total profit: approximately **₹11.16 lakh**
- Units sold: **2,674**
- Average order value: **₹6,625.70**
- Overall profit margin: approximately **16.84%**
- Highest-revenue category: **Furniture**, at approximately **₹24.42 lakh**
- Highest category profit margin: **Clothing**, at **23.26%**
- Highest-revenue city in the result set: **Delhi**, at approximately **₹7.37 lakh**
- Highest city profit margin in the result set: **Mumbai**, at **18.75%**
- Highest-revenue month: **March 2025**, at approximately **₹6.67 lakh**
- Highest monthly profit margin: **June**, at **17.79%**
- Highest monthly total profit: **December 2025**, at approximately **₹1.12 lakh**
- Top product by revenue and total profit in the captured results: **Monitor**

## Business recommendations
1. Review cost, pricing, and discount drivers for Furniture and Electronics, which generate substantial revenue but have lower category margins than Clothing.
2. Investigate loss-making individual transactions to understand whether the cause is discounting, pricing, or cost allocation.
3. Compare monthly revenue, profit, and margin together rather than using revenue alone to assess performance.
4. Review city-level order value and margins before deciding where to focus promotions or operational improvements.
5. Consider product-level margin and sales volume alongside total revenue before expanding inventory.

These are hypotheses for further investigation, not causal conclusions. The dataset is synthetic and should be presented as a practice project, not real company data.

## How to run
1. Download `retail_sales_project2_dataset.csv`.
2. In SSMS, create a database named `RetailSalesDB`.
3. Import the CSV as `dbo.retail_sales`.
4. Open `retail_sales_analysis.sql` and run the queries in order.
5. Validate the output values and update this README if results differ.

## Files
- `retail_sales_analysis.sql` — SQL queries for the analysis.
- `retail_sales_project2_dataset.csv` — dataset used for the project.

## Portfolio note
This is a SQL portfolio project demonstrating how to translate business questions into analytical queries and actionable, evidence-based observations.
