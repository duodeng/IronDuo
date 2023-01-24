use sakila;
select * from sakila.language 
inner join sakila.film
on language.language_id = film.language_id; # language_id will be replicated 


select * from sakila.language 
inner join sakila.film
using(language_id);

# 1. Which actor has appeared in the most films?
select count(film_id), first_name,last_name from sakila.actor
	inner join sakila.film_actor
    using(actor_id)
    group by actor_id
    order by count(film_id) DESC
    limit 1;
    
#2. Most active customer
select count(customer_id), first_name,last_name from sakila.customer
	inner join sakila.rental
    using(customer_id)
    group by customer_id
    order by count(rental_id) DESC
    limit 1;
    
# 3. List number of films per category.
select name, count(category_id) from sakila.category
inner join sakila.film_category
using (category_id)
group by name
order by name;

# 4. Display the first and last names, as well as the address, of each staff member.
select first_name, last_name, address from sakila.staff
inner join sakila.address
using (address_id);

# 5. get films titles where the film language is either English or italian, and whose titles starts with letter "M";
select film.title, language.name from sakila.film
inner join sakila.language
using(language_id)
where (language.name = 'English' or language.name = 'Italian') and film.title like 'M%'
order by title desc;

# 6. Display the total amount rung up by each staff member in August of 2005.
select staff.first_name, staff.last_name, sum(payment.amount) from staff
inner join payment
using(staff_id)
where payment_date like '2005-08%' #为什么不能用between?
group by staff_id
order by sum(payment.amount) DESC;

# 7. List each film and the number of actors who are listed for that film.
select film.title, count(film_actor.actor_id) from sakila.film
inner join sakila.film_actor
using(film_id)
group by title
order by count(film_actor.actor_id) DESC;

# 8. 
select customer.first_name, customer.last_name, sum(payment.amount) from sakila.customer
inner join sakila.payment
using(customer_id)
group by customer_id
order by customer.last_name;

# 9. Write sql statement to check if you can find any actor who never particiapted in any film.
select actor_id, actor.first_name, actor.last_name from sakila.actor
left join sakila.film_actor
using(actor_id)
where actor_id =null;

# 10. get the addresses that have NO customers, and ends with the letter "e"
select address, customer.first_name, customer.last_name from sakila.address
left join sakila.customer
using(address_id)
where customer_id is null and address.address like '%e';

# optional
# 1. what is the most rented film?
select film.title,count(film_id)from film
join inventory 
using (film_id)
join rental 
using(inventory_id)
group by title
order by count(film_id) DESC
limit 1;




    


