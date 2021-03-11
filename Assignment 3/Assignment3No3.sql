-- IT 2351 Spring 2021 Mahoney Assignment 3 No 3
-- This script returns products that have a matching category via an inner join
-- The script counts the products, by category, and shows the most expensive product for that category
SELECT category_name, COUNT(product_name) AS "Number of Products", MAX(list_price) AS "Most Expensive Product"
FROM categories
JOIN products on categories.category_id = products.category_id
GROUP BY category_name
ORDER BY COUNT(product_name) DESC;