-- IT 2351 Spring 2021 Matt Mahoney Assignment 4 No 5
-- This query shows the products with highest and lowest sales within each category

SELECT category_name, product_name, SUM(item_price - discount_amount) AS total_sales,
FIRST_VALUE(product_name) OVER(
	PARTITION BY category_name
	ORDER BY SUM(item_price - discount_amount) DESC
    ) highest_sales,
LAST_VALUE(product_name) OVER(
	PARTITION BY category_name
    ORDER BY SUM(item_price - discount_amount) DESC
    RANGE BETWEEN 
            UNBOUNDED PRECEDING AND 
            UNBOUNDED FOLLOWING
    ) lowest_sales
FROM categories c
JOIN products p ON c.category_id = p.category_id
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY category_name, product_name;