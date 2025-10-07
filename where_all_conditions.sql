select * from customer

select * from sales

select * from product

-- execute all type of where query --		

select * from sales where id< 20 and qty<=10;

select * from sales where ship_mode='Standard Class'

select order_id,order_date,ship_date from sales where id< 10 and qty<=3;

select * from sales where id between 30 and 40;

select * from sales where profit > 5000 or ship_mode='Standard Class';

select * from sales where profit < 3 and  qty='2';

select * from sales where order_date between '2013-01-01' and '2017-12-31' limit 10;

select * from sales where qty in(2,3);

select * from sales where qty not in(2,3);

select * from sales where  ship_mode NOT IN('Second Class','Standard Class');

select * from sales where id<30 and qty>5 order by id;

select * from sales where qty >3 order by id desc limit 20;