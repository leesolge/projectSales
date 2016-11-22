create table fReply(
	seq number,
	empno varchar2(10),
	num varchar2(50),
	name varchar2(50),
	comments varchar2(500),
	regdate date
);

select * from fReply;
drop table fReply;

create sequence fReply_numreg
start with 1
nocache;

drop sequence fReply_numreg;