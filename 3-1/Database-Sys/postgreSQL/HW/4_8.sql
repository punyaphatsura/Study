SELECT customer.customer_id, customer.customer_name, ordert.number_of_orders AS number_of_orders
FROM customer
INNER JOIN (
    SELECT customer_id, COUNT(customer_id) AS number_of_orders
    FROM ordert
    GROUP BY customer_id
) AS ordert
ON customer.customer_id = ordert.customer_id
ORDER BY number_of_orders DESC
LIMIT 3;
