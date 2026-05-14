/*
═══════════════════════════════════════════════════════
PROJECT  : Superstore Commercial Strategy Analysis
SCRIPT   : 04 - Customer Segmentation
PURPOSE  : Analyze customer behavior, identify top
           revenue and profit generating customers
           Answers: Who are our most valuable customers
           and how frequently do they purchase?
AUTHOR   : Orlando Gabriel Sanchez Vilchis
DATE     : 11/05/2026
VERSION  : 1.0
═══════════════════════════════════════════════════════
*/

USE SuperstoreDB;
GO

-- ══════════════════════════════════════════════════
-- SECTION 1: SEGMENT PERFORMANCE OVERVIEW
-- Purpose: Compare revenue, profit and average order
--          value across the 3 customer segments
-- ══════════════════════════════════════════════════

SELECT
    Segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Sales)/COUNT(*),2) AS avg_order_value,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin_pct 
FROM dbo.Superstore
GROUP BY Segment
ORDER BY total_sales DESC;


-- ══════════════════════════════════════════════════
-- SECTION 2: TOP 10 CUSTOMERS BY REVENUE
-- Purpose: Identify the highest value customers
--          based on total purchases
-- ══════════════════════════════════════════════════

SELECT TOP 10
    Customer_Name,
    Segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY 
    Customer_Name,
    Segment
ORDER BY total_sales DESC;


-- ══════════════════════════════════════════════════
-- SECTION 3: TOP 10 CUSTOMERS BY PROFIT
-- Purpose: Identify which customers generate
--          the most profit — may differ from revenue
-- ══════════════════════════════════════════════════

SELECT TOP 10
    Customer_Name,
    Segment,
    COUNT(*) AS total_orders,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit
FROM dbo.Superstore
GROUP BY 
    Customer_Name,
    Segment
ORDER BY total_profit DESC;


-- ══════════════════════════════════════════════════
-- SECTION 4: CUSTOMER ORDER FREQUENCY
-- Purpose: Understand how often customers purchase
--          and identify the most loyal buyers
-- ══════════════════════════════════════════════════

SELECT
   order_frequency,
   COUNT(*) AS customer_count
FROM(
    SELECT 
        Customer_ID,
        COUNT(DISTINCT Order_ID) AS order_frequency
    FROM dbo.Superstore
    GROUP BY Customer_ID
    ) AS customers_orders
GROUP BY order_frequency
ORDER BY order_frequency ASC;
