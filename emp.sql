select deptno from emp group by deptno order by deptno asc;

select * from dept;

select * from dept where deptno not in (select deptno from emp);

--alter table emp add column loc varchar(13);

select * from emp;

--update emp set loc = (select loc from dept where deptno = 30) where deptno = 30;

select * from dept d where  not exists (select 0 from emp e where d.deptno = e.deptno );

select * from dept where deptno = 10;

