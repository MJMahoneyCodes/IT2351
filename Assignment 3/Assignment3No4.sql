-- IT 2351 Spring 2021 Mahoney Assignment 3 No 4
-- This script joins categories, products, and order_items
-- The script shows the total number of products sold by category and product name
SELECT IF(GROUPING(category_name),"All Categories",category_name) AS category, 
IF(GROUPING(product_name),"All Products",product_name) AS product, COUNT(product_name) AS number_sold
FROM categories
JOIN products ON categories.category_id = products.category_id
JOIN order_items on products.product_id = order_items.product_id
GROUP BY category_name, product_name WITH ROLLUP