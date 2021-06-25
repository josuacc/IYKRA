--SQL Practice Case
--Josua Muliawan

--Q1 How many movie with astronauts theme?
select count(*) from film
where description like '%Astronaut%'

--Q2 How many film with R Rating and 5<replacement cost<15 
select count(*) from film 
where rating='R' and (replacement_cost >5 and replacement_cost<15)

--Q3 How many payment handled and the total amount processed
select staff_id,  count(staff_id) as total_pamyment,sum(amount) as total_amt_processed
from payment 		
group by staff_id 

--Q4 Average replacement cost by rating
select rating, avg(replacement_cost) from film 
group by rating

--Q5 Top 5 Spenders (with name, email, and amount spent)
select concat(c.first_name,' ', c.last_name) as name, c.email,sum(p.amount) as total_pay
from
	customer c
	inner join payment p 
		on c.customer_id=p.customer_id
group by c.customer_id 
order by total_pay desc limit 5 

--Q6 How many copies of movies in each store
select store_id,film_id,count(film_id)
from inventory 
group by store_id , film_id 
order  by store_id,film_id 


--Q7 Customer with at least 40 transaction payment (with name, email)
select concat(c.first_name,' ', c.last_name) as name, c.email, count(p.amount) 
from
	customer c
	inner join payment p 
		on c.customer_id=p.customer_id	
group by c.customer_id 
having count(p.amount)>=40 




