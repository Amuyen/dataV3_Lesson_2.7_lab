-- How many films are there for each of the categories in the category table. Use appropriate join to write this query.

select c.name as Category, count(*) as 'Film Catalog' from film f
join film_category fc
on f.film_id=fc.film_id
join category c
on fc.category_id=c.category_id
group by c.category_id;

-- Display the total amount rung up by each staff member in August of 2005.
select s.first_name, s.last_name, sum(p.amount) as Total from staff s
join payment p
on s.staff_id=p.staff_id
where month(p.payment_date)=8 and year(p.payment_date)=2005
group by s.first_name, s.last_name;

-- Which actor has appeared in the most films?

select a.First_name, a.last_name, count(fa.film_id) as Films from actor a
join film_actor fa
on a.actor_id=fa.actor_id
group by a.actor_id
order by Films desc
limit 1;

-- Most active customer (the customer that has rented the most number of films)
select c.First_name, c.last_name, count(r.rental_id) as Rentals from customer c
join rental r
on c.customer_id=r.customer_id
group by c.customer_id
order by Rentals desc
limit 1;


-- Display the first and last names, as well as the address, of each staff member.

select s.first_name, s.last_name, a.address from staff s
join address a on s.address_id=a.address_id;

-- List each film and the number of actors who are listed for that film.

select f.title, count(a.actor_id) as Actors from film f
join film_actor fa
on f.film_id=fa.film_id
join actor a
on fa.actor_id=a.actor_id
group by f.title
order by Actors desc;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.

select c.last_name, c.first_name, sum(p.amount) as Total from customer c
join payment p
on c.customer_id=p.customer_id
group by c.customer_id
order by c.last_name;


-- List number of films per category.

select c.name as Category, count(f.film_id) as films from film f
join film_category fc
on f.film_id=fc.film_id
join category c
on fc.category_id=c.category_id
group by Category
order by category asc;
