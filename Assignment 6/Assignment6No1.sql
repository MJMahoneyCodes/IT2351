-- IT2351 Spring 2021 Matt Mahoney Assignment 6 No 1
USE mahoney_guitar_shop;
DROP PROCEDURE IF EXISTS productCount;

-- change the delimiter to be able to use semicolons in the code
DELIMITER //
CREATE PROCEDURE productCount()
BEGIN
	-- create the variable to store the count of products
    DECLARE count INT;
	
    -- store the count of the products into the count variable
	SELECT COUNT(*) INTO count FROM products;
    
    -- IF statement to compare the count variable's value to 20
    -- and displays a message depending on the result
    IF count >= 20 THEN
		SELECT 'The number of products is greater than or equal to 20' AS Message;
	ELSE
		SELECT 'The number of products is less than 20' AS Message;
	END IF;
END//
-- change the delimiter back to semicolon
DELIMITER ;

CALL productCount();