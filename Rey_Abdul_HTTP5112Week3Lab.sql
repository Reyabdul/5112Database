/*
LAB QUESTIONS;
1. Write a statement that shows all the thefts that happened in neighbourhoods that have 'Humber' in the name.
2. Narrow the list from question 1 down by only showing thefts in odd-numbered years.
3. Get the average cost of the bikes recorded in this table. Format this result as a dollar figure, including a dollar sign, rounded to the nearest penny.
4. Write a query that returns the number of unique combinations of bike colour & speed. Note: null is not a colour or a speed.
5. Write a statement that shows a list of location types with more than 500 total thefts.
6. Write a statement that returns the date of the first bike theft contained in this table. (Use an aggregate function for this.)
7. Write a statement that returns only the top 10 neighbourhoods with the most reported thefts.
8.Select 2 columns. The first column should be the sum of the 'Cost of Bike' column, divided by the total number of rows. The second column should be result of running the AVG() function on the 'Cost of Bike' column.
9. In a code comment, tell me if first column and the second column of the previous question are equal. If they are, explain why. If they are not, explain what you could do to make the result of the AVG() function match the value of the first column.

BONUS QUESTION:
10. Write a statement that returns the top 5 neighbourhoods in terms of thefts, and a column that shows how many incidents they had above the average neighbourhood. This may be a good case for a subquery.
*/

-- 1 
SELECT NeighbourhoodName 
FROM bikeTheft
WHERE NeighbourhoodName 
LIKE '%Humber%'
;

-- 2
SELECT NeighbourhoodName
FROM bikeTheft
WHERE NeighbourhoodName 
LIKE '%Humber%'
AND Occurrence_Year % 2
;

-- 3
SELECT CONCAT('$',ROUND(AVG(Cost_of_Bike), 2))
FROM bikeTheft
;

-- 4
SELECT COUNT(Bike_Speed) * COUNT(Bike_Colour) 
AS 'Unique Bike Combinations'
FROM bikeTheft
;

-- 5
SELECT Location_Type, COUNT(*)
FROM bikeTheft
GROUP BY Location_Type 
HAVING COUNT(*) > 500 
;

-- 6
SELECT MIN(Occurrence_Date)
FROM bikeTheft
;

-- 7
SELECT NeighbourhoodName, COUNT(*) AS 'Reported Thefts'
FROM bikeTheft
GROUP BY NeighbourhoodName 
ORDER BY COUNT(*) DESC
LIMIT 10
;

-- 8
SELECT ROUND(SUM(Cost_of_Bike)/COUNT(*), 2), ROUND(AVG(Cost_of_Bike), 2)
FROM bikeTheft
;

-- 9
/*
The numbers from both columns did not match up. I believe it may have to do with how SUM(cost_of_bikes) is divided. Since COUNT(*) will not include rows with NULL values, any row with NULL values but still has a value in ‘cost of bikes’ will be omitted. 

Rather than using COUNT(*), I would use COUNT(cost_of_bikes). So the query woud look like this:

SELECT ROUND(SUM(Cost_of_Bike) / COUNT(Cost_of_Bike), 2), ROUND(AVG(Cost_of_Bike), 2) 
FROM bikeTheft

*/

--BONUS QUESTION (I can't seem to get the average for the neighbourhoods)
-- 10
SELECT NeighbourhoodName, 
	COUNT(NeighbourhoodName), 
	(COUNT(NeighbourhoodName) - 
		(SELECT AVG(NeighbourhoodName) FROM bikeTheft)) 
		AS 'Thefts amount over neighbourhood AVG'
FROM bikeTheft
GROUP BY NeighbourhoodName
ORDER BY COUNT(NeighbourhoodName) DESC
LIMIT 5
;

/*
--Results
Amazing work!

A few issues with the first couple questions, I believe all due to issues parsing the questions themselves.

Q1: It's a little bit of a stretch to say you're showing "all the thefts" when you're just showing neighbourhood names.

Q2: Using modulo as you did here only works coincidentally. All statements we put in WHERE should evaluate to true or false. Your expression does not, it evaluates to the number one. Weirdly, in MySQL, instead of 'true' or 'false', the databases use 0 or 1 to represent 'true' or 'false'. I'll explain this a bit more in the lecture this coming week.

Q4: If there are fifty bikes that are blue, 18-speed bikes, that is only 1 combination of colour and speed. Your query would return the number 2500.

Your query actually returns the number 771,462,792, which is about 771,430,000 more than the number of bike thefts. The actual answer comes from combining COUNT and DISTINCT.
*/