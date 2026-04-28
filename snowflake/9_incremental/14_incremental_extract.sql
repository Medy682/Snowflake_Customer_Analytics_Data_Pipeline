use database customer_analytics;

-- sales incremental
CREATE OR REPLACE TABLE staging.sales_incremental AS
SELECT *
FROM staging.sales_clean
WHERE updated_at >
(
    SELECT last_processed_timestamp
    FROM metadata.pipeline_watermark
    WHERE pipeline_name = 'customer_data_analytics'
);