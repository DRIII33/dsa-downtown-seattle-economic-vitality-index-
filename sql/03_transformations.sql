-- sql/03_transformations.sql
-- Purpose: Compute intermediate monthly metrics, response rates, and robust YoY baseline statistics.

CREATE OR REPLACE TABLE `driiiportfolio.dsa_urban_analytics.int_monthly_subdistrict_performance` AS
WITH MonthlyPedestrians AS (
    SELECT
        DATE_TRUNC(traffic_date, MONTH) AS month_start,
        subdistrict_id,
        SUM(clean_pedestrian_count) AS total_foot_traffic,
        AVG(clean_pedestrian_count) AS avg_hourly_foot_traffic
    FROM `driiiportfolio.dsa_urban_analytics.v_clean_pedestrian_traffic`
    GROUP BY 1, 2
),
MonthlyOps AS (
    SELECT
        DATE_TRUNC(date, MONTH) AS month_start,
        subdistrict_id,
        COUNT(ticket_id) AS total_mid_tickets,
        AVG(response_time_minutes) AS avg_ops_response_time,
        SAFE_DIVIDE(COUNTIF(resolution_status = 'Resolved'), COUNT(ticket_id)) AS resolution_rate
    FROM `driiiportfolio.dsa_urban_analytics.fact_mid_operations`
    GROUP BY 1, 2
)
SELECT
    p.month_start,
    p.subdistrict_id,
    p.total_foot_traffic,
    p.avg_hourly_foot_traffic,
    COALESCE(o.total_mid_tickets, 0) AS total_mid_tickets,
    ROUND(o.avg_ops_response_time, 1) AS avg_ops_response_time_min,
    ROUND(COALESCE(o.resolution_rate, 0) * 100, 2) AS ops_resolution_percentage,
    LAG(p.total_foot_traffic, 12) OVER(PARTITION BY p.subdistrict_id ORDER BY p.month_start) AS prior_year_foot_traffic,
    ROUND(
        (p.total_foot_traffic - LAG(p.total_foot_traffic, 12) OVER(PARTITION BY p.subdistrict_id ORDER BY p.month_start))
        / NULLIF(LAG(p.total_foot_traffic, 12) OVER(PARTITION BY p.subdistrict_id ORDER BY p.month_start), 0) * 100, 2
    ) AS foot_traffic_yoy_growth_pct
FROM MonthlyPedestrians p
LEFT JOIN MonthlyOps o ON p.month_start = o.month_start AND p.subdistrict_id = o.subdistrict_id;