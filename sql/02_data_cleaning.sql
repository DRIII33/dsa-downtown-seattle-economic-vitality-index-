-- sql/02_data_cleaning.sql
-- Purpose: Clean, validate, and deduplicate active transactional sensor streams.

CREATE OR REPLACE VIEW `driiiportfolio.dsa_urban_analytics.v_clean_pedestrian_traffic` AS
WITH Deduplicated AS (
    SELECT
        timestamp,
        subdistrict_id,
        sensor_id,
        pedestrian_count,
        ROW_NUMBER() OVER(PARTITION BY timestamp, sensor_id ORDER BY pedestrian_count DESC) as row_num
    FROM `driiiportfolio.dsa_urban_analytics.fact_pedestrian_traffic`
)
SELECT
    timestamp,
    DATE(timestamp) AS traffic_date,
    EXTRACT(HOUR FROM timestamp) AS hour_of_day,
    EXTRACT(DAYOFWEEK FROM timestamp) AS day_of_week,
    subdistrict_id,
    sensor_id,
    IF(pedestrian_count < 0, 0, pedestrian_count) AS clean_pedestrian_count
FROM Deduplicated
WHERE row_num = 1;