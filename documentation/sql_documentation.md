# SQL Documentation
## SuperstoreDB — Setup & Verification

### Import Method
- Tool: SQL Server Import Flat File Wizard
- Source: superstore_cleaned.csv
- Destination: SuperstoreDB → dbo.Superstore
- Date columns set to DATE type directly in wizard

### Post-Import Verification Results
| Check | Expected | Result | Status |
|-------|----------|--------|--------|
| Total Records | 9,994 | 9,994 | ✅ |
| Date Start | 2014-01-03 | 2014-01-03 | ✅ |
| Date End | 2017-12-30 | 2017-12-30 | ✅ |
| Total Sales | 2,297,200.86 | 2,297,201.07 | ✅ |
| Total Profit | 286,397.02 | 286,397.79 | ✅ |

### Notes
- Minor financial differences (< $1) between Excel and SQL
  are caused by decimal precision in source data.
  Excel displays rounded values but SUM uses full precision.
  SQL DECIMAL(10,2) stores the rounded value.
  Difference is not material for business analysis.
- Date columns imported directly as DATE type using
  Import Flat File Wizard — no post-import conversion needed.

## Script 01 — Key Findings: Data Exploration

### Categories
- Technology: highest avg ticket and best profit margin (17.4%)
  despite lowest order volume (1,847 orders)
- Office Supplies: highest order volume (6,026) with healthy
  margin (17.0%) — high frequency, lower ticket items
- Furniture: CRITICAL FLAG — $741K in sales but only 2.5%
  profit margin. Requires deep investigation in Script 03.

### Regions
- West leads in both sales ($725K) and profit margin (14.9%)
- Central: 3rd in sales but lowest profit margin (7.9%) —
  nearly half of West's margin. Root cause TBD in Script 05.
- South: lowest order volume but 2nd highest margin (11.9%)

### Yearly Trend
- 2014→2015: Sales declined 2.8% but profit grew 24.4% —
  indicates improved pricing or product mix efficiency
- 2014→2017: Sales +51.4%, Profit +88.6% —
  business becoming more profitable over time

## Script 02 — Key Findings: Sales Analysis

### Sub-Categories
- Tables (Furniture): $206K in sales but -$17,725 profit —
  most damaging sub-category in the portfolio
- Bookcases (Furniture): -$3,472 profit
- Supplies (Office Supplies): -$1,188 profit
- 2 of 3 loss-making sub-categories belong to Furniture
- Tables alone consumes 96% of all Furniture profit

### Top Products
- Canon imageCLASS: top revenue ($61K) AND top profit ($25K) ✅
- Cisco TelePresence: 3rd in sales ($22K) but loss-making (-$1,811)
- HON 5400 Chairs: $21K in sales, $0 profit — silent loss

### Seasonality
- Q4 (Oct-Dec): 38.2% of annual revenue — peak season
- Q1 (Jan-Feb): lowest volume — opportunity for campaigns
- September and November are strongest individual months

### Ship Mode
- Standard Class: 59.7% of all orders
- Ship mode impact on margins to be investigated in Script 05

## Script 03 — Key Findings: Profitability Analysis

### Category Margins
- Technology: 17.4% margin — strongest category ✅
- Office Supplies: 17.0% margin — strong and high volume ✅
- Furniture: 2.5% margin — critical underperformer 🚨

### Sub-Category Highlights
- Top performers: Labels (44.4%), Paper (43.4%), Envelopes (42.3%)
- Loss-making: Tables (-8.6%), Bookcases (-3.0%), Supplies (-2.6%)
- Machines (Technology): only 1.8% margin — needs pricing review

### Bottom 10 Products
- Machines and Tables dominate the loss list
- Cubify CubeX 3D Printer: -$8,879 — worst product in portfolio
- Cisco TelePresence: high sales ($22K) but loss-making (-$1,811)

### Segment x Category Pattern
- ALL segments follow identical profitability order:
  Technology > Office Supplies > Furniture
- Problem is structural to Furniture category,
  not driven by customer segment type

### Unprofitable Orders
- Furniture loss rate: ~33-37% across ALL segments
- Technology and Office Supplies: ~14-15% across all segments
- Segment difference within same category is minimal (<3%)
- Furniture's unprofitability is a product/pricing issue,
  not a customer segmentation issue

## Script 04 — Key Findings: Customer Segmentation

### Segment Performance
- Home Office: highest avg order value ($240.97) and
  profit margin (14.03%) despite lowest volume
- Consumer: highest volume (5,191 orders) but lowest
  margin (11.55%) — quantity over quality
- Strategy: prioritize Home Office acquisition and
  retention — highest ROI per customer

### Revenue vs Profit Rankings
- Sean Miller: #1 revenue ($25K) but negative profit (-$1,980)
  — high-volume customer buying loss-making products
- Tamara Chand: appears in BOTH top 10 lists — true
  high-value customer (Corporate segment)
- Key insight: revenue ranking ≠ profitability ranking.
  Profit ranking is the more strategic metric.

### Customer Loyalty
- 793 unique customers over 4 years
- Most frequent group: 5 orders (134 customers)
- 12 customers purchased only once — churn risk
- Average ~1-2 orders per year per customer
- Opportunity: loyalty program to increase to 3-4/year
- No customers with 14-16 order frequency (expected gap)

## Script 05 — Key Findings: Regional Analysis

### Region Overview
- West: best margin (14.94%) and highest revenue ($725K)
- Central: worst margin (7.92%) despite 3rd in revenue
- South: 2nd best margin (11.93%) with lowest volume —
  high growth opportunity with current product mix

### State Analysis
- California (West): $76K profit = 70.4% of West's total profit
- New York (East): $74K profit = 80.9% of East's total profit
- Geographic risk: both regions highly dependent on one state
- Texas: highest sales in bottom 10 ($170K) but -$25,729 profit
  — pricing or discount issue to investigate in Script 06
- Bottom 10 distribution: South and West 3 states each,
  East and Central 2 states each

### Category x Region
- Furniture negative margin in Central (-1.75%) vs
  positive in all other regions — discount investigation needed
- Office Supplies best in West (23.82%)
- Technology consistently strong across all regions (13-20%)

## Script 06 — Key Findings: Discount Impact Analysis

### Discount Threshold
- No Discount: 29.51% margin — highest profitability
- Low (≤20%): 11.91% margin — still profitable
- Medium (≤40%): -15.30% margin — loss begins here
- High (>40%): -77.40% margin — severe loss
- Critical finding: discount ceiling should be 20%
  Any discount above 20% destroys margin

### Category Discount Impact
- Office Supplies: no Medium tier applied — jumps directly
  to High discount with worst result (-119.27%)
- Furniture most damaged overall by high discounts (-70.85%)
- Recommendation: implement gradual discount tiers
  for Office Supplies before allowing High level

### High Discount Sub-Categories
- Binders: 613 orders at High discount — scale risk
  (-$38,510 total loss, -106% margin)
- Appliances: 67 orders but -255% margin — severity risk
- Priority: address Binders first (volume impact),
  then Appliances (margin impact)

### Regional Discount Correlation
- Central: 24.04% avg discount → 7.92% margin (lowest)
- West: 10.93% avg discount → 14.94% margin (highest)
- Hypothesis confirmed: Central's low margin is directly
  caused by excessive discounting practices
- Reducing Central's discount to West levels could
  recover approximately 7 points of margin
