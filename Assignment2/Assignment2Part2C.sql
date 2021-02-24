-- IT 2351 Spring 2021 Assignment 2 Part 2C Matt Mahoney
-- This joins the customers and orders and order_details tables
-- The primary key of the orders table is order_id joined with foreign key (same name) of order_details

SELECT customer_id, order_date, item_id, order_qty
FROM orders JOIN order_details
ON orders.order_id = order_details.order_id
ORDER BY customer_id;