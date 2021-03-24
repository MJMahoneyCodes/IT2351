-- IT 2351 Spring 2021 Matt Mahoney Assignment 4 No 2
-- This query uses various functions to pull apart an email address

SELECT email_address, LENGTH(email_address) AS "Length",
LOCATE("@", email_address) AS "@", SUBSTRING(email_address,1,LOCATE("@",email_address) - 1) AS "Username",
SUBSTRING(email_address,LOCATE("@",email_address) + 1) AS "Domain"
FROM customers