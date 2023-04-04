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

SELECT CU.first_name, CU.last_name, COUNT(RE.inventory_id)
FROM customer AS CU
INNER JOIN rental AS RE ON CU.customer_id = RE.customer_id
GROUP BY CU.customer_id
ORDER BY COUNT(RE.inventory_id) DESC
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
SELECT title FROM film
INNER JOIN language
USING (language_id)
WHERE language.name = ("English" OR "Italian") AND film.title LIKE 'M%'
ORDER BY title DESC;

-- Query 6
-- Display the total amount rung up by each staff member in August of 2005.

SELECT sum(P.amount)
FROM PAYMENT AS P
INNER JOIN STAFF AS S ON S.staff_id = p.staff_id
WHERE sum(p.amount) = S.Staff_id
GROUP BY S.staff_id

