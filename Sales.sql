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

select * from pg_catalog.pg_tables where schemaname = 'public';

select * from sales;

Select *, ytd_sales - LAG(ytd_sales,1,0) over(order by ytd_sales) from sales;




