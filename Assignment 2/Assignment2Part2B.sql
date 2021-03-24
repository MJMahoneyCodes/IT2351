-- IT 2351 Spring 2021 Assignment 2 Part 2B Matt Mahoney
-- This joins the customers and orders tables
-- The primary key of the customers table is customer_id
-- The foreign key in the orders table is customer_id

SELECT CONCAT(customer_first_name," ",customer_last_name) AS customer_name, customer_city, customer_state, order_date, shipped_date
FROM customers JOIN orders
ON customers.customer_id = orders.customer_id
ORDER BY customer_state, customer_city, customer_last_name, customer_first_name;
