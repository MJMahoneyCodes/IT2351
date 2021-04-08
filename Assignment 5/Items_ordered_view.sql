-- IT 2351 Spring 2021 Matt Mahoney Assignment 5 No. 3
-- This query joins the order_items, products, and categories tables
-- and creates a view out of them
CREATE VIEW items_ordered AS
SELECT category_name, product_name, item_price, quantity FROM order_items
JOIN products ON products.product_id = order_items.product_id
JOIN categories on products.category_id = categories.category_id;