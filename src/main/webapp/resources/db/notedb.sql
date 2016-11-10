select * from notedb where receiver = 100;
select * from notedb where sender = 100;
select * from SMEMBER;
update notedb set deleted = 0;
SELECT * FROM (SELECT ROWNUM R, NOTENUM, SENDDATE, SENDER, RECEIVER, TITLE, CONTENT, CHECKS, DELETED FROM NOTEDB WHERE SENDER = 100 ORDER BY SENDDATE DESC) WHERE DELETED=0
alter table notedb add deleted number;
SELECT COUNT(*) FROM NOTEDB WHERE RECEIVER = 100 AND DELETED=0
SELECT COUNT(*) FROM NOTEDB WHERE RECEIVER = 100 AND DELETED=0
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

insert into notedb (notenum, senddate, sender, receiver, title, content, checks, deleted)
values(noteseq.nextval, sysdate, '100', '300301', '물건 개 많이 팔아와라 제발 진짜 내가 소망한다', '내가 사장인데', 0, 0);
insert into notedb (notenum, senddate, sender, receiver, title, content, checks, deleted)
values(noteseq.nextval, sysdate, '300301', '100', '미안', '앞으로도 계속 할게', 0, 0);
select * from SMEMBER where name like '%d%' and auth not like 'ROLE_EE'
		SELECT * FROM (SELECT A.*,ROWNUM R FROM (SELECT * FROM SMEMBER where name LIKE '%d%' AND AUTH NOT LIKE 'ROLE_EE' ORDER BY EMPNO ASC) A) WHERE R >= '1' AND R <= '10'