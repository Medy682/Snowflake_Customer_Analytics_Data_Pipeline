--ERROR LOGGING TABLE
--Error logging table( Error handling): 
CREATE OR REPLACE TABLE analytics.pipeline_error_log (
pipeline_name STRING,
activity_name STRING,
error_message STRING,
error_time TIMESTAMP
);

INSERT INTO analytics.pipeline_error_log
VALUES (
'customer_data_analytics_pipeline',
'run_staging_layer',
'Pipeline activity failed',
CURRENT_TIMESTAMP
);

--AUDIT TABLE
--Pipeline_Audit table (pipeline_run_log):
 CREATE OR REPLACE TABLE analytics.pipeline_audit(
 run_id string,
 pipeline_name string,
 start_time timestamp,
 end_time timestamp,
 status string
);

--log start( first pipeline activity)
INSERT INTO analytics.pipeline_audit(run_id, pipeline_name, start_time, end_time, status)
SELECT 
    UUID_STRING(), 
    'customer_data_pipeline', 
    CURRENT_TIMESTAMP(), 
    NULL, 
    'RUNNING';

--log end (last pipeline activity)
UPDATE analytics.pipeline_audit
SET end_time = CURRENT_TIMESTAMP,
status = 'SUCCESS'
WHERE pipeline_name = 'customer_data_analytics_pipeline'
AND end_time IS NULL;
--Now every pipeline run is tracked.

UPDATE analytics.pipeline_audit
SET pipeline_name = 'customer_data_analytics_pipeline' 
WHERE pipeline_name = 'customer_data_pipeline';




