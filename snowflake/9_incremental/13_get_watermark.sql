use database customer_analytics;

select last_processed_timestamp
from metadata.pipeline_watermark
where pipeline_name = 'customer_data_analytics';

