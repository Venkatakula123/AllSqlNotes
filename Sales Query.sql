create database linkedin;

create database Talend;

use  linkedin;

use Talend;

show databases;

create table entries ( 
name varchar(20),
address varchar(20),
email varchar(20),
floor int,
resources varchar(10));

show tables;

select * from entries;

insert into entries 
values ('A','Bangalore','A@gmail.com',1,'CPU'),('A','Bangalore','A1@gmail.com',1,'CPU'),('A','Bangalore','A2@gmail.com',2,'DESKTOP')
,('B','Bangalore','B@gmail.com',2,'DESKTOP'),('B','Bangalore','B1@gmail.com',2,'DESKTOP'),('B','Bangalore','B2@gmail.com',1,'MONITOR');

select * from emp_tab;

truncate table emp_tab;

select * from em_tab;

CREATE TABLE sales (
 month VARCHAR(50), 
 ytd_sales INT
);

INSERT INTO sales VALUES 
('jan', 15), 
('feb', 22), 
('mar', 35), 
('apr', 45), 
('may', 60);

select * from sales;

select *, LAG(ytd_sales,1,0) over(order by month(cast(concat(month,'1 2023') as DATE))) p_sales FRom sales;

select *,ytd_sales-LAG(ytd_sales,1,0) over(order by month(cast(concat(month,'1 2023') as DATE))) p_sales  from sales;

Select *, ytd_sales - LAG(ytd_sales,1,0) over(order by ytd_sales) from sales;

select concat(month,'1 2023') as Dating from sales;

select month(cast(concat(ytd_sales,'1 2023') as DATE)) from sales; 

select sysdate();

select year(sysdate());

select DAY(SYSDATE());







