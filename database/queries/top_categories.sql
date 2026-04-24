
SELECT
    pr.product_category_name           AS category,
    COUNT(DISTINCT oi.order_id)         AS total_orders,
    ROUND(SUM(oi.price), 2)             AS total_revenue,
    ROUND(AVG(oi.price), 2)             AS avg_item_price,
    ROUND(AVG(oi.freight_value), 2)     AS avg_freight
FROM order_items oi
JOIN products pr ON oi.product_id = pr.product_id
WHERE pr.product_category_name IS NOT NULL
GROUP BY category
ORDER BY total_revenue DESC
LIMIT 10
