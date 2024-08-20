select * from SCDT2 where EMPNAME='Venkat';

SELECT 
  nvl(max(SYSTEM.SCDT2.SKEY),0) as MAX_KEY
FROM SYSTEM.SCDT2;

select * from SCDT3;

select * from p_details;

select * from p_details_SCD1;

//truncate table p_details_SCD1;

select * from cont_global_pre_stage;

select count(*) from cont_global_pre_stage;

//truncate table CONT_global_pre_stage;

Select * from job_execution_log;

//truncate table job_execution_log;

select * from error_handling_source_file;

//truncate table error_handling_source_file;

select * from LOG_SOURCE_FILE;

//truncate table LOG_SOURCE_FILE;

create table JOB_EXECUTION_LOG_STG as select * from JOB_EXECUTION_LOG;

select * from JOB_EXECUTION_LOG_STG;

truncate table JOB_EXECUTION_LOG_STG;

create Table ERROR_GLOBAL_STAGE as select * from CONT_global_pre_stage;

select * from ERROR_GLOBAL_STAGE;

truncate table ERROR_GLOBAL_STAGE;



create table CONTRACT_GLOBAL_STAGE as select * from CONT_global_pre_stage;

truncate table CONTRACT_GLOBAL_STAGE;

=======

select nvl(max(EXECUTION_ID),0) as exe_id from JOB_EXECUTION_LOG_STG;


SELECT e.DeptNo, MAX(e.Sal),d.DName 
FROM Emp e left outer join dept d ON e.DeptNo=d.DeptNo
WHERE e.Sal <
(SELECT MAX(Sal)
 FROM Emp
 WHERE DeptNo = e.deptno)
GROUP BY e.DeptNo,d.DName;

================================================================================
select * from CONT_GLOBAL_PRE_STAGE;
SELECT * FROM JOB_EXECUTION_LOG;
SELECT * FROM error_handling_source_file;
SELECT * FROM LOG_SOURCE_FILE;

SELECT * FROM JOB_EXECUTION_LOG_STG;
SELECT * FROM CONTRACT_GLOBAL_STAGE;
SELECT * FROM ERROR_GLOBAL_STAGE;
select * from LOG_SOURCE_FILE_STG;
================================================================================
TRUNCATE TABLE CONT_GLOBAL_PRE_STAGE;
TRUNCATE TABLE JOB_EXECUTION_LOG;
TRUNCATE TABLE error_handling_source_file;
TRUNCATE TABLE LOG_SOURCE_FILE;

TRUNCATE TABLE JOB_EXECUTION_LOG_STG;
TRUNCATE TABLE CONTRACT_GLOBAL_STAGE;
TRUNCATE TABLE ERROR_GLOBAL_STAGE;
truncate table LOG_SOURCE_FILE_STG;

================================================================================
select * from emp where sal = (select max(sal) from emp where sal< (select max(sal) from emp));

update emp set dname = (select dname from dept where dept.deptno = emp.deptno );

select * from (select ename, sal , dense_rank() over(order by Sal desc) as n from emp) where n = 5;

select ename, sal , row_NUMBER() over(order by Sal desc) as n from emp; // No duplicates rownumbers and no Skip row numbers

select ename, sal , rank() over(order by Sal desc) as n from emp;//  duplicates rownumbers and  Skip row numbers

select ename, sal , dense_rank() over(order by Sal desc) as n from emp;// duplicates rownumbers and no Skip row numbers
===============================================================================================================
SELECT MAX(sal), MIN(sal) FROM   emp;

select max(sal),min(sal) from emp where sal < (select max(sal) from emp) and sal > (select min(sal) from emp);

select * from (select * from emp order by sal desc) where rownum =1; // find highest salary in emp

select rownum, Ename , Sal from emp;

select * from (select ename, empno, job, sal, rank() over(order by sal desc) ranks from emp) where ranks <= 3;

select * from (select ename, empno, job, sal, dense_rank() over(order by sal desc) ranks from emp) where ranks <= 3;

select * from (select ename, empno, job, sal, rank() over(order by sal ) ranks from emp) where ranks <= 3;

select * from dept;

select ename,empno,MGR, ROW_NUMBER() over(partition by mgr order by mgr) rownumn from emp;

select ename , ROWnum from emp;

=============================================================================================================================
//Finding duplicate records and delete them

select rowid, e.* from emp e;

create table stdsdup (sno NUMBER(4),SNAME VARCHAR2(30),MARKS_Per NUMBER(4,2));

INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('102', 'B', '85.3');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('105', 'E', '65.25');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('101', 'A', '68.7');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('102', 'B', '85.3');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('103', 'C', '78.5');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('101', 'A', '68.7');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('104', 'D', '45.5');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('105', 'E', '65.25');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('104', 'D', '45.5');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('102', 'B', '85.3');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('103', 'C', '78.5');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('107', 'G', '12.32');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('102', 'B', '85.3');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('108', 'H', '36.25');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('104', 'D', '45.5');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('105', 'E', '65.25');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('103', 'C', '78.5');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('102', 'B', '85.3');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('103', 'C', '78.5');
INSERT INTO "SYSTEM"."STDSDUP" (SNO, SNAME, MARKS_PER) VALUES ('104', 'D', '45.5');


select rowid, s.* from STDSDUP s order by s.SNO;

savepoint stddup; 

//1st way to find duplicates rows 
select sno,sname,count(*) from stdsdup group by sno, sname having count(*)>1; 

//2nd way to find duplicates and delete duplicates
select rowid,s1.* from stdsdup s1 where rowid < (select max(rowid) from stdsdup s2 where s1.sno = s2.sno );

delete from stdsdup s1 where rowid < (select max(rowid) from stdsdup s2 where s1.sno = s2.sno);

select rowid,s.* from stdsdup s order by s.sno;

//3rd way to find duplicates and delete them
select rowid,s.* from stdsdup s where rowid  not in(select max(rowid) from stdsdup group by sno);

delete from stdsdup s where rowid  not in(select max(rowid) from stdsdup group by sno);

rollback stddup;

===========================================================================================================================================================================

select sno,sname, Row_number() over(PARTITION BY sno order by sno ) as "RANK" from stdsdup ;

select * from (select ename,empno,sal, dense_rank() over(order by sal desc) as rank from emp) where rank =3; 

==========================================================================================================================================================================
// DAte 
// to know the present date format supported by Oracle
select value from V$NLS_PARAMETERS where parameter = 'NLS_DATE_FORMAT';

ALTER SESSION SET NLS_DATE_FORMAT = 'DD-MON-YY';

select SYSDATE FROM DUAL;

Select CURRENT_DATE from dual;

select CURRENT_TIMESTAMP from dual;

select systimestamp from dual;

select Localtimestamp from dual;

select Dbtimezone from dual;

select SESSIONTIMEZONE FROM DUAL;

SELECT TO_CHAR(SYSDATE,'DDD/MONTH/YYYY') as Days from dual;

SELECT TO_CHAR(SYSDATE,'D/MONTH/YYYY') as Days from dual;

SELECT TO_CHAR(SYSDATE,'DDFMMONTHYEAR') as Days from dual;

select To_CHAR(SYSDATE,'DDth |MONTH|YYYY|CC|Q|WW|WI|W|HH:MI:SS AM') from dual;

select To_CHAR(SYSDATE,'DDMONTHYYYYCCQWWWIWHH:MI:SS AM') from dual;

//Convert StringDate into DATE type
select TO_DATE('06DECEMBER 2022', 'DDMONTHYYYY') from dual;

select TO_CHAR(TO_DATE('06DECEMBER 2022', 'DDMONTHYYYY'), 'DDD MON YYY') from dual;

//ADD_MONTHS()

select ADD_MONTHS(SYSDATE, 3) from dual;

select ADD_MONTHS('07-MAR-23',4) from dual;

select ADD_MONTHS('07-MAR-23',-4) from dual;

select ADD_MONTHS(TO_DATE('06DECEMBER 2022','DD-MON-YYYY'),2) from dual;

select NEXT_DAY(SYSDATE,1) from dual;

SELECT NEXT_DAY(
TO_DATE('24/AUG/2022','DD/MON/YYYY'), 'SUN')AS NEXT_DAY 
FROM DUAL;


select EXTRACT(YEAR FROM DATE '2003-08-22') from dual;

select LAST_DAY(SYSDATE) from dual;

select MONTHS_BETWEEN(SYSDATE, '08-AUGUST-1992') from dual;

select NEXT_DAY(TRUNC(SYSDATE), 'THU') from dual;

select TRUNC(SYSDATE, 'Month') from dual;

select TRUNC(SYSDATE,'Q') from dual;

select TRUNC(SYSDATE,'year') from dual;

select TRUNC(SYSDATE,'DAY') from dual;

select LAST_DAY(SYSDATE) from dual;

select GREATEST(SYSDATE, '09-DEC-22') from dual;

select LEAST(SYSDATE, '09-DEC-22') from dual;

==================================================================================================================================================================================

CREATE TABLE logs (
    log_id NUMBER,
    message VARCHAR(2) NOT NULL,
    logged_at TIMESTAMP (2) NOT NULL,
    PRIMARY KEY (log_id)
);

INSERT INTO logs (LOg_ID,
    message,
    logged_at
    )
VALUES (1,
    'NB',
   SYSDATE(1)
    );

select * FROM LOGS;
================================================================================

select EMPNO,ENAME,SAL,DEPTNO from emp where sal > ALL(select sal from emp where deptno = 30);

select EMPNO,ENAME,SAL,DEPTNO from emp where sal < ALL(5000);

select * from emp;

select EMPNO,ENAME,SAL,DEPTNO from emp where sal > ANY(select sal from emp where deptno = 30);

select EMPNO,ENAME,SAL,DEPTNO from emp where sal NOT between 2000 and 3000;

select EMPNO,ENAME,SAL,DEPTNO from emp where sal between 2000 and 3000;

select EMPNO,ENAME,SAL,DEPTNO from emp where sal IN (2850,2000,1000,3000,4000);

select EMPNO,ENAME,SAL,DEPTNO from emp where sal IN (select sal from emp where deptno = 30);

select EMPNO,ENAME,SAL,DEPTNO from emp where sal NOT IN (2850,2000,1000,3000,4000);

select sal from emp where NOT deptno = 30;

select sal from emp where deptno = 30;

select ename, sal/2 from emp;
================================================================================

select * from JOB_Execution_Log;

desc job_execution_log;

SELECT NVL(max(EXECUTION_ID),0) from JOB_EXECUTION_LOG;

select * from contract_global_stage;

create table PRODUCT_DIM (PRODUCT_KEY NUMBER(6),PRODUCT_NAME VARCHAR2(300),ETL_LODA_DATE TIMESTAMP);

select distinct(PRODUCT_NAME) from PRODUCT_DIM;

select * from PRODUCT_DIM;

truncate table PRODUCT_DIM;

SELECT NVl(max(PRODUCT_KEY),0) from PRODUCT_DIM;

SELECT SYSTEM.CONTRACT_GLOBAL_STAGE.PRODUCT_NAME FROM SYSTEM.CONTRACT_GLOBAL_STAGE;

select * from LOG_SOURCE_FILE_STG;

create table LOG_PRODUCT_DIM as select * from LOG_SOURCE_FILE_STG;

select * from LOG_PRODUCT_DIM;

desc LOG_PRODUCT_DIM;

SELECT nvl(max(LOG_KEY),0)FROM SYSTEM.LOG_PRODUCT_DIM;

select * from JOB_EXECUTION_LOG;

==========================================================================
//display emp's location form CHICAGO using emp and dept tables
select * from emp e,dept d where e.deptno = d.deptno; 

select e.ename,e.empno,e.deptno,d.loc,d.dname from emp e,dept d where e.deptno = d.deptno and loc = 'CHICAGO';

select d.deptno,d.dname, sum(e.sal) from emp e, dept d where e.deptno = d.deptno group by d.deptno,d.dname;

select d.dname, sum(e.sal) from emp e, dept d where e.deptno = d.deptno group by d.dname;

select * from dept;

//Write a query to display number of employees, min(sal), max(sal), sum(sal) in each location from emp, dept tables using equi join?
select loc, count(*), min(sal), max(sal),sum(sal) from emp, dept where emp.deptno=dept.deptno group by loc;

//Write a query to retrieve the first four characters of  EmpLname from the EmployeeInfo table.
select SUBSTR(ename,0,3) from emp;

//Write a query to find the names of employees that begin with ‘S’
select * from emp where ename like 'S%';

//Write a query to fetch 50% records from the EmployeeInfo table.
select * from emp where empno <=(select count(empno)/2 from emp);

//Write a query to fetch Deptno's which are present in both the tables
select ename,sal,deptno, dname from emp where deptno IN(select deptno from dept);

select e.deptno,d.deptno from emp e INNER JOIN DEPT d ON d.deptno = e.deptno;

//Write a query to combine Ename and job into a new column – EMPJOB.
select ENAME || ''|| job as EMPJOB from emp;

==============================================================================
Self Join

select a.ename as empname1 , b.ename as empname2 from emp a, emp b where a.empno<>b.empno ;

select e1.ename as employees , e1.sal, e2.sal, e2.ename as manager
from emp e1, emp e2
where e1.mgr=e2.empno
and e1.sal>e2.sal;

select * from emp;

select e1.ename as employees,e1.hiredate, e2.hiredate,e2.ename as manager
from emp e1,emp e2
where e1.mgr=e2.empno
and e1.hiredate< e2. Hiredate;


=============================================================================

Equi JOIN

select e.ename ,e.job,e.sal,d.loc,d.deptno,e1.ename,e1.job,e1.comm from emp e,dept d,emp2 e1 where e.deptno = d.deptno and d.deptno= e1.deptno;

==============================================================================
Joins

create table c (name varchar2(5),id number(4));

select * from c;

select * from d;

desc c;

create table d (bname varchar2(5),bid number(4));

insert into c values('&name' , &id);

insert into d values('&bname' , &bid);

select * from c,d;

select * from c cross join d;

























