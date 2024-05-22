WITH cusorcnt AS (
	SELECT ordert.customer_id, order_line.product_id, sum(order_line.ordered_quantity) AS sm
	FROM ordert, order_line
	WHERE ordert.order_id = order_line.order_id
	GROUP BY ordert.customer_id, order_line.product_id
	ORDER BY ordert.customer_id, sum(order_line.ordered_quantity) DESC
)
, mx AS (
    SELECT cusorcnt.customer_id, max(cusorcnt.sm) AS sm
    FROM cusorcnt
    GROUP BY customer_id
    ORDER BY customer_id
)

SELECT mx.customer_id, cusorcnt.product_id, mx.sm AS num
FROM mx, cusorcnt
WHERE mx.customer_id = cusorcnt.customer_id AND mx.sm = cusorcnt.sm