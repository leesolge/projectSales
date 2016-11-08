select * from notedb;
select * from SMEMBER;
update notedb set deleted = 0;
SELECT * FROM (SELECT ROWNUM R, NOTENUM, SENDDATE, SENDER, RECEIVER, TITLE, CONTENT, CHECKS, DELETED FROM NOTEDB WHERE RECEIVER='100') WHERE title like '%%' AND R >= 1 AND R <= 2 AND DELETED=0 ORDER BY R DESC
alter table notedb add deleted number;
100 300301
create table notedb(
	notenum number primary key,
	senddate date,
	sender varchar(20),
	receiver varchar(20),
	title varchar(200),
	content varchar(2000),
	checks number,
	deleted number
);

create sequence noteseq
start with 1
nocache;

insert into notedb (notenum, senddate, sender, receiver, title, content, checks)
values(noteseq.nextval, sysdate, '100', '300301', '왜 반말하냐', '내가 사장인데', 0);
insert into notedb (notenum, senddate, sender, receiver, title, content, checks)
values(noteseq.nextval, sysdate, '300301', '100', '미안', '앞으로도 계속 할게', 0);