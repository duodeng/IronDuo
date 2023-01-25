use sakila;
select first_name, last_name, actor_id from actor
where actor_id in (select actor_id from film_actor
					where film_id = (select film_id from film where title = 'Academy Dinosaur' ));
    
# 1. List all films whose length is longer than the average of all the films.
select title, length from film
where length > 
	(select avg(length) from film);
    
# 2. How many copies of the film Hunchback Impossible exist in the inventory system?
select count(inventory_id) from inventory
    where film_id in  (select film_id from film 
		where title  = upper('Hunchback Impossible'));
    
# 3. Use subqueries to display all actors who appear in the film Alone Trip.
select concat(first_name, ' ', last_name) from actor 
	where actor_id in (select actor_id from film_actor 
		where film_id = (select film_id from film
			where title = upper('Alone Trip'))); 
    
# 4. Sales have been lagging among young families, and you wish to target all family movies for a promotion. 
# Identify all movies categorized as family films.
select title from film
	where film_id in (select film_id from film_category
		where category_id in (select category_id from category 
			where name ='Family'
				group by name
					 order by name));
                     
# 5. Get name and email from customers from Canada using subqueries.
select concat(first_name, ' ', last_name) as name, email from customer 
	where address_id in (select address_id from address
		where city_id in (select city_id from city
			where country_id in (select country_id from country
				where country = 'Canada')));
     
select concat(first_name, ' ', last_name) as name, email from customer 
join address
	using(address_id)
join city
	using(city_id)
join country
	using(country_id)
where country = 'Canada';

# Optional
# 6. Which are films starred by the most prolific actor?
select title from film
	where film_id  in (select film_id from film_actor
		where actor_id = (select actor_id from film_actor 
			group by actor_id
			order by count(film_id) DESC 
            limit 1));

# 7. Films rented by most profitable customer.
select title from film
	where film_id in (select film_id from inventory 
		where inventory_id in (select inventory_id from rental 
			where customer_id = (select customer_id from payment
				group by customer_id
					order by sum(payment.amount) DESC
						limit 1)
                        ));
                        
# 8.Customers who spent more than the average payments(this refers to the average of all amount spent per each customer).
select concat(first_name, ' ', last_name) as name from customer 
	where customer_id in (select customer_id from payment
			group by customer_id 
				having sum(amount) > (select avg(total_amount) from 
					(select sum(amount) as total_amount from payment
						group by customer_id) as amount_by_customer
                        )) 
                        order by name;
                        

	
                        
						
			