/*Instructions
In the table actor, which are the actors whose last names are not repeated? 
For example if you would sort the data in the table actor by last_name, you would see that there is Christian Arkoyd, Kirsten Arkoyd, and Debbie Arkoyd. These three actors have the same last name. So we do not want to include this last name in our output. Last name "Astaire" is present only one time with actor "Angelina Astaire", hence we would want this in our output list.
Which last names appear more than once? We would use the same logic as in the previous question but this time we want to include the last names of the actors where the last name was present more than once
Using the rental table, find out how many rentals were processed by each employee.
Using the film table, find out how many films were released each year.
Using the film table, find out for each rating how many films were there.
What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
Which kind of movies (rating) have a mean duration of more than two hours?
Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.*/
use Sakila;
-- 1) In the table actor, which are the actors whose last names are not repeated? 
select * from actor;
select *, count(first_name) as cnt from actor
group by last_name
HAVING cnt = 1;

-- 2) Which last names appear more than once? 
select *, count(first_name) as cnt from actor
group by last_name
HAVING cnt > 1;

-- 3) Using the rental table, find out how many rentals were processed by each employee
select * from rental;
select staff_id, count(rental_id) as 'number_of rentals processed' from rental
group by staff_id;

-- 4) Using the film table, find out how many films were released each year.
select * from film;
select release_year, count(release_year) from film
group by release_year
order by release_year asc;

-- 5) Using the film table, find out for each rating how many films were there.
select * from film;
select rating, count(rating) as 'number of films in each rating category' from film
group by rating;

-- 6) What is the mean length of the film for each rating type. Round off the average lengths to two decimal places
select * from film;
select rating, round (avg(length),2) as 'Average movie run time (minutes)' from film
group by rating 
order by avg(length) asc;

-- 7) Which kind of movies (rating) have a mean duration of more than two hours?
select * from film;
select rating, round (avg(length),2) as 'Average movie run time (minutes)' from film
group by rating 
having avg(length)>120
order by avg(length) asc;

-- 8) Rank films by length (filter out the rows that have nulls or 0s in length column). 
-- In your output, only select the columns title, length, and the rank.
select * from film;

select title, length,Rank() Over (order by length) as runtime_rank from film
WHERE (length IS NOT NULL) AND (length <> '  ')
group by length;






