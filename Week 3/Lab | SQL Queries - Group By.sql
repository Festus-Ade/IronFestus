-- Query 1
-- In the table actor, what last names are not repeated? For example if you would sort the data in the table actor by last_name, 
-- you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. 
-- So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", 
-- hence we would want this in our output list.

use sakila;

SELECT last_name
FROM actor
GROUP BY last_name
HAVING count(last_name) = 1;

-- OR

SELECT distinct last_name
FROM actor
GROUP BY last_name
HAVING count(last_name) = 1;

-- Query 2
-- Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the 
-- last names of the actors where the last name was present more than once

SELECT last_name
FROM actor
GROUP BY last_name
HAVING count(last_name) > 1;

-- Query 3
-- Using the rental table, find out how many rentals were processed by each employee.

select * from rental;

select count(rental_id)
from rental
Group by staff_id;


-- Query 4
-- Using the film table, find out how many films there are of each rating.

select * from film;
select rating, count(film_id)
from film
Group by rating;


-- Query 5
-- What is the mean length of the film for each rating type. Round off the average lengths to two decimal places

select * from film;

SELECT rating, round(avg(length), 2)
from film
Group by rating;

-- Query 6
-- Which kind of movies (rating) have a mean duration of more than two hours?

select * from film;

SELECT rating
from film
GROUP BY rating
having sum(length)/count(film_id) > 120;

-- OR

SELECT rating
from film
Group by rating
HAVING avg(length) > 120;