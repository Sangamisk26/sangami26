Select * from cars;
select * from salespersons;
select * from sales;

select c.car_id, c.make, c.type, c.style, c.cost_$, s.purchase_date
from cars c 
join sales s on c.car_id = s.car_id 
where year(s.purchase_date) = "2022";

select sp.salesman_id, sp.name, count(s.car_id) as tot_no_of_cars
from salespersons sp 
join sales s on sp.salesman_id = s.salesman_id 
group by sp.salesman_id;  

select sp.salesman_id, sp.name, sum(c.cost_$) as Revenue_generated 
from salespersons sp
Inner Join sales s on sp.salesman_id = s.salesman_id
Inner join cars c on s.car_id = c.car_id 
group by sp.salesman_id;

select sp.salesman_id, sp.name, c.car_id, c.make, c.type, c.style, c.cost_$ 
from salespersons sp
Inner join sales s on sp.salesman_id = s.salesman_id 
Inner join cars c on s.car_id = c.car_id;

select c.type, sum(c.cost_$) as Revenue_gen_by_type 
from cars c
join sales s on c.car_id = s.car_id 
group by s.car_id; 

select sp.salesman_id, sp.name, c.car_id, c.make, c.type, c.style, c.cost_$, s.purchase_date 
from salespersons sp 
join sales s on sp.salesman_id = s.salesman_id 
join cars c on s.car_id = c.car_id
where sp.name = "Emily wong" and year(s.purchase_date) = "2021";

select c.style, sum(c.cost_$) as Revenue_generated 
from cars c 
join sales s on c.car_id = s.car_id 
Group By s.car_id
Having c.style = "Hatchback";  

select c.style, sum(c.cost_$) as Revenue_generated 
from cars c 
join sales s on s.car_id = c.car_id
where c.style = "SUV" and year(s.purchase_date) = "2022" 
group by c.style; 
 
select sp.name, sp.city, count(s.car_id) as most_num_of_cars_sold 
from salespersons sp 
join sales s on sp.salesman_id = s.salesman_id
where year(s.purchase_date) = "2023" 
group by sp.name, sp.city
order by count(s.car_id) desc
Limit 1;
 
select sp.name, sp.age, sum(c.cost_$) as Highest_Revenue_Generated 
from salespersons sp
Join sales s on sp.salesman_id = s.salesman_id join
cars c on s.car_id = c.car_id
where year(s.purchase_date) = "2022"
Group by sp.name, sp.age
Order by sum(c.cost_$) desc
Limit 1;