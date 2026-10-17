# Dashboard Executive Summary & User Manual

## Platform Architecture & Layout
The Looker Studio Downtown Executive Control Panel connects directly to the BigQuery View `v_monthly_downtown_dashboard` to evaluate pedestrian footprints and MID activity. The interface contains three pages:

### Page 1: Executive Overview & Headline KPIs
* **Headline KPI Cards:** Tracks top-line Total Foot Traffic (12.92M), Total Resolved Tickets (57,010), Average Response Time (17.0 mins), and Overall Resolution Rate (91.99%).
* **Monthly Pedestrian Trends Line Chart:** Visualizes granular recovery trajectories across Seattle's six subdistricts, highlighting Retail Core and Waterfront dominance.
* **MID Tickets by Subdistrict Bar Chart:** Displays sorted operational task volumes per subdistrict, showing equitable resource deployment (~9.5k events each).

### Page 2: Subdistrict Deep Dive & Comparative Analysis
* **Dropdown Select Filters:** Multi-select options for `subdistrict_name` and `mid_zone`.
* **Traffic & YoY Growth % Combo Chart:** Compares aggregate monthly volume (bars, left axis) directly against YoY percentage growth changes (line, right axis) to pinpoint local economic inflection.
* **Performance Matrix Grid:** Granular, sortable performance columns displaying detailed tabular indicators for monthly analysis.

### Page 3: MID Operational Impact & Equity Mapping
* **Resolution Rate by Zone (Horizontal Bar Chart):** Compares average resolution percentages against our rigorous 90% Target Resolution Standard reference line, showing consistent cross-district equity.
* **Deployments vs. Foot Traffic Scatter Plot:** Maps total service tickets resolved (x-axis) to total pedestrian counts (y-axis) with bubble sizes showing average hourly traffic. The positive regression line confirms that proactive district maintenance drives pedestrian traffic retention.