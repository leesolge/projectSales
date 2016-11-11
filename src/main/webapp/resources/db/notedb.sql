select * from notedb where receiver = 100;
select * from notedb where sender = 100;
select * from SMEMBER;
(select * from notedb)as m, (select empno, name from SMEMBER) as s
SELECT * FROM NOTEDB WHERE SENDER = 300301 AND DELETED=0 AND title LIKE '%미안%'
SELECT * FROM (SELECT ROWNUM R, NOTENUM, SENDDATE, SENDER, RECEIVER,
TITLE, CONTENT, CHECKS, DELETED FROM NOTEDB WHERE SENDER=300301
ORDER BY SENDDATE) WHERE title LIKE '%미안%'

SELECT * FROM (SELECT ROWNUM C, D.* FROM (
SELECT * FROM
(SELECT N.NOTENUM AS NOTENUM, N.SENDDATE AS SENDDATE,
N.SENDER AS SENDER, S.NAME AS SNAME, S.TEAM AS STEAM,
S.AUTH AS SAUTH, N.RECEIVER AS RECEIVER, R.NAME AS RNAME,
R.TEAM AS RTEAM, R.AUTH AS RAUTH, N.TITLE AS TITLE,
N.CONTENT AS CONTENT, N.CHECKS AS CHECKS,
N.DELETED AS DELETED FROM NOTEDB N,
(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) S,
(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) R
WHERE N.SENDER=S.EMPNO AND N.RECEIVER=R.EMPNO
AND DELETED=1 ORDER BY SENDDATE ASC)) D
WHERE ${field} LIKE #{keyword} ORDER BY C DESC) WHERE C>=#{start} AND C<=#{end}

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

SELECT * FROM (SELECT ROWNUM R, NOTENUM, SENDDATE, SENDER, RECEIVER, TITLE, CONTENT, CHECKS, DELETED FROM (SELECT * FROM NOTEDB WHERE SENDER=#{empno} ORDER BY SENDDATE) WHERE ${field} LIKE #{keyword} AND DELETED=0 ORDER BY R DESC)WHERE R>=#{start} AND R<=#{end}

insert into notedb (notenum, senddate, sender, receiver, title, content, checks, deleted)
values(noteseq.nextval, sysdate, '100', '300301', '물건 개 많이 팔아와라 제발 진짜 내가 소망한다', '내가 사장인데', 0, 0);
insert into notedb (notenum, senddate, sender, receiver, title, content, checks, deleted)
values(noteseq.nextval, sysdate, '300301', '100', '미안', '앞으로도 계속 할게', 0, 0);
select * from SMEMBER where name like '%d%' and auth not like 'ROLE_EE'
		SELECT * FROM (SELECT A.*,ROWNUM R FROM (SELECT * FROM SMEMBER where name LIKE '%d%' AND AUTH NOT LIKE 'ROLE_EE' ORDER BY EMPNO ASC) A) WHERE R >= '1' AND R <= '10'