--1. What are the media types in the MediaType table? Use a SELECT statement to show them.
--2. What are the employees' full names? Show this in a single column called "Employee Names". Note: don't forget to put a space between first and last names, or a comma and a space if you put the last name first.
--3. Select the sum of 987 plus 789, divided by 111. Hint: it's 16 - don't forget about BEDMAS!.
--4. Select the rows for all the customers in Brazil and Canada.
--5. Who are all the customers with hotmail addresses? Hint: there are other hotmail "top level domains" besides '.com', for example "hotmail.co.uk".
--6. Who are all the customers who don't have a company listed?
--7. What are the genres whose name begins with a letter in the second half of the alphabet?
--8. List the cities with employees, reverse alphabetically. Hint: a list of things shouldn't contain duplicates.

-- 1 
SELECT * FROM tableName;

-- 2
SELECT FirstName, LastName FROM employee;

-- 3
SELECT (987 + 789) /111;

-- 4
SELECT * FROM Customer WHERE country IN ('Brazil', 'Canada');

-- 5
SELECT * FROM Customer
WHERE email LIKE '%_hotmail%';

-- 6
SELECT * FROM customer WHERE company IS null


-- 7
SELECT * FROM Genre WHERE name BETWEEN 'm' AND 'z';

-- 8
SELECT DISTINCT City FROM Employee
ORDER BY city DESC;