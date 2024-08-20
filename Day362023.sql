SELECT  Count(*) FROM emp,dept;

SELECT * FROM emp;

ALTER TABLE emp DROP COLUMN DNAME;

COMMIT;

SELECT * FROM dept;

SELECT 14*7 AS multiplication FROM dual;

CREATE TABLE TabA1 (id NUMBER(2),name varchar2(2));

COMMIT;

SELECT * FROM TabA1;

SELECT * FROM TabB1;

INSERT INTO tabb1 values(2,'E');
INSERT INTO tabb1 values(null,'F');
INSERT INTO tabb1 values(1,'C');
INSERT INTO tabb1 values(1,'D');

SELECT name a,sno b,sname b FROM TabA a LEFT JOIN TabB b ON a.id = b.sno;

select name a,id a,sno b,sname b from TabA1 a  Join TabB1 b on a.id = b.sno;

ROLLBACK;

create table bonus(
  ename varchar2(10),
  job   varchar2(9),
  sal   number,
  comm  number
);
 
DROP TABLE BONUS ;

create table bonus AS SELECT empno,ename,job,sal,comm,DEPTNO  FROM emp;

SELECT * FROM bonus WHERE  comm IS NOT NULL;

SELECT 14*7 AS RecCount FROM dual;


desc emp;
DESC dept;

SELECT d.DNAME,d.LOC,d.DEPTNO ,e.DEPTNO,e.ENAME,e.JOB,e.EMPNO FROM EMP e LEFT JOIN DEPT d ON e.DEPTNO  = d.DEPTNO ;

SELECT d.DNAME,d.LOC,d.DEPTNO ,e.DEPTNO,e.ENAME,e.JOB,e.EMPNO FROM DEPT d LEFT JOIN EMP e ON e.DEPTNO  = d.DEPTNO ;

SELECT * FROM EMPDUP e ;

SELECT * FROM DEPTDUP d ;

SELECT * FROM PARAMTAB;

UPDATE PARAMTAB SET value=10 WHERE KEY = 'deptno';


SELECT 
  SYSTEM.PARAMTAB.key, 
  SYSTEM.PARAMTAB.value
FROM SYSTEM.PARAMTAB;

COMMIT;

SELECT * FROM tLogcatch;

SELECT * FROM tStatcatch;

SELECT * FROM tab;
======================================================================================
CREATE TABLE Students
 (
 No NUMBER(2),
 Name VARCHAR2(10),
 Address VARCHAR2(50)
 );


Insert into students values (1, 'Sham', 'Bang');
Insert into students values (2, 'Mohan', 'Hyd');

insert into students (no, name) values (3, 'Ramesh');// FOR Address COLUMN it will INSERT NULL Value
insert into students (no, name) values (4, 'Madhu');// FOR Address COLUMN it will INSERT NULL Value

 insert into students values (&no, '&name', '&address');

SELECT * FROM students;

SELECT * FROM SCDT2 s ;

SELECT max(SKEY) AS max_key FROM SCDT2;

TRUNCATE TABLE SCDT2 ;

SELECT 
  SYSTEM.SCDT2.SKEY, 
  SYSTEM.SCDT2.EMPNO, 
  SYSTEM.SCDT2.EMPNAME, 
  SYSTEM.SCDT2.SAL, 
  SYSTEM.SCDT2.HRA, 
  SYSTEM.SCDT2.DEPTNO, 
  SYSTEM.SCDT2.EFF_ST_DATE, 
  SYSTEM.SCDT2.EFF_END_DATE, 
  SYSTEM.SCDT2.ACFLAG
FROM SYSTEM.SCDT2 where SYSTEM.SCDT2.ACFLAG='Y';

select  nvl(max(ACFLAG),0) as max_key from SCDT2;

SELECT * FROM SCDT3;

TRUNCATE TABLE SCDT3;

SELECT 
  SYSTEM.EMPDETAILS.EMPDATA
FROM SYSTEM.EMPDETAILS;

SELECT * FROM Orderdets_Date;

SELECT * FROM EMPJSON ;

SELECT * FROM EMPDETAILS;


===========================================================
SELECT 
  SYSTEM.SCDT3.EMPNO, 
  SYSTEM.SCDT3.EMPNAME, 
  SYSTEM.SCDT3.SAL, 
  SYSTEM.SCDT3.SAL_PREV, 
  SYSTEM.SCDT3.HRA, 
  SYSTEM.SCDT3.HRA_PREV, 
  SYSTEM.SCDT3.DEPTNO, 
  SYSTEM.SCDT3.EFF_DATE
FROM SYSTEM.SCDT3;

SELECT * FROM SCDT3;

TRUNCATE TABLE SCDT3;

CREATE TABLE SSN(id NUMBER(4),Name VARCHAR2(30),CITY VARCHAR2(20),SSNNUM VARCHAR2(20));

CREATE TABLE SSNCHECK AS SELECT * FROM SSN;

ALTER  SSNC RENAME TO SSNCHECK;

RENAME SSNCHESK TO SSNCHESK;

SELECT * FROM   SSNCHECK;

ALTER TABLE SSN ADD  VSSN NUMBER(2);

INSERT INTO SSN Values(1,'a','LA1','123-45-692');
INSERT INTO SSN Values(2,'ab','LA2','321-12-662');
INSERT INTO SSN Values(3,'abc','LA3','567-34-692');
INSERT INTO SSN Values(4,'abcd','LA4','343-56-692');
INSERT INTO SSN Values(5,'abcde','LA5','345-47-692');

COMMIT;

SELECT * FROM SSN;

DELETE FROM SSN WHERE id = 3;



========================================================================================
CREATE OR REPLACE FUNCTION is_ssn(string_in VARCHAR2)
RETURN SSN
IS
-- validating ###-##-#### format
BEGIN
  IF TRANSLATE(string_in, '0123456789A', 'AAAAAAAAAAB') =
     'AAA-AA-AAAA' THEN
    RETURN 1;
  END IF;
  RETURN 0;
END is_ssn;
/


CALL IS_SSN('567-34-692');


CALL IS_SSN() ;

create TABLE ROWGENS (id NUMBER(7),age NUMBER(3),fname varchar2(60),lname varchar2(60),salary NUMBER(7));

SELECT * FROM ROWGENS ORDER BY ID ASC;

CREATE TABLE ROWGENS3 AS SELECT * FROM ROWGENS;

CREATE TABLE ROWGEN3 AS SELECT * FROM ROWGEN2;

COMMIT;

CREATE TABLE employee (id NUMBER(3),name Varchar2(20));

SELECT * FROM employee;

INSERT INTO employee values(1,'A');
INSERT INTO employee values(2,'B');
INSERT INTO employee values(2,'C');

UPDATE employee SET id = 3 WHERE name = 'C';

SELECT * FROM statetab;

SELECT * FROM d minus
SELECT * FROM c;

select tabname,colname from columnstab;

=======================================================================
--DELETE Duplicate records.

CREATE TABLE fruits (
        fruit_id   NUMBER,
        fruit_name VARCHAR2(100),
        color VARCHAR2(20)
        );

ALTER TABLE fruits DROP PRIMARY KEY;

CREATE SEQUENCE seq_ID START WITH 1 increment BY 1;

SELECT rowid, f.* FROM fruits f;

INSERT INTO fruits VALUES(seq_ID.NEXTVAL,'Apple','Red');
INSERT INTO fruits VALUES(seq_ID.NEXTVAL,'Apple','Red');
INSERT INTO fruits VALUES(seq_ID.NEXTVAL,'Orange','Orange');
INSERT INTO fruits VALUES(seq_ID.NEXTVAL,'Orange','Orange');
INSERT INTO fruits VALUES(seq_ID.NEXTVAL,'Orange','Orange');
INSERT INTO fruits VALUES(seq_ID.NEXTVAL,'Banana','Yellow');
INSERT INTO fruits VALUES(seq_ID.NEXTVAL,'Banana','Green');


DELETE FROM fruits WHERE rowid NOT IN (SELECT max(rowid) FROM fruits GROUP BY fruit_id,fruit_name,color );
SELECT max(fruit_id) FROM fruits group BY FRUIT_NAME ,color ORDER BY max(fruit_id);

DELETE FROM fruits WHERE fruit_id NOT IN (SELECT max(fruit_id) FROM fruits GROUP BY fruit_name,color);

ROLLBACK;

DELETE FROM fruits WHERE fruit_id NOT IN (SELECT min(fruit_id) FROM fruits GROUP BY fruit_name,color);

TRUNCATE TABLE fruits;

DROP TABLE fruits;

INSERT INTO fruits  VALUES(1,'Apple','Red');
INSERT INTO fruits  VALUES(1,'Apple','Red');
INSERT INTO fruits  VALUES(2,'Orange','Orange');
INSERT INTO fruits  VALUES(2,'Orange','Orange');
INSERT INTO fruits  VALUES(2,'Orange','Orange');
INSERT INTO fruits  VALUES(3,'Banana','Yellow');
INSERT INTO fruits VALUES(4,'Banana','Green');

--=====================================================================================================================================

SELECT * FROM student;

CREATE TABLE stud(sno NUMBER(4),sname varchar2(20));

INSERT INTO stud values(101,'Venkat');
INSERT INTO stud values(102,'Durga');
INSERT INTO stud values(103,'Latha');
INSERT INTO stud values(104,'Chandrika');
INSERT INTO stud values(105,'Potti');
INSERT INTO stud values(106,'Sak');
INSERT INTO stud values(107,'Karthika');
INSERT INTO stud values(108,'Kalpana');
INSERT INTO stud values(109,'Lalitha');

SELECT * FROM STUD;

SELECT count(sno),sno,sname FROM stud GROUP BY sno,sname HAVING count(*) > 1;

SELECT rowid,sno,sname FROM stud ORDER BY sno desc;

DELETE FROM stud s1 WHERE rowid < 
(SELECT max(rowid) FROM stud s2 WHERE s1.sno = s2.sno);

SELECT a.name,b.id FROM ta a INNER JOIN tb b ON a.name = b.id;

SELECT a.name,b.id FROM ta a LEFT JOIN tb b ON a.name = b.id;

SELECT a.name,b.id FROM ta a RIGHT JOIN tb b ON b.id = a.name;

SELECT a.name,b.id FROM ta a FULL JOIN tb b ON a.name = b.id;

--========================================================================================================================================
--MOD
SELECT MOD(7,4), MOD(1,5), MOD(null,null), MOD(0,0), MOD(-7,4) FROM Dual;

select abs(-50) from dual;

SELECT nvl(comm,100) FROM emp;

SELECT 
TRUNC(125.815), TRUNC(125.815, 2), TRUNC(195.815, -2)
FROM DUAL;

SELECT rpad('akula',10,'#') FROM dual;

SELECT ltrim('   akula',' ') FROM dual;
SELECT ltrim('computer','co') FROM dual;
SELECT TRIM( Leading 'i' from 'indiani')FROM DUAL;
SELECT TRIM( trailing 'i' from 'indiani')FROM DUAL;




SELECT INSTR('1235dgfhh#ABC1234535#ertte#78858&*', '#', 1, 1) FROM dual; --10

SELECT INSTR('1235dgfhh#ABC1234535#ertte#78858&*', '#', 1, 1)+1 FROM dual; --11

SELECT INSTR('1235dgfhh#ABC1234535#ertte#78858&*', '#', 1, 2) FROM dual; --21 

SELECT INSTR('1235dgfhh#ABC1234535#ertte#78858&*', '#', 1, 1) -1 FROM dual; --9

SELECT SUBSTR('1235dgfhh#ABC1234535#ertte#78858&*',INSTR('1235dgfhh#ABC1234535#ertte#78858&*', '#', 1, 1) + 1,
												   INSTR('1235dgfhh#ABC1234535#ertte#78858&*', '#', 1, 2) - 
												   INSTR('1235dgfhh#ABC1234535#ertte#78858&*', '#', 1, 1) - 1) AS value FROM dual;
												  
SELECT * FROM emp WHERE sal = (SELECT max(sal) FROM emp WHERE sal < (SELECT max(sal) FROM emp));


SELECT * FROM ta UNION SELECT * FROM tb;

--{1,1,0,null} UNION {1,0,null,2,null}

SELECT * FROM ta UNION  ALL SELECT * FROM tb;

SELECT * FROM ta INTERSECT SELECT * FROM tb;

SELECT * FROM ta MINUS SELECT * FROM tb;

SELECT GREATEST(ename) FROM emp;  
SELECT LEAST(ename) FROM emp;  

select * from emp where rownum < 6;

select e.*,rownum, rowid from emp e;

select * from emp fetch first 5 rows only;

SELECT ename, length(ename)   AS LENGTHs FROM emp where rownum = 1; --ORDER BY lengths desc ; 

select * from (select deptno, ename,sal, dense_rank() over(partition by deptno order by sal desc) r from emp) where r = 4;
