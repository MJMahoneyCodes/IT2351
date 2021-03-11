-- IT 2351 Spring 2021 Mahoney Assignment 3 No 6
-- This query joins the customers, orders, and order_items tables
-- It returns the total for each order, by customer and order

SELECT email_address, orders.order_id, SUM(item_price - discount_amount) AS order_total FROM customers
JOIN orders ON customers.customer_id = orders.customer_id
JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY email_address, order_id;