select MAX(Sal) from Emp WHERE Sal NOT IN (select MAX(Sal) from Emp where sal not in(select max(sal) from emp)) ;

select * from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp)))));

select sal from emp order by sal desc;

select deptno,max(sal) from emp group by deptno;

select * from (select deptno, sal, dense_rank() over(partition by deptno order by sal desc) r from emp) where r =2 order by deptno desc;

select sysdate from dual;

select * from emp;

select * from emp where ename like 'M%';
 
select e.*,rownum,rowid from emp e where rowid IN (select decode(mod(rownum,2),0,rowid, null) from  emp e);

select e.* ,rownum,rowid from emp e where rowid IN (select decode(mod(rownum,2),0,null,rowid) from emp);  

select e.*,rownum,rowid from emp e;

create table a (ID number(4));

create table b (ID number(6));

insert into b values(&ID);

select * from a;

select * from b;

select * from a a1 INNER JOIN b b1 ON a1.ID = b1.ID;

select * from a a1 LEFT JOIN b b1 ON a1.ID = b1.ID;

select * from a a1 FULL JOIN b b1 ON a1.ID = b1.ID;

select * from b b1 RIGHT JOIN a a1 ON  b1.ID = a1.ID;
