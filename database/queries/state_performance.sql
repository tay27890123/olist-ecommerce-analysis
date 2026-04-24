
SELECT
    c.customer_state                                              AS state,
    COUNT(DISTINCT o.order_id)                                    AS total_orders,
    ROUND(SUM(p.payment_value), 2)                                AS total_revenue,
    ROUND(SUM(p.payment_value) / COUNT(DISTINCT o.order_id), 2)  AS revenue_per_order,
    ROUND(AVG(r.review_score), 2)                                 AS avg_review_score
FROM orders o
JOIN customers c          ON o.customer_id = c.customer_id
JOIN order_payments p     ON o.order_id    = p.order_id
LEFT JOIN order_reviews r ON o.order_id    = r.order_id
WHERE o.order_status = 'delivered'
GROUP BY state
ORDER BY total_revenue DESC
LIMIT 15
