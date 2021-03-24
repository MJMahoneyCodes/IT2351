-- IT 2351 Spring 2021 Matt Mahoney Assignment 4 No 4
-- This query returns only orders that have shipped and the order_date is in March, 2018
-- Calculations are done for approx_ship_date and days_to_ship

SELECT order_id, order_date, DATE_ADD(order_date, INTERVAL 2 DAY) AS "approx_ship_date",
	ship_date, DATEDIFF(ship_date, order_date) AS "days_to_ship"
FROM orders
WHERE ship_date IS NOT NULL 
	AND (MONTH(order_date) = 3 AND YEAR(order_date) = 2018)