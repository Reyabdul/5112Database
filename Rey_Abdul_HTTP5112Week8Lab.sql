/*
LAB QUESTIONS;
1. Get a list of all books, including the author's names (duplicate books are okay, if the book has multiple authors).
2. Get a list of all books withdrawn by people with the initials 'B.W.'. Show a column for the first name, last name, initials, and the title of the book. Remember: keep things concise.
3. Get the number of books written by each American author. Include the first and last names of the author. Note that America might be represented in the 'country' column in more than one way - always check your results table to make sure you're getting the expected results.
4. For any book withdrawn in October, get the member's first name, last name, the withdrawal date and the book's title. Hint: Try getting the month from a date using the scalar function MONTH()
5. Get a list of people who have ever returned overdue books (i.e. any withdrawal where the return date is greater than the due date). Remember that, unless otherwise specified, lists shouldn't contain duplicate rows.
6. Get a list of all authors, and the books they wrote. Include authors multiple times if they wrote multiple books. Also include authors who don't have any books in the database. Hint: this is a tricky one - think back on why right joins exist in the first place.
7. Get a list of members who've never withdrawn a book. Hint: outer joins return rows with null values if there is no match between the tables.
8. Rewrite the above query as the opposite join (if you used a left join, rewrite it as a right join; if you used a right join, rewrite it as a left join). The results table should contain the same data.
9. Cross join books and authors. Isn't that ridiculous?
10. Get a list of all members who have the same first name as other members. Sort it by first name so you can verify the data.
*/

-- 1 
SELECT b.title, CONCAT(first_name, ", ", last_name) AS "Author's Name" 
FROM books b 
	JOIN authorship  ap
		ON ap.book_id = b.book_id  
	JOIN authors a
		ON ap.author_id = a.author_id 
;

-- 2
SELECT m.first_name, m.last_name,CONCAT(SUBSTR(first_name, 1,1 ), ".", SUBSTR(last_name, 1, 1), ".")
  AS Initials, b.title  
FROM members m 
	JOIN withdrawals w 
		ON w.member_id = m.member_id 
	JOIN books b 
		ON w.book_id = w.book_id 
WHERE first_name LIKE "B%"
	AND last_name LIKE "W%"
;

-- 3
SELECT first_name, last_name, country
FROM authors a
	JOIN authorship ap 
		USING (author_id)
	JOIN books b 
		ON ap.book_id =b.book_id 
WHERE country = 'USA'
--Can't seem to use Sum() or 'Group By' to calculate total book written from one author 

-- 4
SELECT first_name,last_name, title, MONTHNAME(w.withdrawal_date) AS MonthName 
FROM members m 
	JOIN withdrawals w 
		ON w.member_id  = m.member_id
	JOIN books b 
		ON w.book_id = b.book_id 
	WHERE MONTHNAME(w.withdrawal_date) = 'October' 
;

-- 5
SELECT first_name,last_name, w.return_date , w.due_date
FROM members m 
	JOIN withdrawals w 
		ON w.member_id  = m.member_id
	WHERE w.return_date > w.due_date 
;


-- 6
SELECT a.first_name, a.last_name, b2.title
FROM authors a 
	JOIN authorship ap 
		ON ap.author_id = a.author_id 
	JOIN books b 
		ON ap.book_id = b.book_id
	RIGHT JOIN books b2 
		ON ap.book_id = b2.book_id 
;

-- 7
SELECT m.first_name, m.last_name, withdrawal_date 
FROM members m 
	LEFT JOIN withdrawals w 
		ON w.member_id = m.member_id 
WHERE w.withdrawal_date IS NULL
;

-- 8
SELECT m.first_name, m.last_name, withdrawal_date 
FROM withdrawals w  
	RIGHT JOIN members m 
		ON m.member_id = w.member_id 
WHERE w.withdrawal_date IS NULL
;

-- 9
SELECT *
FROM books, authors a 
;

-- 10
SELECT m.first_name, m.last_name 
FROM members m 
	JOIN members m2 
		ON m.first_name = m2.first_name 
		AND m.member_id <> m2.member_id 
	WHERE m.first_name = m2. first_name 
	ORDER BY first_name  DESC 
;



