-- IT2351 Spring 2021 Matt Mahoney Assignment 6 No 3
USE mahoney_guitar_shop;
DROP PROCEDURE IF EXISTS discount_Price;

-- change the delimiter to be able to use semicolons in the code
DELIMITER //
-- procedure accepts one INT value which is the item_id in the order_items table
CREATE PROCEDURE discount_Price( IN item_id_param INT )
BEGIN
    SELECT (item_price - discount_amount) AS Discount_Price
    FROM order_items 
    -- using the item_id_param input parameter for the WHERE clause
    WHERE item_id = item_id_param;
END//
-- change the delimiter back to semicolon
DELIMITER ;

CALL discount_Price(3);