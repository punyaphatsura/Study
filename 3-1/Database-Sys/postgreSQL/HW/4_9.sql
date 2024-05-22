SELECT customer.customer_id, customer.customer_name
FROM customer
INNER JOIN (
    SELECT DISTINCT ON(customer_id) customer_id, order_date
    FROM ordert
	WHERE order_date BETWEEN '2020-01-10 00:00:00' AND '2020-01-16 00:00:00'
) AS ordert
ON customer.customer_id = ordert.customer_id;