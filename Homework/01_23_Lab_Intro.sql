# 1. Review the tables in the database.
# 2. Explore tables by selecting all columns from customer. 
SELECT * from customer;

# 3. Select one column from a table. Get film titles.
SELECT Title from sakila.film;

# 4.1 Select one column from a table and alias it.
SELECT email as e_mail
	from sakila.customer;

# 4.2 Get unique list of film languages under the alias language.
SELECT name as name_of_language
	from sakila.language;

# 5.1 Find out how many stores does the company have?
SELECT count(store_id) from sakila.store;

# 5.2 Find out how many employees staff does the company have?
SELECT count(staff_id) from sakila.staff;

# 5.3 Return a list of employee first names only?
SELECT first_name from sakila.staff;
