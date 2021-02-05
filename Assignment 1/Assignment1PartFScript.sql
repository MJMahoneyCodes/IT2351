-- IT2351 Spring 2021 Matt Mahoney, Assignment 1 Part 3F
-- This query uses a calculation for days to ship
SELECT customer_id AS "ID", order_date AS "Date Ordered",
shipped_date AS "Date Shipped", shipped_date - order_date AS "Days_to_Ship"
FROM orders
ORDER BY customer_id, Days_to_Ship