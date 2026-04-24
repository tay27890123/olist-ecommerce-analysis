
SELECT
    payment_type,
    COUNT(*)                            AS transaction_count,
    ROUND(SUM(payment_value), 2)        AS total_value,
    ROUND(AVG(payment_value), 2)        AS avg_payment,
    ROUND(AVG(payment_installments), 1) AS avg_installments
FROM order_payments
WHERE payment_type != 'not_defined'
GROUP BY payment_type
ORDER BY transaction_count DESC
