INSERT INTO student (id, "Name", "Branch", "bookname") VALUES
(1, 'Alice Johnson', 'IT', 'The Great Adventure'),
(2, 'Bob Williams', 'CS', 'SQL Basics for Dummies'),
(3, 'Charlie Brown', 'CS', 'Database Design Principles'),
(4, 'Diana Miller', 'IT', 'Introduction to Python'),
(5, 'Eve Davis', 'ECE', 'Data Structures Explained'); 

UPDATE student 
SET branch = 'CS'
WHERE name = 'Alice Johnson';

DELETE FROM student
WHERE name = 'Diana Miller';

ALTER TABLE student
RENAME COLUMN bookname TO title;