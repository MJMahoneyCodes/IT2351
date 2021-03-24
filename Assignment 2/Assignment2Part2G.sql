-- IT 2351 Spring 2021 Assignment 2 Part 2G Matt Mahoney
-- The primary key of the customers table is customer_id joined with the foreign key (same name) of orders
-- The primary key of the orders table is order_id joined with foreign key (same name) of order_details
-- The primary key of the order_details table is the item_id joined with foreign key (same name) of items
-- Filter the list to customers in Ohio
SELECT CONCAT(customer_first_name," ",customer_last_name) AS customer_name, order_date, artist, title, order_qty
FROM orders 
JOIN customers
ON customers.customer_id = orders.customer_id
JOIN order_details
ON orders.order_id = order_details.order_id
JOIN items
ON order_details.item_id = items.item_id
WHERE customer_state = "OH"
ORDER BY customer_name;