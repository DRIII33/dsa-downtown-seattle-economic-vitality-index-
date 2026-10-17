# Project Disclaimer & Synthetic Data Notice

## Synthetic Data Notice
This portfolio project was built using synthetic and simulated datasets structured to mimic realistic urban operational categories, pedestrian densities, and Business Improvement Area (BIA) services within downtown Seattle, Washington.

## Non-Affiliation Statement
This project is an independent professional portfolio engineered by **Daniel Rodriguez III**. While explicitly designed to demonstrate alignment with the analytics standards of the **Downtown Seattle Association (DSA)** and the **Metropolitan Improvement District (MID)**, it does not include, leak, or utilize private, non-public, or proprietary databases belonging to either organization.

## Infrastructure Statement
All ETL processes, cloud warehousing, and statistical model computations were executed under the GCP Project ID `driiiportfolio` within BigQuery free-tier sandbox constraints. Database models successfully implement clustering-only designs (`CLUSTER BY subdistrict_id`) to bypass sandbox 60-day partition expiration limits and maintain a completely free cloud framework.