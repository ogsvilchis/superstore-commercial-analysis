/*
═══════════════════════════════════════════════════════
PROJECT  : Superstore Commercial Strategy Analysis
SCRIPT   : 06 - Discount Impact Analysis
PURPOSE  : Analyze how discounting practices affect
           profitability across categories, regions
           and sub-categories
           Answers: Is our discount policy destroying
           margin? Where and how much?
AUTHOR   : Orlando Gabriel Sanchez Vilchis
DATE     : 11/05/2026
VERSION  : 1.0
═══════════════════════════════════════════════════════
*/

USE SuperstoreDB;
GO

-- ══════════════════════════════════════════════════
-- SECTION 1: DISCOUNT IMPACT ON PROFIT MARGIN
-- Purpose: Measure how different discount levels
--          affect overall profitability
-- ══════════════════════════════════════════════════

SELECT
    Discount_Category,
    COUNT(*) AS total_orders,
    ROUND(AVG(Discount)*100,2) AS avg_discount_pct,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin_pct 
FROM dbo.Superstore
GROUP BY Discount_Category
ORDER BY avg_discount_pct ASC;


-- ══════════════════════════════════════════════════
-- SECTION 2: DISCOUNT IMPACT BY CATEGORY
-- Purpose: Identify which categories are most
--          affected by discounting practices
-- ══════════════════════════════════════════════════

SELECT
    Category,
    Discount_Category,
    COUNT(*) AS total_orders,
    ROUND(AVG(Discount)*100,2) AS avg_discount_pct,
    ROUND(SUM(Sales),2) AS total_sales,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin_pct 
FROM dbo.Superstore
GROUP BY 
    Category,
    Discount_Category
ORDER BY Category ASC, avg_discount_pct ASC;


-- ══════════════════════════════════════════════════
-- SECTION 3: HIGH DISCOUNT ORDERS DETAIL
-- Purpose: Analyze orders with highest discounts
--          to identify loss-making patterns
-- ══════════════════════════════════════════════════

SELECT
    Sub_category,
    COUNT(*) AS high_discount_orders,
    ROUND(AVG(Discount)*100,2) AS avg_discount_pct,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin_pct     
FROM dbo.Superstore
WHERE Discount_Category = 'High'
GROUP BY Sub_Category
ORDER BY total_profit ASC;


-- ══════════════════════════════════════════════════
-- SECTION 4: DISCOUNT IMPACT BY REGION
-- Purpose: Identify if certain regions apply
--          higher discounts affecting their margins
-- ══════════════════════════════════════════════════

SELECT
    Region,
    COUNT(*) AS total_orders,
    ROUND(AVG(Discount)*100,2) AS avg_discount_pct,
    ROUND(SUM(Profit),2) AS total_profit,
    ROUND(SUM(Profit)/SUM(Sales)*100,2) AS profit_margin_pct 
FROM dbo.Superstore
GROUP BY Region
ORDER BY avg_discount_pct DESC;
