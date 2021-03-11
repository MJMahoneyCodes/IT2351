-- IT 2351 Spring 2021 Mahoney Assignment 3 No 5
-- This script uses a subquery instead of a join
-- This only shows categories that also exist in the products table

SELECT DISTINCT category_name FROM categories
WHERE category_id IN 
(SELECT category_id FROM products)
ORDER BY category_name;