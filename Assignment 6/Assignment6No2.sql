-- IT2351 Spring 2021 Matt Mahoney Assignment 6 No 2
USE mahoney_guitar_shop;
DROP PROCEDURE IF EXISTS insertCategory;

-- change the delimiter to be able to use semicolons in the code
DELIMITER //
CREATE PROCEDURE insertCategory()
BEGIN
    -- create the variable to store if a duplicate key error was encountered or not
    DECLARE duplicateKey INT DEFAULT FALSE;
	-- create the continue code if a duplicate key error is encountered
    DECLARE CONTINUE HANDLER FOR 1062
		SET duplicateKey = TRUE;
    -- try and add a new category to the categories table
    INSERT INTO categories VALUES(6,'Saxophones');
    -- IF statement to see if the duplicate key error was true or not
    IF duplicateKey = TRUE THEN
		SELECT 'Row was not inserted, duplicate entry' AS Message;
	ELSE
		SELECT '1 row was inserted' AS Message;
	END IF;
END//
-- change the delimiter back to semicolon
DELIMITER ;

CALL insertCategory();