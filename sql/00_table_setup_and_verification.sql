-- ══════════════════════════════════════════════════
-- POST-IMPORT VERIFICATION
-- Run after import to confirm data integrity
-- Expected results documented in comments
-- ══════════════════════════════════════════════════

-- Verification 1: Total records
-- Expected: 9,994
SELECT COUNT(*) AS total_records
FROM dbo.Superstore;

-- Verification 2: Date range validation
-- Expected: Min = 2014-01-03 / Max = 2017-12-30
SELECT 
    MIN(Order_Date) AS date_start,
    MAX(Order_Date) AS date_end
FROM dbo.Superstore;

-- Verification 3: Financial totals cross-check vs Excel
-- Expected: Total Sales = 2,297,200.86
--           Total Profit = 286,397.02
SELECT 
    ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit
FROM dbo.Superstore;
