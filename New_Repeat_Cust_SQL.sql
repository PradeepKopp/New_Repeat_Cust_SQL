create table customer_orders (
order_id integer,
customer_id integer,
order_date date,
order_amount integer
);

insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)



---Display the NewCustomers and Repeat_customers for each day 

select * from customer_orders

with cte as (
select  customer_id, MIN(order_date) as fst_day
from customer_orders
group by customer_id)

select co.order_date,  SUM(case when order_date= fst_day then 1 else 0 end ) as new_customer,
SUM(case when order_date !=fst_day then 1 else 0 end) as repeat_cust
from customer_orders co inner join cte 
on co.customer_id= cte.customer_id
group by  order_date 