--I CREATED THE TABLE FOR BOOKS
CREATE TABLE books(
book_id	INT,
title	VARCHAR(100),
author	VARCHAR(100),
genre	VARCHAR(100),
published_year	INT,
price	NUMERIC(10,2),
stock	INT
)

--TABLE CREATED FOR CUSTOMERS
CREATE TABLE customers(
customer_id	INT,
name	VARCHAR(100),
email	VARCHAR(100),
phone	INT,
city	VARCHAR(50),
country	VARCHAR(100)
)

--TABLE CREATED FOR ORDERS
CREATE TABLE orders(
order_id	INT,
customer_id	INT,
book_id	INT,
order_date	DATE,
quantity	INT,
total_amount	NUMERIC(10,2)
)



						--BASIC--
--THESE ARE THE JUST BASIC QUERIES 
-- RETRIVE ALL THE BOOKS IN FRICTION GENRE
SELECT * FROM books
WHERE genre='Fiction'

--FIND BOOKS PUBLISHED IN YEAR 1950
SELECT * FROM books
WHERE published_year>=1950

--LIST ALL CUSTOMERS FROM CANADA
SELECT FROM customers
WHERE country ='Canada'

--SHOW ORDERS PLACED IN NOVEMBER 2023
SELECT * FROM orders
WHERE order_date BETWEEN '2023-11-01' AND '2023-11-30'

--RETRIVE THE TOTAL STOCK OF BOOKS
SELECT SUM(stock) AS total_stock FROM books

--FIND THE DETAIL OF MOST EXPENSIVE BOOK
SELECT * FROM books
ORDER BY price DESC
LIMIT 5

--SHOW ALL THE CUSTOMERS WHO ORDERED THE QUANTITY OF BOOKS MORE THAN 1.
SELECT * FROM orders
WHERE quantity > 1;

--RETRIVE ALL ORDERS WHERE TOATAL AMOUNT EXCEED 20$
SELECT * FROM orders 
WHERE total_amount>20

--LIST ALL THE GENRES AVIALABLE IN BOOKS
SELECT DISTINCT(genre) 
FROM books

--FIND THE BOOK WITH THE LOWEST STOCK
SELECT * FROM books
ORDER BY stock
LIMIT 10;

                         ---INTERMEDIATE---
-- FROM HERE THE QUERIES BECOME A BIT COMPLEX SO I WOULD CALL THEM INTERMEDIATE LEVEL
--CALCULATE THE TOTAL REVENUE GENRATED BY ALL THE ORDERS
SELECT SUM(total_amount) AS total_revenue_genrated 
FROM orders

--RETRIVE THE TOTAL NUMBER OF BOOKS SOLD FOR EACH GENRE:
SELECT SUM(o.quantity) AS total_quantity_sold,b.genre FROM orders o
JOIN books b
ON b.book_id=o.book_id
GROUP BY b.genre

--Find the Average Price of The books in 'FANTANSY' genre:
SELECT genre, AVG(price) FROM books
WHERE genre ='Fantasy'
GROUP BY genre

---LIST CUSTOMERS WHO HAVE PLACED AT LEAST 2 ORDERS;
SELECT c.name,c.email,c.phone,c.city,c.country, COUNT(o.order_id) FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.name,c.email,c.phone,c.city,c.country
HAVING COUNT(o.order_id) >=2

-- FIND THE MOST FREQUENTLY ORDERED BOOK.
SELECT book_id, COUNT(book_id) FROM orders
GROUP BY book_id 
ORDER BY COUNT(book_id) DESC
LIMIT 1;

-- SHOW THE TOP 3 MOST EXPENSIVE BOOKS OF 'FANSTASY' GENRE:
SELECT * FROM books 
WHERE genre='Fantasy'
ORDER BY price DESC
LIMIT 3;

--RETRIVE THE TOTAL QUANTITY OF BOOKS SOLD BY EACH AUTHOR
SELECT b.author, SUM(o.quantity) AS total_quantity FROM books b
JOIN orders o
ON b.book_id=o.book_id
GROUP BY b.author
ORDER BY total_quantity DESC

--LIST THE CITIES WHERE CUSTOMERS  SPENT OVER 30$ ARE LOCATED:
SELECT c.country, SUM(o.total_amount) AS total_spent FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
GROUP BY c.country
HAVING SUM(o.total_amount) >=30
ORDER BY total_spent 

-- FIND THE CUSTOMERS WHO SPENT MOST ON THE ORDERS 
SELECT c.name,c.city,o.total_amount FROM customers c
JOIN orders o
ON c.customer_id=o.customer_id
ORDER BY o.total_amount DESC
LIMIT 10;



SELECT * FROM books
SELECT * FROM customers
SELECT * FROM orders




