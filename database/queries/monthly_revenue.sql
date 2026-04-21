-- Monthly revenue and order volume trend
-- Notebook: 02_sql_exploration, 04_eda
SELECT
    SUBSTR(o.order_purchase_timestamp, 1, 7)  AS month,
    COUNT(DISTINCT o.order_id)                 AS total_orders,
    ROUND(SUM(p.payment_value), 2)             AS total_revenue,
    ROUND(AVG(p.payment_value), 2)             AS avg_order_value
FROM orders o
JOIN order_payments p ON o.order_id = p.order_id
WHERE o.order_status = 'delivered'
GROUP BY month
ORDER BY month;
