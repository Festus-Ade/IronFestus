-- Query 1
-- Which actor has appeared in the most films? --
use sakila;

SELECT AC.first_name, AC.last_name, COUNT(film_id) AS count
FROM Actor AS AC
INNER JOIN Film_Actor AS FA ON AC.actor_id = FA.actor_id
GROUP BY AC.actor_id
ORDER BY count DESC
LIMIT 1;

-- Query 2
-- Most active customer(the customer that has rented the most number of films)

SELECT CU.first_name, CU.last_name, COUNT(RE.customer_id)
FROM customer AS CU
INNER JOIN rental AS RE ON CU.customer_id = RE.customer_id
GROUP BY CU.customer_id
ORDER BY COUNT(RE.customer_id) DESC
LIMIT 1;

-- Query 3
-- List number of films per category.
 
SELECT category.name, COUNT(category.name) AS category_count
FROM category
JOIN film_category ON category.category_id = film_category.category_id
GROUP BY category.category_id
ORDER BY category.name;

-- Query 4
-- Display the first and last names, as well as the address, of each staff member.

SELECT ST.First_name, ST.Last_name, AD.ADDRESS
FROM STAFF AS ST
INNER JOIN ADDRESS AS AD ON ST.Address_ID = AD.Address_ID;

-- Query 5
-- get films titles where the film language is either English or italian, and whose titles starts with letter "M" , sorted by title descending.
SELECT title, NAME FROM film
INNER JOIN language
USING (language_id)
WHERE language.name = ("English" OR "Italian") AND film.title LIKE 'M%'
ORDER BY title DESC;

-- Query 6
-- Display the total amount rung up by each staff member in August of 2005.

SELECT CONCAT(s.first_name, ' ', s.last_name) AS full_name, SUM(p.amount) 
FROM staff AS s
INNER JOIN payment AS p ON s.staff_id = p.staff_id
WHERE p.payment_date LIKE '2005-08%'
GROUP BY full_name;

-- Query 7
-- List each film and the number of actors who are listed for that film.
SELECT f.title, COUNT(fa.actor_id) 
FROM film as f
LEFT JOIN film_actor fa ON f.film_id = fa.film_id
GROUP BY f.title
ORDER BY COUNT(fa.actor_id) DESC;

-- Query 8
-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.



SELECT c.first_name, c.last_name, SUM(p.amount)
FROM customer c
INNER JOIN payment p ON c.customer_id = p.customer_id
GROUP BY c.customer_id
ORDER BY c.last_name;

-- Query 9
-- Write sql statement to check if you can find any actor who never particiapted in any film.

-- Query 10
-- get the addresses that have NO customers, and ends with the letter "e"
SELECT a.address 
FROM address a
LEFT JOIN customer c ON a.address_id = c.address_id
WHERE c.customer_id IS NULL AND a.address LIKE '%e';