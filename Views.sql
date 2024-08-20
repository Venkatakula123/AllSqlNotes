select * from tab;

create view v_emp as select * from emp where deptno = 10;

select * from v_emp;

desc v_emp;

insert into v_emp values(7935,'Avr','CLERK',7839,'08-Aug-92',6000,NULL,10,'ACCOUNTING',15);

select sysdate from dual;

select * from emp where deptno = 20;

create view v_ed as 
select 
e.EMPNO,  
e.ENAME , 
e.JOB,
e.MGR,    
e.HIREDATE,
e.SAL,    
e.COMM,   
e.DEPTNO, 
e.DNAME,  
e.SNO,    
d.DNO,   	
d.DNAME as DEPTNAME,  
d.LOC
from emp e JOIN dept d ON e.deptno = d.dno where e.deptno = 20 ;

desc emp;

desc dept;

select * from v_ED;

--Simplae views
create or replace view v_emp as 
select empno,ename,sal,deptno from emp where deptno = 20;

select * from v_emp;

--Inline Views
SELECT a.ename, a.Empno, b.Salary, b.Department_ID  FROM Emp a,
(SELECT MAX (Sal) as Salary, deptno as Department_ID FROM Emp GROUP BY Deptno) b
WHERE a.Sal = b.Salary AND a.Deptno = b.Department_ID;

--Materealized Views
create MATERIALIZED view mv_emp as 
select empno,ename,sal,deptno from emp where deptno = 20;

select * from mv_emp;

EXEC DBMS_MVIEW.REFRESH('MV_emp', 'C')





