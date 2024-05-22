SELECT SUM(order_line.ordered_quantity * product.standard_price) AS total_payment
FROM order_line
JOIN product ON order_line.product_id = product.product_id
WHERE order_line.order_id = 3;