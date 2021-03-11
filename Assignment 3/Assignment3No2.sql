-- IT 2351 Spring 2021 Mahoney Assignment 3 No 2
-- This script uses the COUNT and SUM aggregate functions to return
-- the total number of orders, and the total ship_amount of those orders
SELECT COUNT(order_id) AS Number_Of_Orders, SUM(ship_amount) AS "Ship Value"
FROM orders;