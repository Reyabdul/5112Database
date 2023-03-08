-- 1 
SELECT invoiceid, billingState
FROM invoice
WHERE invoiceid >= 400
ORDER BY invoiceid DESC
;

-- 2
SELECT *
FROM employee
ORDER BY Birthdate 
LIMIT 6 OFFSET 2
;

-- 3
SELECT DISTINCT LOWER(city) AS City
FROM customer
;

-- 4
SELECT firstname, lastname, SUBSTR(lastname, 3, 1) 
AS 'Third letter in Lastname'
FROM customer
WHERE firstname 
OR lastname 
LIKE '%t%' 
OR '%T%'
;

-- 5
SELECT REPLACE(name, 'ö', ':)') 
AS 'New Name :)'
FROM artist
WHERE name 
LIKE '%ö%' 
;

-- 6 
SELECT *, COALESCE(state,' ') 
AS 'State', COALESCE(fax,' ') 
AS 'Fax'
FROM customer
;

-- 7
SELECT LOWER(SUBSTR(title, 1, 20)) 
AS 'Title'
FROM album
WHERE LENGTH(title) > 20
;

-- 8
SELECT * 
FROM invoice
WHERE (billingcity = 'Toronto') 
OR (billingcity = 'Berlin')
AND total > 5
ORDER BY invoicedate DESC
;


Feedback for student
1/23/23, 12:18 PM
Terrific work!

Regarding Q1: It seems like you forgot to add the clause 'billingstate IS NOT NULL'

Regarding Q4: Note that you have to specify one column per clause. 

Re Q8: Your query selects all the invoices from Toronto, regardless of the value in the total column. You need to use parentheses to group clauses by putting one set of parentheses around both clauses (not one set for each clause). Don't forget to check that the results match the question you're trying to answer.

¾ Q1

☑ Q2

☑ Q3

½ Q4

☑ Q5

☑ Q6

☑ Q7

½ Q8