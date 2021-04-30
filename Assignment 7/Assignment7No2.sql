-- IT2351 Spring 2021 Matt Mahoney Assignment 7 No 2
-- This stored procedure is a transaction that renames a vendor
-- and updates the vendor_id in the invoices table, and then deletes the other vendor.
-- Federal Express Corporation bought United Parcel Service, so we are merging and
-- consolidating their data.

-- use the ap database
USE ap;
-- if the procedure already exists, delete that one
DROP PROCEDURE IF EXISTS test;
-- change the delimiter so that semicolons can be used in the procedure
DELIMITER //
-- create a new store program called test
CREATE PROCEDURE test()
BEGIN
	-- make a new variable called error defaulting to false
    -- this will be used to determine if we are going to rollback the transaction
	DECLARE myerror INT DEFAULT FALSE;
    
    -- the continue handler will skip over the code that results in any sql error
    -- and also set the error variable to true
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
		SET myerror = TRUE;
        
	-- we are using a transaction so that if any part of this fails
    -- we can rollback every operation
	START TRANSACTION;
    
    -- in the invoices table, if the vendor_id is 122 (United Parcel Service)
    -- change it to the vendor_id for the other company vendor_id 123 (Federal Express Corporation)
	UPDATE invoices
	SET vendor_id = 123
	WHERE vendor_id = 122;
    
	-- now that the invoices are consolidate under vendor_id 123
    -- we can delete the vendor that was acquired (vendor_id 122)
    DELETE FROM vendors
	WHERE vendor_id = 122;
    
    -- finally we can rename the vendor to the new merged company name
	UPDATE vendors
	SET vendor_name = 'FedUP'
	WHERE vendor_id = 123;
    
    -- now we do the error checking and either commit our changes (no error)
    -- or rollback the changes (an error occurred)
    -- and display a useful message to the user
    IF myerror = FALSE THEN
		COMMIT;
		SELECT "The merging of the companies was successful.";
    ELSE
		ROLLBACK;
        SELECT "The transaction encountered an error.";
	END IF;
	
    END//

-- change the delimiter back to semicolon
DELIMITER ;
    
-- invoke the stored procedure
CALL test();
    
    
    
	
	

    