-- Does delivery speed affect customer review scores?
-- Uses CASE WHEN to bucket delivery days into ranges
-- Notebook: 05_business_insights
SELECT
    CASE
        WHEN actual_delivery_days <= 7  THEN '1. 0-7 days'
        WHEN actual_delivery_days <= 14 THEN '2. 8-14 days'
        WHEN actual_delivery_days <= 21 THEN '3. 15-21 days'
        WHEN actual_delivery_days <= 30 THEN '4. 22-30 days'
        ELSE                                 '5. 30+ days'
    END                            AS delivery_bucket,
    COUNT(oc.order_id)             AS order_count,
    ROUND(AVG(r.review_score), 3)  AS avg_review_score
FROM orders_clean oc
JOIN order_reviews r ON oc.order_id = r.order_id
WHERE oc.actual_delivery_days IS NOT NULL
  AND oc.actual_delivery_days >= 0
  AND r.review_score IS NOT NULL
GROUP BY delivery_bucket
ORDER BY delivery_bucket;
