-- Using WHERE: Select students from 'CS' branch
SELECT *
FROM student
WHERE branch = 'CS';

-- Using AND: Select students from 'IT' branch AND bookname contains 'Machine'
SELECT *
FROM student
WHERE branch = 'IT' AND bookname LIKE '%Machine%';

-- Using OR: Select students from 'ECE' branch OR name is 'Rahul Sharma'
SELECT *
FROM student
WHERE branch = 'EC' OR name = 'Rahul Sharma';

-- Using LIKE: Select students whose bookname starts with 'D'
SELECT *
FROM student
WHERE bookname LIKE 'D%';

-- Using LIKE: Select students whose name ends with 'a'
SELECT *
FROM student
WHERE name LIKE '%a';

-- Using BETWEEN (for student IDs): Select students with id between 103 and 107
SELECT *
FROM student
WHERE id BETWEEN 1 AND 5;

-- Order by branch in ascending order (default)
SELECT *
FROM library
ORDER BY branch;

-- Order by branch in descending order, then by title in ascending order
SELECT *
FROM library
ORDER BY branch DESC, title ASC;

-- Order by ID in descending order
SELECT name, title
FROM library
ORDER BY id DESC;