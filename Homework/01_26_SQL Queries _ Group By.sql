create database Ironhack; 
use Ironhack;

create table students (student_id int not null auto_increment, 
First_name VarChar(45),
Last_name VarChar(45),
Py_Score INT,
Pet VarChar(45),
primary key (student_ID));

select * from students; 
Insert into student (First_name, Last_name, Py_Score, Pet)
 Value ('Ahmet', 'Yurdakul', '95','Boar');
 
 use bank;
 create temporary table bank.loan_and_account
 select l.loan_id, l.account_id, a.district_id, l.amount, l.payments, a.frequency 
 from bank.loan l
 join bank.account a 
 on l.account_id =a.account_id;
 
SELECT 
    *
FROM
    bank.loan_and_account;
    
# 1. what last names are not repeated?
use sakila;
select last_name from actor
	group by last_name
		having count(last_name) =1
        order by last_name;
        
# 2. Which last names appear more than once?
select last_name from actor
	group by last_name
		having count(last_name) > 1
        order by last_name;
        
# 3.Using the rental table, find out how many rentals were processed by each employee.
select count(rental_id), staff_id from rental
	group by staff_id
		order by staff_id;
        
# 4. Using the film table, find out how many films there are of each rating.
select count(film_id), rating from film
	group by rating
    order by rating;
    
#5. What is the mean length of the film for each rating type. Round off the average lengths to two decimal places.
select rating, round(avg(length),2) from film
	group by rating
    order by rating;
    
# 6. Which kind of movies (rating) have a mean duration of more than two hours?
select rating, round(avg(length),2) from film
group by rating
   having round(avg(length),2)>120 
    order by rating;
	


 
        

  