use database customer_analytics;

MERGE INTO analytics.fact_sales AS target
USING staging.sales_incremental AS source
ON target.customer_id = source.customer_id
AND target.product_id = source.product_id
AND target.sales_date = source.sales_date

WHEN MATCHED THEN
UPDATE SET
    target.quantity = source.quantity,
    target.total_amount = source.total_amount

WHEN NOT MATCHED THEN
INSERT (
    customer_id,
    product_id,
    quantity,
    sales_date,
    total_amount
)
VALUES (
    source.customer_id,
    source.product_id,
    source.quantity,
    source.sales_date,
    source.total_amount
);
