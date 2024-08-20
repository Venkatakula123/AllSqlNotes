USe talend;

create table emp(empno int8(5),ename varchar(30),sal float(8,0), hiredate date,deptno int(2),dname varchar(30),loc varchar(30));

create table emp_scd1(empno int8(5),ename varchar(30),sal float(8,0), hiredate date,deptno int(2),dname varchar(30),loc varchar(30),created_dt DATE, Updated_dt Date);

create table emp_scd2(s_key int8(5) not null auto_increment,empno int8(5),ename varchar(30),sal float(8,0), hiredate date,deptno int(2),dname varchar(30),loc varchar(30),created_dt DATE, Updated_dt Date, flag varchar(20), primary key(s_key));

create table emp_scd3(empno int8(5),ename varchar(30),c_sal float(8,0),p_sal float(8,0), hiredate date,c_deptno int(2),p_deptno int(2),c_dname varchar(30),p_dname varchar(30),c_loc varchar(30),p_loc varchar(30),created_dt DATE, Updated_dt Date);

show tables;

describe emp;

describe emp_scd1;

alter table emp add primary key emp_a(empno);

insert into emp values(100,'Avr', 20000, '2017-01-01',10,'Manager','Chennai');

insert into emp values(102,'Cvr', 10000, '2019-02-01',20,'SE','Chennai');

insert into emp values(103,'Dvr', 10005, '2019-03-01',40,'SE','PUNE');

insert into emp values(104,'Evr', 10006, '2019-03-04',20,'PA','Mumbai');

insert into emp values(105,'Fvr', 1006, '2019-03-04',100,'PPA','HYD');

select * from emp;

select * from emp_scd1;

select * from emp_scd2;

select * from emp_scd3;

/*truncate table emp_scd2;*/

update emp set dname = 'SSE' where deptno = 20 and empno = 104;

commit;

SET SQL_SAFE_UPDATES = 0;
-- Perform your UPDATE or DELETE operations here
SET SQL_SAFE_UPDATES = 1;  -- Re-enable safe mode afterwards



select current_date();

select now();

select current_time();

select curtime();

SELECT DATE_FORMAT('2024-08-04', '%M %d, %Y') AS formatted_date;

SELECT DATE_FORMAT('2024-08-04', '%W, %M %d, %Y') AS formatted_date;

SELECT DATE_FORMAT('2024-08-04', '%d-%m-%Y') AS formatted_date;

SELECT STR_TO_DATE('04-Aug-2024', '%d-%b-%Y') AS standard_date;





