-- IT 2351 Spring 2021 Assignment 2 Part 2 I
-- Adding to the unit_price of items by 10% if the item's current unit_price is > 17

UPDATE items
SET unit_price = unit_price * 1.1
WHERE unit_price > 17;