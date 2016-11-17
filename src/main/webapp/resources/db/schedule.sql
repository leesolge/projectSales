select * from SCHEDULE;
drop table schedule;
create table schedule(
 	empno varchar2(20),
 	contents varchar2(1000),
 	year number,
 	month number,
 	day number,
 	num number primary key
);

CREATE SEQUENCE CALREG
START WITH 1
NOCACHE;

insert into SCHEDULE(num,empno,contents,year,month,day)
values(numreg_nextval,'300300','오늘은 더워',2016,11,17);