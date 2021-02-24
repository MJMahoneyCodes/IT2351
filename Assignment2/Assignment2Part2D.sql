-- IT 2351 Spring 2021 Assignment 2 Part 2D Matt Mahoney
-- The primary key of the orders table is order_id joined with foreign key (same name) of order_details
-- The primary key of the order_details table is the item_id joined with foreign key (same name) of items

SELECT customer_id, order_date, artist, order_qty
FROM orders JOIN order_details
ON orders.order_id = order_details.order_id
JOIN items
ON order_details.item_id = items.item_id
ORDER BY customer_id;