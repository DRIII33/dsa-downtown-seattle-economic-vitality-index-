-- sql/01_schema_ddl.sql
-- Purpose: Initialize clean sandbox schemas using clustered-only constraints for free-tier compatibility.

CREATE SCHEMA IF NOT EXISTS `driiiportfolio.dsa_urban_analytics`
OPTIONS(location="US");

CREATE OR REPLACE TABLE `driiiportfolio.dsa_urban_analytics.dim_subdistricts` (
    subdistrict_id STRING,
    name STRING,
    mid_zone STRING,
    total_blocks INT64
);

CREATE OR REPLACE TABLE `driiiportfolio.dsa_urban_analytics.fact_pedestrian_traffic` (
    timestamp TIMESTAMP,
    subdistrict_id STRING,
    sensor_id STRING,
    pedestrian_count INT64
)
CLUSTER BY subdistrict_id;

CREATE OR REPLACE TABLE `driiiportfolio.dsa_urban_analytics.fact_mid_operations` (
    ticket_id STRING,
    date DATE,
    subdistrict_id STRING,
    service_category STRING,
    response_time_minutes FLOAT64,
    resolution_status STRING
)
CLUSTER BY subdistrict_id, service_category;