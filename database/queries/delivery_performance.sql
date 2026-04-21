-- Average delivery time and early/late performance
-- Notebook: 02_sql_exploration, 03_data_cleaning
SELECT
    order_status,
    COUNT(order_id)    AS order_count,
    ROUND(AVG(
        julianday(order_delivered_customer_date) -
        julianday(order_purchase_timestamp)
    ), 1)              AS avg_days_to_deliver,
    ROUND(AVG(
        julianday(order_estimated_delivery_date) -
        julianday(order_delivered_customer_date)
    ), 1)              AS avg_days_early_or_late
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL
GROUP BY order_status
ORDER BY order_count DESC;
