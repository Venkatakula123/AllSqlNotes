//SET OPERATORS

select * from ax;

select * from bx;

drop table bx;

create table BX as select * from ax;

desc ax;

desc bx;

insert into bx values('&name',&ID);

insert into ax values('&name',&ID);

select * from ax; //1a2b3c4d5e6f7g8h9i10j11k

select * from bx;//1a3c5e7g9i9i

select * from ax union select * from bx; // Unique data from both Tables inluding match and not matched records

select * from ax union all select * from bx; // all Data from both tables i.e duplicates also

select * from ax intersect select * from bx; // only matching records from left tables

select * from ax minus select * from bx; //only unmatched records from left table

select * from bx union select * from ax;

select * from bx union all select * from ax;

select * from bx intersect select * from ax;

select * from bx minus select * from ax;