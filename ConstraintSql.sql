// Domain Integrity Constraints
// NOT NULL
// Creating Constraint NOT NULL with out Constraint clause and name in the below 
 create table StudentsCon(ID number(2) not null,
 Name varchar2(20),
 Marks Number(3)
 );
 
 Select * from StudentsCon;
 
 alter table StudentsCon modify(marks not null);
 
 desc StudentsCon;

 // Creating Constraint NOT NULL with Constraint clause and name in the below 
 create table StudentsCon_1(ID number(2) CONSTRAINT StudentsCon_nnn  not null,
 Name varchar2(20),
 Marks Number(3)
 );
 
 Select * from StudentsCon_1;
 
 //CHECK
 create table StudentsCon_2(ID number CHECK(ID < 9999 ),Name VARCHAR2(30),Marks number(2) check (marks < 101));
 
 alter table StudentsCon_2 modify(marks NUMBER(3));
 
 insert into StudentsCon_2 values(1,'A',100); // Correct

 insert into StudentsCon_2 values(1,'A',101);// Wrong STMT
 
 insert into StudentsCon_2 values(10000,'A',100);// Wrong stmt
 
 select * from StudentsCon_2;

 desc StudentsCon_2;

 //create table StudentsCon_3(ID number(3), name varchar2(30),marks number(3)CONSTRAINT StudentsCon_3_CHECK CHECK (ID < 1000)); // Table Level
 
 // UNIQUE
 
 create table StudentsCon_4 (ID number(3)UNIQUE ,name varchar2(30),marks number(3)); // COLUMN LEVEL
 
 desc StudentsCon_4;
 
 insert into StudentsCon_4 values(&ID,'&name',&marks);
 
 insert into StudentsCon_4 (ID,name,marks) values(2,'B',99);
 
 desc AX;
 
 insert into ax(name) values('AVR');
 
 select * from ax;
 
 create table StudentsCon_5 (ID number(3)CONSTRAINT StudentsCon_4_U UNIQUE ,name varchar2(30),marks number(3)); // COLUMN LEVEL

 create table StudentsCon_6 (ID number(3),name varchar2(30),marks number(3),UNIQUE(ID)); // Table LEVEL 
 
 create table StudentsCon_7 (ID number(3),name varchar2(30),marks number(3),CONSTRAINT StudentsCon_7_U UNIQUE(ID)); // Table LEVEL
 
 //PRIMARY KEY
 create table StudentsCon_8 (ID number(3)PRIMARY KEY,name varchar2(30),marks number(3)); // COLUMN LEVEL
 
 create table StudentsCon_9 (ID number(3),name varchar2(30),marks number(3),CONSTRAINT StudentsCon_9_P PRIMARY KEY(ID)); // COLUMN LEVEL
 
 create table StudentsCon_10 (ID number(3) CONSTRAINT  StudentsCon_10_P PRIMARY KEY,name varchar2(30),marks number(3)); // Table LEVEL
 
 create table StudentsCon_11 (ID number(3) ,name varchar2(30),marks number(3),CONSTRAINT  StudentsCon_11_P PRIMARY KEY(ID)); // Table LEVEL
 
ALTER TABLE Student ADD PRIMARY KEY (No);

ALTER TABLE Student ADD CONSTRAINT PKey_Constraint PRIMARY KEY (No);

//FOREIGN KEY

create table empf(empno number(5),name varchar2(30),deptno number(2),PRIMARY KEY(empno),FOREIGN KEY(deptno)references dept(deptno)); // Table LEVEL

create table empg(empno number(5),name varchar2(30),deptno number(2),CONSTRAINT empg_PK PRIMARY KEY(empno),CONSTRAINT empg_fk FOREIGN KEY(deptno)references dept(deptno));// Table LEVEL

ALTER TABLE EMP ADD FOREIGN KEY (Deptno)REFERENCES DEPT(Deptno);// Alter LEVEL 

ALTER TABLE EMP ADD CONSTRAINT FKey_Constraint FOREIGN KEY (Deptno) REFERENCES DEPT(Deptno); //Alter LEVEL



