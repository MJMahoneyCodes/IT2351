-- IT2351 Spring 2021 Matt Mahoney Assignment 7 No 3
-- This creates a stored procedure that deletes an invoice
-- and the associated line_items using a transaction

-- use the ap database
USE ap;

-- if the procedure already exists, delete it so we can make a new one
DROP PROCEDURE IF EXISTS test;

-- change the delimiter so we can use semicolon in the code
DELIMITER //

CREATE PROCEDURE test()
BEGIN
	-- we create a variable to use later to check if an error has occurred
	DECLARE myerror INT DEFAULT FALSE;
  
	-- we are telling the code to continue on after any sql error
    -- and also set the error variable to true (meaning an error was encountered)
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET myerror = TRUE;
	
    -- we are using a transaction so that we can commit or rollback
    -- all the changes in one operation
	START TRANSACTION;
  
	-- we are deleting the line_items from the specified invoice_id
	DELETE FROM invoice_line_items
	WHERE invoice_id = 114;
	
    -- now that the line_items have been deleted, we can delete
    -- the invoice itself
	DELETE FROM invoices
	WHERE invoice_id = 114;
	
    -- error checking to either commit or rollback the entire
    -- transaction based on the value of myerror variable
	IF myerror = FALSE THEN
		COMMIT;
		SELECT 'The invoice and line_items were deleted.';
	ELSE
		ROLLBACK;
		SELECT 'The transaction was rolled back.';
	END IF;
END//

-- change the delimiter back to semicolon
DELIMITER ;

CALL test();