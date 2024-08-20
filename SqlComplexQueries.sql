select * from icc_world_cup;

select team_name, count(1) as no_of_matches_played, sum(win_flag) as no_of_matches_won, count(1) - sum(win_flag) as no_of_losses
from (
select team_1 as team_name, case when team_1=winner then 1 else 0 end as win_flag
from icc_world_cup
union all
select team_2 as team_name, case when team_2=winner then 1 else 0 end as win_flag
from icc_world_cup) A
group by team_name
order by no_of_matches_won desc;

create table customer_orders_1 (
order_id Number(2),
customer_id Number(3),
order_date date,
order_amount Number(5)
);
insert into customer_orders_1 values(1,100, '01-JAN-2022',2000);
insert into customer_orders_1 values(2,200, '01-JAN-2022',2500);
insert into customer_orders_1 values(3,300, '01-JAN-2022',2100);
insert into customer_orders_1 values(4,100, '02-JAN-2022',2000);
insert into customer_orders_1 values(5,400, '02-JAN-2022',2200);
insert into customer_orders_1 values(6,500, '02-JAN-2022',2700);
insert into customer_orders_1 values(7,100, '03-JAN-2022',3000);
insert into customer_orders_1 values(8,400, '03-JAN-2022',1000);
insert into customer_orders_1 values(9,600, '03-JAN-2022',3000);

with first_visit as (
select customer_id,min(order_date) as first_visit_date
from customer_orders_1
group by customer_id)
select co .* ,fv.first_visit_date from customer_orders_1 co
inner join first_visit fv on co.customer_id=fv.customer_id
Horder by order id;

create table entries ( 
name varchar2(20),
address varchar2(20),
email varchar2(20),
floor number(3),
resources varchar2(10));

insert into entries values ('A','Bangalore','A@gmail.com',1,'CPU');
insert into entries values ('A','Bangalore','A1@gmail.com',1,'CPU');
insert into entries values ('A','Bangalore','A2@gmail.com',2,'DESKTOP');
insert into entries values ('B','Bangalore','B@gmail.com',2,'DESKTOP');
insert into entries values ('B','Bangalore','B1@gmail.com',2,'DESKTOP');
insert into entries values ('B','Bangalore','B2@gmail.com',1,'MONITOR');