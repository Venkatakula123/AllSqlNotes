show databases;

use talend;

show tables;

create table prod_details_1(p_id int(8),p_name varchar(30),p_type varchar(20),p_price int(6),c_date DATETIME,m_date DATETIME);

select * from prod_details_1;

select max(c_date) as created_date,max(m_date) as modified_date from prod_inc_1;

alter table prod_details add primary key (p_id);

select * from prod_details;

/*update prod_details set c_date = '2024-09-19';*/

create table etl_control(job_id int(8),job_name varchar(30),table_name varchar(20),last_success Date);

alter table etl_control modify column job_name varchar(50);

select * from etl_control;

insert into etl_control values(1,'J_IncrementalLoadDeltaLoadusingcontroltable','prod_details',CURDATE());

create table prod_inc_1 as select * from prod_details_1;

select * from prod_inc_1;	

insert into prod_inc_1 values(0,'dummy','dummy',0,'1900-01-01 00:00:00','1900-01-01 00:00:00');

truncate table  prod_inc_1;

c_date> 1900-01-01

2024-01-01 > 1900-01-01


/*INSERT INTO prod_details_1 (p_id, p_name, p_type, p_price, c_date, m_date) VALUES
(10000001, 'Laptop', 'Electronics', 75000, '2024-01-15', '2024-09-18'),
(10000002, 'Smartphone', 'Electronics', 50000, '2024-02-20', '2024-09-18'),
(10000003, 'Desk Chair', 'Furniture', 12000, '2024-03-10', '2024-09-18'),
(10000004, 'Coffee Maker', 'Appliances', 8000, '2024-04-05', '2024-09-18'),
(10000005, 'Headphones', 'Accessories', 3000, '2024-05-22', '2024-09-18');

INSERT INTO prod_details_1 (p_id, p_name, p_type, p_price, c_date, m_date) VALUES
(10000006, 'Blender', 'Appliances', 4500, '2024-06-15', '2024-09-18'),
(10000007, 'Bookshelf', 'Furniture', 7000, '2024-07-10', '2024-09-18'),
(10000008, 'Tablet', 'Electronics', 30000, '2024-08-05', '2024-09-18'),
(10000009, 'Gaming Console', 'Electronics', 40000, '2024-09-01', '2024-09-18'),
(10000010, 'Microwave Oven', 'Appliances', 15000, '2024-09-12', '2024-09-18');

INSERT INTO prod_details_1 (p_id, p_name, p_type, p_price, c_date, m_date) VALUES
(10000011, 'Refrigerator', 'Appliances', 25000, '2024-01-25', '2024-09-18'),
(10000012, 'Washing Machine', 'Appliances', 30000, '2024-02-15', '2024-09-18'),
(10000013, 'Air Conditioner', 'Appliances', 35000, '2024-03-05', '2024-09-18'),
(10000014, 'Television', 'Electronics', 45000, '2024-04-12', '2024-09-18'),
(10000015, 'Printer', 'Electronics', 10000, '2024-05-18', '2024-09-18'),
(10000016, 'Camera', 'Electronics', 55000, '2024-06-22', '2024-09-18'),
(10000017, 'Sofa', 'Furniture', 20000, '2024-07-15', '2024-09-18'),
(10000018, 'Dining Table', 'Furniture', 15000, '2024-08-10', '2024-09-18'),
(10000019, 'Wardrobe', 'Furniture', 18000, '2024-09-05', '2024-09-18'),
(10000020, 'Mixer Grinder', 'Appliances', 5000, '2024-01-10', '2024-09-18'),
(10000021, 'Water Purifier', 'Appliances', 12000, '2024-02-20', '2024-09-18'),
(10000022, 'Electric Kettle', 'Appliances', 3000, '2024-03-15', '2024-09-18'),
(10000023, 'Iron', 'Appliances', 2000, '2024-04-25', '2024-09-18'),
(10000024, 'Vacuum Cleaner', 'Appliances', 8000, '2024-05-30', '2024-09-18'),
(10000025, 'Fan', 'Appliances', 1500, '2024-06-10', '2024-09-18'),
(10000026, 'Heater', 'Appliances', 4000, '2024-07-20', '2024-09-18'),
(10000027, 'Router', 'Electronics', 2500, '2024-08-25', '2024-09-18'),
(10000028, 'Smartwatch', 'Electronics', 15000, '2024-09-10', '2024-09-18'),
(10000029, 'Bluetooth Speaker', 'Electronics', 5000, '2024-01-05', '2024-09-18'),
(10000030, 'Projector', 'Electronics', 20000, '2024-02-15', '2024-09-18');

INSERT INTO prod_details_1 (p_id, p_name, p_type, p_price, c_date, m_date) VALUES
(10000034, 'Smart Appliances', 'Electronics', 37000, '2024-09-19', CURDATE());

select * from prod_details_1 where m_date = CURDATE() ;

select * from prod_inc_1;

UPDATE prod_details_1
SET p_price = 35000, m_date = CURDATE()
WHERE p_id = 10000010;


*/

select CURDATE();

select sysdate(); 





