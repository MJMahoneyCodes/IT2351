-- IT2351 Spring 2021 Matt Mahoney Assignment 7 No 1
-- This stored procedure deletes a customer from the customers table, and all related data
-- from the addresses, orders, and order_items tables

-- use my guitar shop database
use mahoney_guitar_shop;

-- if the stored procedure exists, first remove it
DROP PROCEDURE IF EXISTS delete_customer_data;

-- change the delimiter to double-slash so I can use semicolons in the code
DELIMITER //

CREATE PROCEDURE delete_customer_data
(
	-- take in an input parameter of the customer_id to delete
	IN customer_id_input INT
)
BEGIN
	-- create an error variable to use later for error checking
	DECLARE myerror INT DEFAULT FALSE;
	
    -- create a continue handler when an error is encountered
    -- and set the error value to true for use in the IF statement
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET myerror = TRUE;
	
    -- create a transaction so all or none of the operations are done together
	START TRANSACTION;
    
    -- find and delete the order_items records where
    -- the customer_id equals the input parameter customer_id_input
    -- using joins to relate to the orders and then customers tables
    DELETE order_items FROM order_items
	JOIN orders ON orders.order_id = order_items.order_id
	JOIN customers ON customers.customer_id = orders.customer_id
	WHERE customers.customer_id = customer_id_input;
    
	-- find and delete the orders records where the customer_id
    -- equals the input parameter customer_id_input
    DELETE orders FROM orders
    WHERE customer_id = customer_id_input;
    
    -- find and delete the addresses where the customer_id
    -- equals the input parameter customer_id_input
    DELETE addresses FROM addresses
    WHERE customer_id = customer_id_input;
    
    -- finally delete the customer now that all related addresses,
    -- orders, and order_items have been removed
    DELETE customers FROM customers
    WHERE customer_id = customer_id_input;
    
    -- error checking on myerror variable
    -- if we've encountered an error, scrap the whole transaction
    -- otherwise, commit the transaction
    IF myerror = FALSE THEN
		COMMIT;
        SELECT "The customer and related data has been deleted." AS "Message";
	ELSE
		ROLLBACK;
        SELECT "An error was encountered. No data deleted." AS "Message";
	END IF;
END//

DELIMITER ;

call delete_customer_data(8);
    
    
    