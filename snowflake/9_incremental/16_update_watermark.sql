use database customer_analytics;

UPDATE metadata.pipeline_watermark
SET last_processed_timestamp =
(
    SELECT MAX(updated_at)
    FROM staging.sales_incremental
)
WHERE pipeline_name = 'customer_data_analytics'
AND EXISTS (SELECT 1 FROM staging.sales_incremental);