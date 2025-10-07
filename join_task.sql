select * from customer

select * from sales

select * from product 

-- inner join ex --

select from sales as s
inner join product as p
on s.product_id = p.product_id 
where category= 'Technology' and qty>5;

--subquery ex--

select * from sales where product_id in 
(select product_id from product where category='Technology')and qty=3;


--left--

select * from sales as s
left join product as p 
on s.product_id = p.product_id
where category = 'office supplies' and discount <0.1;

select * from sales 
where product_id in 
(select product_id from product where category='office supplies')and discount <0.1;

--right--

select * from sales as s
right join product as p
on s.product_id = p.product_id
order by sales desc
limit 100;


select * from sales 
where product_id in (
  select product_id from product
)
order by sales desc
limit 100;

--full--

select * from sales as s
full join product as p
on s.product_id = p.product_id
where category = 'Furniture' and profit < 3;

select * from sales 
where product_id in (
  select product_id from product where category = 'Furniture'
) and profit < 0;


--sales and customer table join--

select * from sales as s
inner join customer as c
on s.cust_id = c.cust_id
where state = 'Illinois'
order by id;

--subquery--

select * from sales 
where cust_id in (
  select cust_id from customer where state = 'Illinois'
);

select * from sales as s
left join customer as c
on s.cust_id = c.cust_id
where state = 'Ohio' and profit < 200
order by id;

--subquery---

select * from sales 
where cust_id in (
  select cust_id from customer where state = 'Ohio'
) and profit < 200
order by id;


select * from sales as s
right join customer as c
on s.cust_id = c.cust_id
where state = 'Arizona' and sales > 1500
order by id;

--subquery--
select * from sales 
where cust_id in (
  select cust_id from customer where state = 'Arizona'
) and sales > 1500
order by id;


select * from sales as s
full join   customer as c
on s.cust_id = c.cust_id
where state= 'Washington' and profit >300
order by id;

--subquery--

select * from sales where cust_id in
(select cust_id from customer where state='Washington') and
profit >300 order by id;

select * from sales

---agregate function join--


select category, sum(sales) from sales as s
inner join product as p
on s.product_id = p.product_id
group by category
order by sum(sales) desc;

--subquery--
select category, sum(sales) from sales
join (select product_id, category from product) as p
on sales.product_id = p.product_id
group by category
order by sum(sales) desc;


select avg(discount) from sales as s
inner join customer as c
on s.cust_id = c.cust_id
group by state
order by avg(discount) desc;

--subquery--

select avg(discount) from sales
join (select cust_id, state from customer) as c
on sales.cust_id = c.cust_id
group by state
order by avg(discount) desc;