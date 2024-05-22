WITH OrderCounts AS (
    SELECT product_id, COUNT(product_id) AS total_order
    FROM order_line
    GROUP BY product_id
)
SELECT product.product_id, product.product_description
FROM product
INNER JOIN OrderCounts AS order_line
ON product.product_id = order_line.product_id
WHERE order_line.total_order = (SELECT MAX(total_order) FROM OrderCounts);