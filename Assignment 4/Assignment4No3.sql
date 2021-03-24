-- IT 2351 Spring 2021 Matt Mahoney Assignment 4 No 3
-- This query uses a calculation and rounds the result

SELECT list_price, discount_percent,
ROUND(list_price - (list_price * (discount_percent / 100)), 2) AS "discount_amount"
FROM products