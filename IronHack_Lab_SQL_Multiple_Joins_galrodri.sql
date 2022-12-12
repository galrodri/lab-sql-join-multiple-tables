-- Question 1
select t1.store_id as Store_ID
, t3.city as City
, t4.country as Country
from sakila.store t1
	inner join sakila.address t2
		on t1.address_id = t2.address_id
    inner join sakila.city t3
		on t2.city_id = t3.city_id
    inner join sakila.country t4
		on t3.country_id = t4.country_id
    
-- Question 2
select t1.store_id as Store
	, sum(t2.amount) as total_amount
from sakila.customer t1
	inner join sakila.payment t2
		on t1.customer_id = t2.customer_id
group by 1

-- Question 3 and 4
select t3.name as category_name
	, avg(t1.length) as average_running_time
from sakila.film t1
	inner join sakila.film_category t2
		on t1.film_id = t2.film_id
	inner join sakila.category t3
        on t2.category_id = t3.category_id
group by 1
order by average_running_time desc

-- Question 5
select t1.title as Film_Title
	, count(distinct t3.rental_id) as rental_count
from sakila.film t1
	inner join sakila.inventory t2
		on t1.film_id = t2.film_id
	inner join sakila.rental t3
		on t2.inventory_id = t3.inventory_id
group by 1
order by rental_count desc;

-- Question 6
select name as category_name
	, sum(amount) as gross_revenue
from sakila.payment t1
	inner join sakila.rental t2
		on t1.rental_id = t2.rental_id
	inner join sakila.inventory t3
		on t2.inventory_id = t3.inventory_id
	inner join sakila.film_category t4
		on t3.film_id = t4.film_id
	inner join sakila.category t5
		on t4.category_id = t5.category_id
group by 1
order by gross_revenue desc
limit 5;

-- Question 7
select t3.title
	, count(distinct t1.inventory_id) as available_units
from sakila.inventory t1
	inner join sakila.store t2
		on t1.store_id = t2.store_id
	inner join sakila.film t3
		on t1.film_id = t3.film_id
where t3.title = 'Academy Dinosaur'
and t2.store_id = 1
group by 1;