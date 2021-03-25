-- IT 2351 Spring 2021 Matt Mahoney Assignment 4 No 6
-- This query creates a combined view of the orders, products, and items tables as a view

CREATE VIEW order_item_products AS
SELECT o.order_id, order_date, tax_amount, ship_date, product_name, item_price, discount_amount,
(item_price - discount_amount) AS final_price, quantity, ((item_price - discount_amount) * quantity) AS item_total
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id