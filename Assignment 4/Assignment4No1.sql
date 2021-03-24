-- IT 2351 Spring 2021 Matt Mahoney Assignment 4 Part 1
-- This query uses the FORMAT, CONVERT, and CAST functions

SELECT list_price, FORMAT(list_price, 1) AS "FORMAT",
CONVERT(list_price, SIGNED) AS "CONVERT", CAST(list_price AS SIGNED) AS "CAST"
FROM products;