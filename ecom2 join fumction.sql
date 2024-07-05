select order_id, customer_id, product_id, sales from sales

select product_id, category from product

select customer_id, customer_name, city from customer

	--having, group by , order by, limit, sum, average join


select  sum(s.sales),avg(s.quantity), p.product_name, p.category from sales as s
inner join product as p
on s.product_id = p.product_id
group by p.product_name, p.category
having sum(s.sales) > 1000
order by product_name desc
limit 100 offset 10

-- left join--

select sum(s.sales),avg(s.quantity),s.order_id, s.customer_id, s.product_id, c.customer_name, c.city from sales as s
left join customer as c
on s.customer_id = c.customer_id
group by s.order_id, s.customer_id, s.product_id, c.customer_name, c.city
having sum(s.sales) > 850
order by product_id
limit 80 offset 50

--right join--

select customer_id, product_id,sales, from sales

select customer_id, customer_name, state from customer

select s.customer_id, s.product_id, sum(s.sales),avg(quantity),c.customer_name, c.state from sales as s
right join customer as c 
on s.customer_id = c.customer_id
group by c.customer_name, c.state, s.customer_id, s.product_id
having avg(quantity) > 5
order by customer_id desc
limit 100 offset 0

--full join--

select order_line,customer_id,product_id,sales from sales

select customer_name,country, city from customer

select s.order_line,s.customer_id, s.product_id, sum(s.sales),avg(quantity), c.customer_name, c.country, c.city  from sales as s
full join customer as c
on s.customer_id = c.customer_id
group by s.order_line,s.customer_id, s.product_id, c.customer_name, c.country, c.city 
having avg(quantity) > 10
order by customer_id
limit 50 offset 10

