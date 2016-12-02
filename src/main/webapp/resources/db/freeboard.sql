select * from freeboard;
select * from freeboardReply;

drop table freeboard;
drop sequence freeboard_seq;
drop table freeboardReply;
drop sequence freeboardReply_seq;
drop sequence freeboardReReply_seq;

create table freeboard(
	num number primary key, -- 게시글 쓸때마다 sequence(freeboard_seq)를 사용해서 1씩 증가함.
	team varchar2(30) not null, -- 어느 팀에 속하는지 구분하기 위해.
	name varchar2(50) not null, -- 게시글 쓴 사람 이름
	title varchar2(500) not null, -- 게시글 제목
	content varchar2(3000) not null, -- 게시글 내용
	regdate date -- 게시글 쓴 시간
);

create sequence freeboard_seq
start with 1
nocache;

create table freeboardReply(
	replynum number, -- 댓글을 쓸때마다 sequence(freeboardReply_seq)에 의해 1씩 증가함, 대댓글을 쓰면 댓글의 replynum을 가져옴
	num number, -- 게시글의 num을 가져옴(어느 게시글의 댓글,대댓글인지 구분하기 위해)
	empno varchar2(10) not null, -- 댓글,대댓글 쓴 사람
	reply varchar2(1000) not null, --댓글,대댓글 내용
	regdate date, -- 댓글,대댓글 쓴 시간
	sort number, -- 댓글이면 0, 대댓글이면 1
	parent number, -- 댓글이면 게시글의 num을 가져옴, 대댓글이면 replynum(댓글번호)을 가져옴
	child number -- 댓글은 0, 대댓글을 쓸때마다 sequence(freeboardReReply_seq)에 의해 1씩 증가함
);

insert into freeboardReply(replynum, num, empno, reply, regDate, sort, parent, child)
		values(1, 1, '1', '1', sysdate, 1, #{num}, freeboardReReply_seq.nextval)

create sequence freeboardReply_seq
start with 1
nocache;

create sequence freeboardReReply_seq
start with 1
nocache;