select * from emp where sal > (select max(sal) from emp where JOb = 'MANAGER');

select * from emp where sal > ALL(select sal from emp where JOb = 'MANAGER');

select * from emp where job = (select job from emp where ename = 'SMITH');

select * from emp where sal > (select max(sal) from emp where job = 'SALESMAN');

select * from emp where sal> (select sal from emp where ename = 'BLAKE') and job = (select job from emp where ename = 'BLAKE');

select * from emp where HIREDATE = (select min(HIREDATE)from emp);

select * from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp)); -- 2nd Highest Salary

select * from emp where sal = (select max(sal) from emp where sal < (select max(sal) from emp where sal < (select max(sal) from emp))); -- 3rd Highest sal

select * from emp where deptno = (select deptno from dept where DNAME = 'SALES' );

select * from dept;

select * from emp;

select sum(sal) from emp where deptno = (select deptno from dept where dname = 'ACCOUNTING');

==============================================================================================

select * from emp where job IN(select job from emp where ename = 'SMITH' OR ename = 'CLARK');

select * from emp where sal ALL(select max(sal),min(sal) from emp);

=============================================================================================




















