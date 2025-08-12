# Southeast Asia Trade Analysis (2005–2024)

## Overview
This project analyzes trade patterns for six ASEAN economies — **Malaysia, Philippines, Vietnam, Thailand, Indonesia, Singapore** — from 2005 to 2024.

The analysis covers:
- **Trade balance** (% of GDP)
- **Exports vs. Imports** (% of GDP)
- **Long-term average trade performance**
- **Top Movers** — changes in trade shares between 2005 and 2024

## Key Visuals
### 1. Trade Balance Trends
![Trade Balance](images/asean6_trade_balance.png)

### 2. Exports vs Imports
![Exports vs Imports](images/asean6_exports_imports.png)

### 3. Average Trade Balance
![Average Trade Balance](images/asean6_avg_trade_balance.png)

### 4. Top Movers (Exports & Imports Changes 2005–2024)
![Top Movers Combined](images/asean6_top_movers_combined.png)

## Summary Tables
- **[ASEAN6 Trade Summary (Excel)](data/processed/asean6_trade_summary.xlsx)**  
  Best and worst trade-balance years for each country.
- **[ASEAN6 Top Movers (Excel)](data/processed/asean6_top_movers.xlsx)**  
  Change in exports and imports (% of GDP) between 2005 and 2024.

## 🔎 Quick Insights
- Singapore and Malaysia maintain strong positive trade balances throughout the period.
- Vietnam’s export share grew significantly post-2010, narrowing its import gap.
- The Philippines and Indonesia tend toward more balanced trade shares, with smaller gaps between exports and imports.
- Thailand saw moderate declines in export share but remained positive in trade balance.

## 🛠️ How to Reproduce
**Data**: `TRADE1.xlsx` (sheet `Data`) with columns:  
`COUNTRY | YEAR | EXPORT | IMPORT | TRADE | GDP`

**R Setup**
```r
install.packages(c("tidyverse", "readxl", "writexl"))
