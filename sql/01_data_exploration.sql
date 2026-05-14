/*
═══════════════════════════════════════════════════════
PROJECT  : Superstore Commercial Strategy Analysis
SCRIPT   : 01 - Data Exploration
PURPOSE  : Initial data validation and dataset overview
           Answers: What does our dataset look like?
           What are the key dimensions and metrics?
AUTHOR   : Orlando Gabriel Sanchez Vilchis
DATE     : 11/05/2026
VERSION  : 1.0
═══════════════════════════════════════════════════════
*/

USE SuperstoreDB;
GO

-- ══════════════════════════════════════════════════
-- SECTION 1: DATASET OVERVIEW
-- Purpose: Validate total records, date range and
--          financial totals against Excel baseline
-- ══════════════════════════════════════════════════

SELECT 
    COUNT(*) AS total_records, 
    MIN(Order_Date) AS date_start,
    MAX(Order_Date) AS date_end,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore;


-- ══════════════════════════════════════════════════
-- SECTION 2: UNIQUE VALUES BY DIMENSION
-- Purpose: Count distinct values per categorical
--          column to understand dataset granularity
-- ══════════════════════════════════════════════════

SELECT
    COUNT(DISTINCT Segment) AS unique_segments,
    COUNT(DISTINCT Region) AS unique_regions,
    COUNT(DISTINCT Category) AS unique_categories,
    COUNT(DISTINCT Sub_category) AS unique_sub_categories,
    COUNT(DISTINCT State) AS unique_states,
    COUNT(DISTINCT Customer_ID) AS unique_customer_id,
    COUNT(DISTINCT Product_ID) AS unique_product_id
FROM dbo.Superstore;


-- ══════════════════════════════════════════════════
-- SECTION 3: SALES DISTRIBUTION BY CATEGORY
-- Purpose: Compare total orders, sales and profit
--          across the 3 product categories
-- ══════════════════════════════════════════════════

SELECT 
    Category,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY Category
ORDER BY total_sales DESC;


-- ══════════════════════════════════════════════════
-- SECTION 4: SALES DISTRIBUTION BY REGION
-- Purpose: Compare total orders, sales and profit
--          across the 4 geographic sales regions
-- ══════════════════════════════════════════════════

SELECT 
    Region,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY Region
ORDER BY total_sales DESC;


-- ══════════════════════════════════════════════════
-- SECTION 5: SALES DISTRIBUTION BY SEGMENT
-- Purpose: Compare total orders, sales and profit
--          across the 3 customer segments
-- ══════════════════════════════════════════════════

SELECT 
    Segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY Segment
ORDER BY total_sales DESC;


-- ══════════════════════════════════════════════════
-- SECTION 6: ORDERS AND SALES TREND BY YEAR
-- Purpose: Identify annual growth trend in orders,
--          sales and profit from 2014 to 2017
-- ══════════════════════════════════════════════════

SELECT
    Order_Year,
    COUNT(*) AS total_orders,
    SUM(Sales) AS total_sales,
    SUM(Profit) AS total_profit
FROM dbo.Superstore
GROUP BY Order_Year
ORDER BY Order_Year ASC;
