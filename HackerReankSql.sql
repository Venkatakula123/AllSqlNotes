--Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.
--select distinct(job) from emp where SUBSTR(job,1,1)  in ('a','e','i','o','u') and SUBSTR(job,length(job),1)  in ('a','e','i','o','u');
--select distinct(job) from emp where lower(SUBSTR(job,1,1))  NOT in ('a','e','i','o','u') and lower(SUBSTR(job,length(job),1)) NOT in ('a','e','i','o','u');
--==============================================================================
--Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.
--select distinct(CITY) from STATION where lower(SUBSTR(CITY,1,1))  NOT in ('a','e','i','o','u');

--==============================================================================
--Query the list of CITY names from STATION that do not end with vowels. Your result cannot contain duplicates.
--select distinct(CITY) from station where lower(SUBSTR(CITY,length(CITY),1)) NOT IN ('a','e','i','o','u');
--==============================================================================
--Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates.
--select distinct(CITY) from STATION where lower(SUBSTR(CITY,1,1))  NOT in ('a','e','i','o','u') OR lower(SUBSTR(CITY,length(CITY),1)) NOT IN ('a','e','i','o','u');

--==============================================================================
-- Display Even rows from table;

select e.*, rownum,rowid from emp e where rowid in (select decode(mod(rownum,2),0,rowid, null) from emp);

-- Display Odd rows from table;

select e.*, rownum,rowid from emp e where rowid in (select decode(mod(rownum,2),1,rowid,null) from emp);
select e.*, rownum,rowid from emp e where rowid in (select decode(mod(rownum,2),0,null,rowid) from emp);

--==============================================================================
-- 3rd highest Salary

select sal from emp;

select   sal from emp e1 where 2 = (select count(distinct sal) from emp e2 where e1.sal <= e2.sal );

select distinct sal from emp e1 where 2 = (select count(distinct sal) from emp e2 where e1.sal <= e2.sal );

--.Select FIRST n records from a table
select * from emp where rownum <= 6;

select distinct sal from emp a where 3 >= (select count(distinct sal) from emp b where a.sal 
>= b.sal) order by a.sal desc;

select count(a.EMPNO), b.deptno, b.dname from emp a, dept b where  a.deptno = b.deptno group by b.deptno,b.dname;

select count(*),deptno,dname from emp group by deptno,dname;


Select ename from emp where ename like '%S';

Select ename from emp where ename like 'S%';

select * from emp where deptno IN (10,20,40) OR JOB IN ('clerks','salesman' ,'analyst');

select * from emp where hiredate between '30-June-90' AND '31-dec-90';

--Display the names of employees who are working in the company for the past 5 years.
select ename, hiredate,SYSDATE-hiredate from emp where sysdate-Hiredate > 5*365;

Alter session set NLS_DATE_FORMAT = 'DD-MM-yyyy';

select hiredate from emp;

select Count(*),sum(sal),deptno from emp group by deptno having count(*)>3;

create table emp3 as select * from emp where 1=2;

select * from emp3;

select * from emp order by deptno , sal desc;

select * from emp where sal > any(select sal from emp where sal < 3000 );

select ename, sal+nvl(comm,0) from emp;

select * from emp where comm is not null;

select count(MGR),count(sal) from emp;

select * from emp where ename like'%R';

select * from emp where ename like 'S____';

Select ename,sal*12 as monthlysal from emp;

select count(*),d.deptno,d.dname from emp e,dept d where e.deptno = d.deptno group by d.deptno,d.dname ;

-- Delete duplicates
select rowid from STDSDUP where rowid not in(select max(rowID) from STDSDUP group by sno,sname,marks_per );

delete from STDSDUP where rowID not IN (select max(rowid) from stdsdup group by stdsdup.sno,stdsdup.sname,stdsdup.marks_per);

select * from STDSDUP;

--nth Highest Sal n = 1 2 3 4 5 6 7 8 9
select sal from emp e1 where 2 =  (select count(distinct sal) from emp e2 where e1.sal <= e2.sal);
select distinct sal from emp e1 where 2 =  (select count(distinct sal) from emp e2 where e1.sal <= e2.sal);

select distinct sal from emp e1 where 3 >= (select count(distinct(sal)) from emp e2 where e1.sal >= e2.sal );

select distinct sal from emp e1 where 3 >= (select count(distinct(sal)) from emp e2 where e1.sal <= e2.sal );

select sal from emp order by sal desc;

select * from emp where deptno NOT IN (select deptno from dept );

select * from emp where deptno not in (10,20);

select * from dept where deptno NOT IN (select deptno from emp );

-- display last n = 5 records
select * from emp where rownum < = (select count(*)-5 from emp);
select * from emp minus select * from emp where rownum < (select count(*) - 5 from emp);

select * from emp minus select * from emp where rownum <= 8;
--==============================================================================
select * from emp where sal > All(select sal from emp where job = 'MANAGER');

select * from emp where sal = (select max(sal) from emp);

select * from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp));

select * from emp where job = (select job from emp where ename = 'SMITH');

select * from emp where sal > ALL (select sal from emp where JOB = 'SALESMAN');

select * from emp where sal > (select max(sal) from emp where JOB = 'SALESMAN');

select * from emp where job = (select job from emp where ename = 'BLAKE') and sal > (select sal from emp where ename = 'BLAKE');

select * from emp where HIREDATE = (select min(HIREDATE) from emp);

select * from emp where deptno = (select deptno from dept where dname = 'SALES');

select sum(sal) from emp where deptno = (select deptno from dept where dname = 'ACCOUNTING');

-- Multiple Row SubQuery

select * from emp where job IN(select job from emp where ENAME = 'SMITH' OR ENAME  = 'CLARK');

--select * from emp where sal IN (select max(sal),min(sal) from emp); won't work because inner query returns 2 columns instead of 2 rows

select * from emp where sal IN(select max(sal) from emp union select min(sal) from emp);

select * from emp where sal > ALL (select sal from emp where JOB = 'SALESMAN');

select * from emp where sal > ANY (select sal from emp where JOB = 'SALESMAN');

select * from emp where (job,sal) IN (select job,max(sal) from emp group by JOB);

select distinct job from emp;

select * from emp where (job,MGR) IN (select job,MGR from emp where ename = 'CLARK');

--Inline view Subquery

select ENAME ,SAL from emp where sal*12 >25000;

select * from (select sal from emp Order by sal desc)  where rownum = 5;

--1,3,5,7,9
select * from (select ROWNUM r , e.* from emp e ) where r IN (1,3,5,7,9);

select * from (select ROWNUM r , e.* from emp e ) where r = 1 OR r =  (select count(*) from emp);


insert into xa  values(&ID,'&name');

create table xb as select * from xa where 1=2;

select * from xb minus  select * from xa;

select * from emp where rownum > (select count(*) from emp);

--==============================================================================
--Fetch 1st record in a Table
select  * from emp where rownum = 1;

--Fetch last record from table 
select * from (select * from emp order by rownum desc) where rownum =1;

select * from emp order by rownum desc;

select * from (select * from emp order by rownum desc) where rownum <=3;

select e1.* from emp e1 where 3 > (select count(*) from emp e2 where e1.rowid < e2.rowid ); 

select * from dept;

select deptno, dname from dept d where not exists(select 1 from emp e where d.deptno = e.deptno );

--====================================================================================
select CASE WHEN SUBSTR(name,1,1) IN('a','e','i','o','u') THEN 'A ' || name || SUBSTR(name,1,1) ELSE 'An ' || name  || SUBSTR(name,1,1) end  as cname from Country order by cname;
--=====================================================================================

-- find diff b/w PRIMARY KEY AND UNIQUE KEY

CREATE TABLE Persons (
    ID NUMBER(3) ,
    LastName varchar2(25) NOT NULL,
    FirstName varchar(25),
    Age int,
    UNIQUE (ID)
);

insert into PERSONS vlues(&ID,'&LastName','&FirstName',&Age);

select * from PERSONS;

create table PERSONS_1 as select * from PERSONS where 2=1;

CREATE TABLE Persons_1 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);

--==============================================================================
SELECT sno,empno, ename, sal,
 LEAD (sal) OVER (ORDER BY sal) AS salary_next
 FROM emp;
 
 desc emp;

--==============================================================================

select deptno,LISTAGG(ename,';') within group(order by ename) from emp group by deptno;
--==============================================================================

SELECT
  product_name,
  list_price,
  CASE category_id
    WHEN 1
    THEN ROUND(list_price * 0.05,2) -- CPU
    WHEN 2
    THEN ROUND(List_price * 0.1,2)  -- Video Card
    ELSE ROUND(list_price * 0.08,2) -- other categories
  END discount
FROM
  products
ORDER BY
  product_name;
  
select distinct CATEGORY_ID from products;

desc products;

select list_price,ROUND(list_price * 0.05,2)  from products-- CPU
    
