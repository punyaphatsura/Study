WITH MaxTotalQuantity AS (
    SELECT product_id, SUM(ordered_quantity) AS total_quantity
    FROM order_line
    GROUP BY product_id
    ORDER BY total_quantity DESC
)
SELECT product.product_id, product.product_description
FROM product
INNER JOIN MaxTotalQuantity AS max_total_quantity
ON product.product_id = max_total_quantity.product_id
WHERE max_total_quantity.total_quantity = (SELECT MAX(total_quantity) FROM MaxTotalQuantity);