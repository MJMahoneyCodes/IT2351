/********************************************************
* This script creates the database named mahoney_assignment_5 
*********************************************************/

DROP DATABASE IF EXISTS mahoney_assignment_5;
CREATE DATABASE mahoney_assignment_5;
USE mahoney_assignment_5;

-- create the tables for the database
CREATE TABLE students (
  student_id        INT          	PRIMARY KEY   AUTO_INCREMENT,
  student_name      VARCHAR(255)   	NOT NULL,
  student_address	VARCHAR(255)	NOT NULL,
  student_email		VARCHAR(255)	NOT NULL,
  student_major		VARCHAR(255)	NOT NULL
);

CREATE TABLE classes (
  class_id         	INT            PRIMARY KEY   AUTO_INCREMENT,
  class_number      INT            NOT NULL
);

CREATE TABLE class_sequences (
	class_sequence_id 	INT			PRIMARY KEY		AUTO_INCREMENT,
    student_id			INT			NOT NULL,
    class_id			INT			NOT NULL,
    CONSTRAINT class_sequence_fk_students
		FOREIGN KEY (student_id)
        REFERENCES students (student_id),
	CONSTRAINT class_sequence_fk_classes
		FOREIGN KEY (class_id)
        REFERENCES classes (class_id)
);

-- Insert data into the tables
INSERT INTO students (student_id, student_name, student_address,
 student_email, student_major) VALUES
(1, 'Joe Green', '124 Main Street', 'joe@school.edu', 'programming'),
(2, 'Sue Smith', '345 Second Street', 'sue@school.edu', 'programming'),
(3, 'Nick Green', '45 York Road', 'nick@school.edu', 'networking'), 
(4, 'Andy Andrews', '600 5th Avenue', 'andy@school.edu', 'networking'),
(5, 'Tom Baker', '123 Any Street', 'tom@school.edu', 'dance'),
(6, 'Fred Jones', '456 Nice Road', 'fred@school.edu', 'networking'),
(7, 'Marcy Jones', '777 Sunny Lane', 'marcy@school.edu', 'programming');

INSERT INTO classes (class_id, class_number) VALUES
(1, 1025),
(2, 1050),
(3, 1150),
(4, 1200),
(5, 2351);

INSERT INTO class_sequences (class_sequence_id, student_id, class_id) VALUES
(1, 1, 1),
(2, 1, 4),
(3, 1, 2),
(4, 2, 1),
(5, 2, 2),
(6, 2, 5),
(7, 3, 1),
(8, 4, 1),
(9, 4, 2),
(10, 5, 5),
(11, 5, 1),
(12, 6, 5),
(13, 7, 3),
(14, 7, 1);

-- Create a user named mgs_user
CREATE USER IF NOT EXISTS mgs_user@localhost
IDENTIFIED BY 'pa55word';

-- Grant privileges to that user
GRANT SELECT, INSERT, UPDATE, DELETE
ON mgs.*
TO mgs_user@localhost;