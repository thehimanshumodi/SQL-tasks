SELECT COUNT(*) FROM student
SELECT MAX(*) FROM student
SELECT MIN(*) FROM student
SELECT ROUND(AVG(*), 2) FROM student


SELECT mode, SUM(amount) AS id
FROM payment
GROUP BY mode
ORDER BY id ASC


SELECT mode, SUM(amount) AS id
FROM payment
GROUP BY mode
HAVING COUNT(amount) >= 2 AND COUNT(amount) < 4
ORDER BY id DESC
