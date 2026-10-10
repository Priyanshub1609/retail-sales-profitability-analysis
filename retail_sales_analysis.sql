/*
Project 2: Retail Sales & Profitability Analysis
Database: RetailSalesDB
Table: dbo.retail_sales
Dataset: Synthetic practice dataset containing 1,000 orders from 2025

Run the queries in SSMS after importing the CSV into dbo.retail_sales.
*/

USE RetailSalesDB;
GO

-- 1. Validate row count
SELECT COUNT(*) AS total_records
FROM dbo.retail_sales;
GO

-- 2. Overall business KPIs
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct,
    CAST(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0) AS DECIMAL(12, 2)) AS average_order_value
FROM dbo.retail_sales;
GO

-- 3. Revenue and profit by category
SELECT
    category,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_quantity,
    ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM dbo.retail_sales
GROUP BY category
ORDER BY total_revenue DESC;
GO

-- 4. City performance
SELECT
    city,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM dbo.retail_sales
GROUP BY city
ORDER BY total_revenue DESC;
GO

-- 5. Top five products by revenue
SELECT TOP 5
    product_name,
    category,
    SUM(quantity) AS total_units_sold,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit
FROM dbo.retail_sales
GROUP BY product_name, category
ORDER BY SUM(sales) DESC;
GO

-- 6. Products with negative aggregate profit (may return no rows)
SELECT
    product_name,
    category,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    SUM(quantity) AS total_units_sold
FROM dbo.retail_sales
GROUP BY product_name, category
HAVING SUM(profit) < 0
ORDER BY SUM(profit) ASC;
GO

-- 7. Individual loss-making orders
SELECT
    order_id,
    order_date,
    city,
    product_name,
    sales,
    profit
FROM dbo.retail_sales
WHERE profit < 0
ORDER BY profit ASC;
GO

-- 8. Count individual loss-making orders
SELECT COUNT(*) AS loss_making_orders
FROM dbo.retail_sales
WHERE profit < 0;
GO

-- 9. Average order value
SELECT
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(sales), 2) AS total_revenue,
    CAST(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0) AS DECIMAL(12, 2)) AS average_order_value
FROM dbo.retail_sales;
GO

-- 10. Monthly revenue, profit, and order trends
SELECT
    YEAR(order_date) AS sales_year,
    MONTH(order_date) AS sales_month,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    COUNT(DISTINCT order_id) AS total_orders
FROM dbo.retail_sales
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY sales_year, sales_month;
GO

-- 11. Monthly revenue ranking
WITH MonthlySales AS (
    SELECT
        YEAR(order_date) AS sales_year,
        MONTH(order_date) AS sales_month,
        SUM(sales) AS total_revenue,
        SUM(profit) AS total_profit,
        COUNT(DISTINCT order_id) AS total_orders
    FROM dbo.retail_sales
    GROUP BY YEAR(order_date), MONTH(order_date)
)
SELECT
    sales_year,
    sales_month,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(total_profit, 2) AS total_profit,
    total_orders,
    RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
FROM MonthlySales
ORDER BY revenue_rank;
GO

-- 12. Monthly profit margin ranking
SELECT
    MONTH(order_date) AS sales_month,
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(SUM(profit) * 100.0 / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM dbo.retail_sales
GROUP BY MONTH(order_date)
ORDER BY profit_margin_pct DESC;
GO

-- 13. Products ranked by total profit
WITH ProductPerformance AS (
    SELECT
        product_name,
        category,
        SUM(quantity) AS total_units_sold,
        SUM(sales) AS total_revenue,
        SUM(profit) AS total_profit
    FROM dbo.retail_sales
    GROUP BY product_name, category
)
SELECT
    product_name,
    category,
    total_units_sold,
    ROUND(total_revenue, 2) AS total_revenue,
    ROUND(total_profit, 2) AS total_profit,
    RANK() OVER (ORDER BY total_profit DESC) AS profit_rank
FROM ProductPerformance
ORDER BY profit_rank;
GO
