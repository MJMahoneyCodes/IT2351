-- IT 2351 Spring 2021 Assignment 2 Part 2A Matt Mahoney
-- This joins the items and order_details tables
-- The primary key of the items table is item_id
-- The foreign key in the order_details table is item_id
SELECT title, artist, unit_price, order_qty
FROM items JOIN order_details
ON items.item_id = order_details.item_id
ORDER BY title, artist;