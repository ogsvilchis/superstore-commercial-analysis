/*
═══════════════════════════════════════════════════════
PROJECT  : Superstore Commercial Strategy Analysis
SCRIPT   : 02 - Sales Analysis
PURPOSE  : Analyze sales performance by sub-category,
           product, seasonality and shipping mode
           Answers: Which products and sub-categories
           drive the most revenue? Is there seasonality?
AUTHOR   : Orlando Gabriel Sanchez Vilchis
DATE     : 11/05/2026
VERSION  : 1.0
═══════════════════════════════════════════════════════
*/

USE SuperstoreDB;
GO

-- ══════════════════════════════════════════════════
-- SECTION 1: SALES BY SUB-CATEGORY
-- Purpose: Rank all 17 sub-categories by total sales
--          to identify top and bottom performers
-- ══════════════════════════════════════════════════

SELECT
    Sub_Category,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY Sub_Category
ORDER BY total_sales DESC;


-- ══════════════════════════════════════════════════
-- SECTION 2: TOP 10 PRODUCTS BY SALES
-- Purpose: Identify the 10 individual products
--          generating the highest revenue
-- ══════════════════════════════════════════════════

SELECT TOP 10 
    Product_Name,
    Category,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY 
    Product_Name, 
    Category
ORDER BY total_sales DESC;


-- ══════════════════════════════════════════════════
-- SECTION 3: MONTHLY SALES TREND
-- Purpose: Detect seasonality patterns by comparing
--          order volume and sales across all 12 months
-- ══════════════════════════════════════════════════

SELECT
    Order_Month,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales
FROM dbo.Superstore
GROUP BY Order_Month
ORDER BY Order_Month ASC;


-- ══════════════════════════════════════════════════
-- SECTION 4: SALES BY SHIP MODE
-- Purpose: Compare order volume, sales and profit
--          across the 4 available shipping methods
-- ══════════════════════════════════════════════════

SELECT 
    Ship_Mode,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit 
FROM dbo.Superstore
GROUP BY Ship_Mode
ORDER BY total_sales DESC;
