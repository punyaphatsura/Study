SELECT customer.customer_id, customer.customer_name
FROM customer
LEFT JOIN (
    SELECT customer_id, COUNT(*) AS number_of_orders
    FROM ordert
    GROUP BY customer_id
) AS ordert
ON customer.customer_id = ordert.customer_id
WHERE number_of_orders is NULL
ORDER BY customer_id;
