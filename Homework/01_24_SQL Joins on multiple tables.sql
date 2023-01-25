# 1. Write a query to display for each store its store ID, city, and country.
select store_id, city, country from store
join address
	using (address_id)
join city 
	using(city_id)
join country
	using(country_id);

#2. Write a query to display how much business, in dollars, each store brought in(customer).
select store.store_id, sum(payment.amount) as Total_amount 
	from store
join staff
	using(store_id)
join payment 
	using(staff_id)
group by store.store_id 
order by sum(payment.amount);

# 3. What is the average running time(length) of films by category?
select category.name, avg(length) from category
join film_category
	using(category_id)
join film
	using(film_id)
group by category.name
order by category.name;

# 4. Which film categories are longest(length) (find Top 5)? (Hint: You can rely on question 3 output.)
select category.name, avg(length) from category
join film_category
using(category_id)
join film
using(film_id)
group by category.name
order by avg(length) DESC
limit 5;

# 5.Display the top 5 most frequently(number of times) rented movies in descending order.
select title, count(rental_date) from film
join inventory 
	using(film_id)
join rental
	using(inventory_id)
group by title
order by count(rental_date) DESC
limit 5;

# 6. List the top five genres in gross revenue in descending order.
select category.name, sum(payment.amount) from category
join film_category
	using(category_id)
join film
	using(film_id)
join inventory
	using(film_id)
join rental 
	using(inventory_id)
join payment
	using(rental_id)
group by category.category_id
order by sum(payment.amount) DESC
limit 5;

# 7. Is "Academy Dinosaur" available for rent from Store 1?
select film.title,count(inventory_id) from film
 join inventory
	using(film_id)
    group by film.title
    order by count(inventory_id);


    

