use sakila;

-- Query 1
-- List all films whose length is longer than the average of all the films.
select title 
from film
where length > (select avg(length)
				from film);
                

-- Query 2
-- How many copies of the film Hunchback Impossible exist in the inventory system?

select count(inventory_id)
from inventory
where film_id in (select film_id
						from film
                        where title = 'Hunchback Impossible');
                        
-- Query 3
-- Use subqueries to display all actors who appear in the film Alone Trip.

select first_name, last_name
from actor
where actor_id in (select actor_id
					from film_actor
					where film_id = (select film_id
									from film
									where title = "Alone Trip"));
                    
-- Query 4
-- Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
-- Identify all movies categorized as family films.

SELECT 
    title
FROM
    film
WHERE
    film_id IN (SELECT 
            film_id
        FROM
            film_category
        WHERE
            category_id = (SELECT 
                    category_id
                FROM
                    category
                WHERE
                    name = 'family'));
                                        


-- Query 5
-- Get name and email from customers from Canada using subqueries. Do the same with joins. 
-- Note that to create a join, you will have to identify the correct tables with their primary keys and foreign keys, 
-- that will help you get the relevant information

select first_name, last_name, email
from customer
where address_id in (select address_id
						from address
                        where city_id in (select city_id
										from city
                                        where country_id in (select country_id
															from country
															where country = "canada")));
                                                            
-- OPTIONAL
-- Query 6
-- Which are films starred by the most prolific actor? Most prolific actor is defined as the actor that has acted in the most number of films. 
-- First you will have to find the most prolific actor and then use that actor_id to find the different films that he/she starred.
SELECT title FROM film
WHERE film_id in (SELECT film_id FROM film_actor
					WHERE actor_id = (SELECT actor_id FROM film_actor
										GROUP BY actor_id
										ORDER BY COUNT(actor_id) DESC 
                                        LIMIT 1));
                                        
-- Second way
SELECT actor_id 
 FROM film_actor
 GROUP BY actor_id
ORDER BY COUNT(actor_id) DESC 
LIMIT 1;
                                        
 SELECT title FROM film
WHERE film_id in (SELECT film_id FROM film_actor
					WHERE actor_id = 107);
                
                
-- Query 7
-- Films rented by most profitable customer. You can use the customer table and 
-- payment table to find the most profitable customer ie the customer that has made the 
-- largest sum of payments

select film
from film
where film_id in (SELECT film_id
from iventory
where inventory_id in (SELECT inventory_id FROM rental
					WHERE customer_id = (SELECT customer_id FROM payment
										GROUP BY customer_id
										ORDER BY sum(payment.amount) DESC 
                                        LIMIT 1));
                                        

                                        
-- Querry 8
-- Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).

SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
                    SELECT customer_id
                    FROM payment
                    GROUP BY customer_id
                    HAVING sum(amount) > (SELECT AVG(total) FROM (SELECT sum(amount) AS total
                                                                    FROM payment 
                                                                    GROUP BY customer_id) AS total_customer))
ORDER BY first_name, last_name;