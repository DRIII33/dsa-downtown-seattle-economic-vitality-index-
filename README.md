# Downtown Seattle Economic Vitality & Public Realm Recovery Index (2025–2026)

[![Database: BigQuery](https://img.shields.io/badge/Database-Google%20BigQuery-blue?style=flat-square&logo=google-cloud)](sql/)
[![Analytics: Python](https://img.shields.io/badge/Analytics-Python%20%7C%20Statsmodels-green?style=flat-square&logo=python)](notebooks/)
[![BI: Looker Studio](https://img.shields.io/badge/BI-Looker%20Studio-orange?style=flat-square)](docs/Dashboard_Executive_Summary.md)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg?style=flat-square)](LICENSE)

Quick links:
- [Data](data/)
- [Raw data](data/raw/)
- [Processed data](data/processed/)
- [SQL](sql/)
- [Notebooks](notebooks/)
- [Docs](docs/)
- [MIT License](LICENSE)

This end-to-end portfolio analyzes how public realm stewardship influences pedestrian activity in downtown Seattle by combining synthetic telemetry, service-desk logs, warehouse modeling, and stat[...] 

The repository demonstrates a structured pipeline from synthetic data generation through schema validation, transformation, statistical testing, and executive reporting. It is intentionally built to b[...] 

---

## Repository structure

```text
.
├── README.md                                 # Project overview and navigation
├── LICENSE                                   # MIT license
├── requirements.txt                          # Python environment dependencies
├── data/
│   ├── raw/                                  # Synthetic source datasets
│   └── processed/                            # Cleaned and transformed outputs
├── sql/
│   ├── 01_schema_ddl.sql                     # Warehouse schema definition
│   ├── 02_data_cleaning.sql                  # Cleaning and validation logic
│   ├── 03_transformations.sql                # Business logic and feature engineering
│   └── 04_analytical_views.sql               # Reporting views for analysis
├── notebooks/
│   ├── 01_synthetic_data_generator.ipynb     # Synthetic dataset generation
│   └── 02_statistical_analysis_hypothesis_testing.ipynb
│                                            # Econometric testing and interpretation
├── docs/
│   ├── Executive_Summary.md                  # Stakeholder summary
│   ├── Dashboard_Executive_Summary.md        # BI dashboard summary
│   └── Project_Disclaimer.md                 # Data limitations and disclaimers
└──
```

---

## Project workflow

1. Generate synthetic data in [notebooks/01_synthetic_data_generator.ipynb](notebooks/01_synthetic_data_generator.ipynb).
2. Load and validate the schema using [sql/01_schema_ddl.sql](sql/01_schema_ddl.sql).
3. Apply cleaning and transformation steps in [sql/02_data_cleaning.sql](sql/02_data_cleaning.sql) and [sql/03_transformations.sql](sql/03_transformations.sql).
4. Build analytical views in [sql/04_analytical_views.sql](sql/04_analytical_views.sql).
5. Run the econometric analysis in [notebooks/02_statistical_analysis_hypothesis_testing.ipynb](notebooks/02_statistical_analysis_hypothesis_testing.ipynb).
6. Review summaries in [docs/Executive_Summary.md](docs/Executive_Summary.md) and [docs/Dashboard_Executive_Summary.md](docs/Dashboard_Executive_Summary.md).

---

## Local setup

Clone the repository:

```bash
git clone https://github.com/DRIII33/dsa-downtown-seattle-economic-vitality-index-.git
cd dsa-downtown-seattle-economic-vitality-index-
python -m venv .venv
source .venv/bin/activate  # Windows: .venv\Scripts\activate
pip install -r requirements.txt
```

The project dependencies are defined in [requirements.txt](requirements.txt).

---

## Analytical focus

The analysis evaluates how public realm interventions and service response performance influence foot traffic intensity across downtown districts. The workflow centers on a robust panel-regression[...]

This project highlights the value of:
- service operations management,
- public-space stewardship,
- district-level business recovery planning,
- and data-driven urban performance evaluation.

---

## Documentation and licensing

- [Executive Summary](docs/Executive_Summary.md)
- [Dashboard Executive Summary](docs/Dashboard_Executive_Summary.md)
- [Project Disclaimer](docs/Project_Disclaimer.md)
- [MIT License](LICENSE)

Distributed under the MIT License. See [LICENSE](LICENSE) for full details.
