select * from SCHEDULE;

create table schedule(
 	empno varchar2(20),
 	contents varchar2(1000),
 	year number,
 	month number,
 	day number
);

insert into SCHEDULE(empno,contents,year,month,day)
values('300300','오늘은 더워',2016,11,16);