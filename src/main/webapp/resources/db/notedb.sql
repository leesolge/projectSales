select * from notedb;
select * from SMEMBER;
100 300301
create table notedb(
	notenum number primary key,
	senddate date,
	sender varchar(20),
	receiver varchar(20),
	title varchar(200),
	content varchar(2000),
	checks number
);

create sequence noteseq
start with 1
nocache;

insert into notedb (notenum, senddate, sender, receiver, title, content, checks)
values(noteseq.nextval, sysdate, '100', '300301', '왜 반말하냐', '내가 사장인데', 0);
insert into notedb (notenum, senddate, sender, receiver, title, content, checks)
values(noteseq.nextval, sysdate, '300301', '100', '미안', '앞으로도 계속 할게', 0);