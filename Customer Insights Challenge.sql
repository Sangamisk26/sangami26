select * from customers;
select * from orders;
select * from baskets;
select * from products;
select * from country;
----------------------------
/*what are the names of all the countries in the Country table?*/
select country_name 
from country;
---------------------------------------
/*What is the total number of customers in the customer table?*/
select count(customer_id) as Num_of_customers
from customers;
-------------------------------------------------
/*What is the average age of Customers who can recieve marketing e-mails?*/
select can_email, avg(age) 
from customers
where can_email = "yes";
------------------------------------------------
/*How many orders were made my Customers aged 30 or older?*/
Select c.customer_id, c.age, count(o.order_id) as tot_orders
from customers c
join orders o on c.customer_id = o.customer_id
where c.age >= 30
Group by c.customer_id;
------------------------------------------------------------------
/*What is the total revenue generated by each product Category?*/
select p.category, SUM(p.price) as total_revenue_generated
from products p 
join baskets b on p.product_id = b.product_id
GROUP BY p.category; 
------------------------------------------------------------------
/*What is the average price of Products in the food category?*/
select category, avg(price) as avg_price 
from products p
where category = "food";
------------------------------------------------------------------
/*How many Orders were made in each sales channel in the orders table?*/
Select sales_channel, count(*) as tot_num_of_orders
from orders 
group by sales_channel;
-----------------------------------------------------------------
/*what is the date of the latest Order made by a customer who can recieve marketing e-mails?*/
select c.customer_id, o.date_shop, c.can_email
from customers c 
join orders o on c.customer_id = o.customer_id
where can_email = "yes"
Order by date_shop desc
Limit 1;
----------------------------------------------------------------
/*What is the name of the Country with the highest number of Orders?*/
Select co.country_name, count(co.country_id) as highest_num_of_orders
from country co 
join orders o on co.country_id = o.country_id
Group by co.country_name
order by count(co.country_id) desc
Limit 1;
-------------------------------------------------------------------------------- 
/*What is the average age of Customers who made orders in the Vitamins Product Category?*/
select pr.category, round(avg(c.age),2) as avg_age
from products pr
join baskets using(product_id) 
join orders using(order_id)
join customers c using(customer_id)
where pr.category = "vitamins"; 