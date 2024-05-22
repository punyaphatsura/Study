WITH OrderCounts AS (
    SELECT customer_id, COUNT(customer_id) AS total_order
    FROM ordert
    GROUP BY customer_id
)

SELECT customer.customer_id, customer.customer_name
FROM customer
INNER JOIN OrderCounts AS ordert
ON customer.customer_id = ordert.customer_id
WHERE ordert.total_order = (SELECT MAX(total_order) FROM OrderCounts);