# Downtown Seattle Economic Vitality & Public Realm Recovery Index (2025–2026)

[![Database: BigQuery](https://img.shields.io/badge/Database-Google%20BigQuery-blue?style=flat-square&logo=google-cloud)](https://cloud.google.com/bigquery)
[![Analytics: Python](https://img.shields.io/badge/Analytics-Python%20%7C%20Statsmodels-green?style=flat-square&logo=python)](https://www.python.org/)
[![BI: Looker Studio](https://img.shields.io/badge/BI-Looker%20Studio-orange?style=flat-square)](https://lookerstudio.google.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

An end-to-end, enterprise-grade cloud data warehousing and statistical modeling portfolio designed to evaluate the direct relationship between public realm stewardship and pedestrian foot traffic recovery across the 285 blocks of Seattle's **Metropolitan Improvement District (MID)**.

This project eliminates manual reporting constraints (~30 hours saved monthly) by engineering an automated, zero-cost Google Cloud pipeline and applying robust econometric panel models with **HC3 Heteroskedasticity-Consistent Robust Standard Errors**.

---

## 🛠️ The Technology Stack & System Architecture

```
  [Simulated Telemetry Sensors] & [MID Incident Service Logs] 
                       │ (Local Extraction)
                       ▼
             [Python Pandas Ingestion]
                       │ (Cleaned & Schema Validated)
                       ▼
    [Google BigQuery (Clustered Storage: SD_ID)]  ◄─── Zero-Cost Sandbox Config
                       │
        ┌──────────────┴──────────────┐
        ▼                             ▼
[Econometric Modeling]       [Live Semantic Views]
(Statsmodels OLS w/ HC3)              │
                                      ▼
                         [Looker Studio BI Panels]
```

- **Data Pipeline:** Python (`pandas`, `numpy`) simulating real-world sensor telemetry and ticket logs with strict relational constraint checks.
- **Data Warehouse:** Google BigQuery (`driiiportfolio.dsa_urban_analytics`) using clustered-only table layouts (`CLUSTER BY subdistrict_id`) for zero-cost execution in Google Free-Tier Sandbox settings.
- **Econometrics & Statistics:** Python (`statsmodels`, `scipy`) evaluating public program impact with robust panel regressions.
- **Business Intelligence:** Looker Studio interactive executive dashboarding.

---

## 📊 Key Analytical Insights & Business Impact

### 1. Robust Econometric Panel Regression
Using ordinary least squares (OLS) with **HC3 standard error adjustments** (correcting for heteroskedasticity in local urban districts), our research model establishes a statistically significant relationship between stewardship actions and city activity:

$$\text{Total Foot Traffic} = 41,140 + 159.28 \times (\text{Total MID Tickets}) - 710.09 \times (\text{Avg Response Time})$$

- **Impact of Active Presence:** Every resolved clean and safe ticket is associated with **+159.28 additional pedestrian visits** ($p < 0.001$), proving empirical value to MID ratepayers.
- **Response Speed:** Higher average response times negatively impact foot-traffic retention, verifying the need to preserve rapid-dispatch targets under **17 minutes**.
- **Robust Model Validity:** $p$-value of $0.0011$ confirms overall statistical significance.

### 2. High-Velocity Service Delivery
- **57,010 service tickets** successfully cataloged and resolved.
- **91.99% overall resolution rate** maintained, exceeding the 90.0% operational standard uniformly across all regional zones.
- **17-minute average response time** achieved across cleaning, bio-hazard, and safety escort tasks.

### 3. Foot Traffic Distribution Dynamics
- **12.92 Million** cumulative downtown pedestrian counts tracked.
- Foot traffic remains highly concentrated within the **Retail Core** and **Waterfront** zones, experiencing strong summer seasonal lifts (+125.39% YoY tracking compared to early baseline models).

---

## 📂 Repository File Blueprint

```text
├── README.md                           # Master Portfolio Page
├── requirements.txt                     # Python Dependencies
│
├── data/                               # Project Dataset Snapshots
│   ├── raw/                            # Dim/Fact Transaction CSVs (150,000+ total rows)
│   └── processed/                      # Semantic Views and Intermediate Aggregations
│
├── sql/                                # Production BigQuery Engineering Scripts
│   ├── 01_schema_ddl.sql               # Free-Tier optimized, clustered tables
│   ├── 02_data_cleaning.sql            # De-duplication views and outlier filtration
│   ├── 03_transformations.sql          # YoY lags and response rates at ETL layer
│   └── 04_analytical_views.sql         # Main semantic reporting views
│
├── notebooks/                          # Google Colab Executables
│   ├── 01_synthetic_data_generator.ipynb  # Telemetry generation engine
│   └── 02_statistical_analysis_hypothesis_testing.ipynb # Statsmodels regression pipeline
│
└── docs/                               # Professional Documentation
    ├── Executive_Summary.md            # Stakeholder executive brief
    ├── Dashboard_Executive_Summary.md  # Looker Studio user manual
    └── Project_Disclaimer.md           # Synthetic data & independence statements
```

---

## ⚙️ How to Deploy & Reproduce

### Prerequisite Setup
Clone this repository to your local system:
```bash
git clone https://github.com/yourusername/dsa-downtown-seattle-economic-vitality-index.git
cd dsa-downtown-seattle-economic-vitality-index
pip install -r requirements.txt
```

### Execution Path
1. **Data Generation:** Run `/notebooks/01_synthetic_data_generator.ipynb` to establish the telemetry files inside `data/raw/`.
2. **Warehouse DDL Setup:** Execute the SQL files sequentially (`sql/01_schema_ddl.sql` to `sql/04_analytical_views.sql`) inside Google BigQuery.
3. **Run Econometric Models:** Open and execute `/notebooks/02_statistical_analysis_hypothesis_testing.ipynb` in Colab to output robust OLS summaries.
4. **Dashboard Connection:** Establish a Looker Studio report connected to BigQuery view `v_monthly_downtown_dashboard` to auto-populate analytical charts.

---

### ⚖️ Project Disclaimer & Licensing
This project is an independent professional portfolio developed by **Daniel Rodriguez III**. This study was built entirely using synthetically engineered datasets to simulate real-world municipal operational patterns. It contains no proprietary, non-public, or confidential data belonging to the Downtown Seattle Association or the Metropolitan Improvement District.

Distributed under the **MIT License**. See `LICENSE` for more information.
