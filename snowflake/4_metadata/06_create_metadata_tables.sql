USE DATABASE customer_analytics;

CREATE OR REPLACE TABLE metadata.pipeline_watermark(
pipeline_name string,
last_processed_timestamp timestamp
);
insert into metadata.pipeline_watermark(pipeline_name,last_processed_timestamp)
values
('customer_data_analytics', '1900-01-01')
;

