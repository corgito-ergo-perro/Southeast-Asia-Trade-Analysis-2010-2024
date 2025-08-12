# Southeast Asia Trade Analysis (2005–2024)

Overview
This project analyzes trade patterns for six ASEAN economies — **Malaysia, Philippines, Vietnam, Thailand, Indonesia, Singapore** — from 2005 to 2024.  
We track:
- Trade balance** (% of GDP)
- Exports vs. Imports** (% of GDP)

Key Visuals
![Trade Balance](images/asean6_trade_balance.png)
![Exports vs Imports](images/asean6_exports_imports.png)
![Average Trade Balance](images/asean6_avg_trade_balance.png)

🧾 Summary Table (Excel)
- `data/processed/asean6_trade_summary.xlsx`  
  (Best/Worst trade-balance year and values per country)

## Quick Insights (edit these after a glance)
- Singapore and Malaysia show persistently higher **exports (% of GDP)** relative to imports.
- Vietnam’s **exports share** grew notably post-2010, narrowing the import gap.
- The Philippines and Indonesia show **tighter spreads** between exports and imports (more balanced shares).

##  Reproduce
**Data file**: `TRADE1.xlsx` (sheet `Data`) with columns: `COUNTRY, YEAR, EXPORT, IMPORT, TRADE, GDP`.

**R setup**
```r
install.packages(c("tidyverse","readxl","writexl"))
