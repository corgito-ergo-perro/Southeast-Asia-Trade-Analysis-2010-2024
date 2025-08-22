# Southeast Asia Trade Analysis (2005–2024)

## Overview
This project analyzes trade patterns for six ASEAN economies **Malaysia, Philippines, Vietnam, Thailand, Indonesia, Singapore** from 2005 to 2024.

The analysis covers:
- **Trade balance** (% of GDP)
- **Exports vs. Imports** (% of GDP)
- **Long-term average trade performance**
- **Top Movers** changes in trade shares between 2005 and 2024

## Key Visuals
### 1. Trade Balance Trends
![Trade Balance](images/asean6_trade_balance.png)

This graph highlights stark differences in trade performance across the ASEAN6. **Singapore** consistently maintains a significantly higher trade balance relative to GDP, likely due to its role as a re-export hub and highly open economy (World Bank, 2023). In contrast, **Indonesia** and **the Philippines** show modest trade balances, reflecting higher dependence on imports and less export diversification. **Malaysia’s** gradual decline might signal structural export shifts, while **Vietnam’s** rising trend reflects FDI inflows and a stronger manufacturing base (ADB, 2022). These patterns offer insights into regional trade competitiveness and exposure to global shocks.



### 2. Exports vs Imports

![Exports vs Imports](images/asean6_exports_imports.png)

This panel highlights divergent trade structures across ASEAN6. **Singapore** remains an outlier, with both exports and imports exceeding 150% of GDP, reflecting its re-export driven economy. Vietnam shows a steady rise in both exports and imports, consistent with its deepening integration into global value chains. In contrast, **Malaysia** and **Indonesia** demonstrate a decline in export intensity, possibly due to resource price shifts or domestic consumption focus. **The Philippines** shows widening trade gaps post-2010, driven by strong import growth outpacing exports, suggesting rising consumption or capital import needs (ADB, 2023).

### 3. Average Trade Balance
![Average Trade Balance](images/asean6_avg_trade_balance.png)

This horizontal bar chart summarizes each country’s average trade balance over two decades. Singapore significantly leads the region, reinforcing its dominance in export activity. **Malaysia**, **Vietnam**, and **Thailand** show moderate surpluses, suggesting consistent external competitiveness. On the other hand, **Indonesia** and the **Philippines** have the lowest average trade balances, potentially reflecting structural trade deficits or high import dependency. This ranking helps contextualize long-term patterns not immediately visible in year to year trends.


### 4. Top Movers (Exports & Imports Changes 2005–2024)
![Top Movers Combined](images/asean6_top_movers_combined.png)

This chart visualizes how much each country’s export and import levels have changed between 2005 and 2024. **Singapore** and **Malaysia** experienced the largest declines in both exports and imports as a share of GDP, possibly reflecting economic diversification or changing global trade flows. **Vietnam** is the only country with a net positive export change, consistent with its rising role in global manufacturing. **The Philippines** shows a notable rise in imports without an equivalent export gain, which may relate to increasing consumer demand or infrastructure imports. This change-over-time view complements the average balance chart, offering a dynamic perspective.

*Sources: World Bank, ADB, IMF (as cited in dataset)*  


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
