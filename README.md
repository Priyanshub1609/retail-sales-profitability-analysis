# Retail Sales & Profitability Analysis (SQL Server)

## Project Overview
This project uses SQL Server to analyze a synthetic retail sales dataset and answer business questions about revenue, profitability, products, cities, and monthly trends.

## Dataset
- **Rows:** 1,000 orders
- **Period:** January–December 2025
- **Columns:** `order_id`, `order_date`, `city`, `category`, `product_name`, `quantity`, `unit_price`, `sales`, `profit`
- **Source:** Synthetic practice data created for this portfolio project; it does not represent a real company.

## Tools & SQL Skills
- Microsoft SQL Server and SQL Server Management Studio (SSMS)
- Aggregations: `SUM`, `COUNT`, `AVG`
- Filtering and grouping: `WHERE`, `GROUP BY`, `HAVING`
- Common table expressions (CTEs)
- Window functions: `RANK()`
- Date functions and calculated metrics
- Profit margin and average order value calculations

## Business Questions
1. What are total revenue, profit, units sold, profit margin, and average order value?
2. Which categories generate the most revenue and profit?
3. Which cities perform best by revenue, profit, order count, and margin?
4. Which products generate the highest revenue and total profit?
5. Which individual orders are loss-making?
6. How do revenue, profit, and order volume change by month?
7. Which months rank highest by revenue and profit margin?

## Key Findings
The following findings came from the SQL query results during this project. Re-run the queries in `retail_sales_analysis.sql` to validate them.

- **Total orders:** 1,000
- **Total revenue:** approximately ₹66.26 lakh
- **Total profit:** approximately ₹11.16 lakh
- **Units sold:** 2,674
- **Average order value:** ₹6,625.70
- **Overall profit margin:** approximately 16.84%
- **Top revenue category:** Furniture, approximately ₹24.42 lakh
- **Highest category profit margin:** Clothing, 23.26%
- **Top revenue city:** Delhi, approximately ₹7.37 lakh
- **Highest city profit margin:** Mumbai, 18.75%
- **Top revenue month:** March 2025, approximately ₹6.67 lakh
- **Highest monthly profit margin:** June, 17.79%
- **Highest monthly total profit:** December 2025, approximately ₹1.12 lakh
- **Top product in the recorded revenue and profit rankings:** Monitor

## Recommendations to Investigate
1. Review pricing and cost drivers for Furniture and Electronics, which have large revenue contributions but lower margins than Clothing.
2. Investigate negative-profit orders to understand whether pricing, discounting, or cost assumptions contributed to the losses.
3. Compare revenue, total profit, and margin together when assessing monthly performance.
4. Compare city-level order value and margins before choosing where to focus promotions.
5. Use product-level profit and sales volume alongside revenue when making inventory decisions.

These are hypotheses for further investigation, not proven causes. Because the dataset is synthetic, findings should be presented as a practice analysis rather than real business results.

## How to Run
1. Download `Dataset.csv` from this repository.
2. In SSMS, create a database named `RetailSalesDB`.
3. Import `Dataset.csv` into a table named `dbo.retail_sales`.
4. Open and run `retail_sales_analysis.sql` in SSMS.
5. Compare the output with the findings above and update the README if any results differ.

## Repository Files
- `Dataset.csv` — synthetic retail transaction dataset
- `retail_sales_analysis.sql` — SQL queries used for the analysis
- `README.md` — project overview, findings, and setup instructions

## Project Goal
Demonstrate how SQL can transform transactional data into organized metrics and evidence-based business observations.
