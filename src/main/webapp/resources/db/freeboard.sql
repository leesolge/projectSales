create table freeboard(
	num varchar2(5),
	name varchar2(50),
	title varchar2(50),
	content varchar2(500),
	regdate date,
	parent number,
	sort number,
	tab number
);

select * from freeboard;
drop table freeboard;

create sequence freeboard_calreg
start with 1
nocache;

drop sequence freeboard_calreg;