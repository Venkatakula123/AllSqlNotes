desc dept;

desc emp;

select INDEX_NAME,INDEX_type,VISIBILITY,STATUS from ALL_INDEXES where TABLE_NAME = 'EMP';

select INDEX_NAME,INDEX_type,VISIBILITY,STATUS from ALL_INDEXES where TABLE_NAME = 'DEPT';

select * from ALL_INDEXES where TABLE_NAME = 'EMP';

alter table emp add column email varchar2(30);

create index idxdeptno ON dept(dname);

drop index idxdeptno;

create UNIQUE INDEX IDXDNAME ON DEPT(DNAME);

select * from dept;

INSERT INTO DEPT VALUES(80,'SE','BZA');

CREATE BITMAP index idxmgr ON EMP(MGR);

insert into DBCONTEXT values(&key,&values);

commit;

select * from EMPOUTS_2;

