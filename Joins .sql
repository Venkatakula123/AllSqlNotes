select * from a;

select * from b;

select a1.no,b1.id from a a1 JOIN b b1 ON a1.no = b1.id;-- in Inner join Null values won't be Consider for evaluate. Remains every where null values will be consider 

select a1.no,b1.id from a a1 LEFT JOIN b b1 ON a1.no = b1.id;

select a1.no,b1.id from a a1 RIGHT JOIN b b1 ON a1.no = b1.id;

select a1.no,b1.id from a a1 FULL JOIN b b1 ON a1.no = b1.id;

select a1.no,b1.id from a a1 NATURAL JOIN b b1;

select a1.no,b1.id from a a1 CROSS JOIN b b1;


a
1-3
2-3
3-2
4-1
5-1
6-1
null-1


b
1-2
2-2
3-2
null-2
5-1
10-1
11-1



a
===============
1	a
1	a
1	a
2	b
3	c
2	b
4	d
2	b
3	c
5	e
null	null
6	f


b
==============
1	ab
2	cd
1	ab
3	ef
null	null
2	cd
3	sd
5	fd
10	fg
null	null
11	gb





