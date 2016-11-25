select * from freeboard;
select * from freeboardReply;

drop table freeboard;
drop sequence freeboard_seq;
drop table freeboardReply;
drop sequence freeboardReply_seq;
drop sequence freeboardReReply_seq;

create table freeboard(
	num number,
	name varchar2(50),
	title varchar2(500),
	content varchar2(3000),
	regdate date
);

create sequence freeboard_seq
start with 1
nocache;

create table freeboardReply(
	replynum number,
	num number,
	empno varchar2(10),
	reply varchar2(1000),
	regdate date,
	sort number,
	parent number,
	child number
);

insert into freeboardReply(replynum, num, empno, reply, regDate, sort, parent, child)
		values(1, 1, '1', '1', sysdate, 1, #{num}, freeboardReReply_seq.nextval)

create sequence freeboardReply_seq
start with 1
nocache;

create sequence freeboardReReply_seq
start with 1
nocache;