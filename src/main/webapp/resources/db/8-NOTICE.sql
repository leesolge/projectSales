-- 공지사항

-- 공지사항 테이블 삭제
DROP TABLE NOTICE;
-- 공지사항 글번호 시퀀스 삭제
DROP SEQUENCE NOTICE_SEQ;
-- 공지사항 댓글 테이블 삭제
DROP TABLE NOTICEREPLY;
-- 공지사항 댓글 글번호 시퀀스 삭제
DROP SEQUENCE NOTICEREPLY_SEQ;
-- 공지사항 테이블 생성
CREATE TABLE NOTICE(
	-- 글벊
	NUM NUMBER,
	-- 작성자
	NAME VARCHAR2(50),
	-- 제목
	TITLE  VARCHAR2(500),
	-- 내용
	CONTENT  VARCHAR2(3000),
	-- 등록일
	REGDATE  DATE
);
-- 공지사항 글번호 시퀀스 생성
CREATE SEQUENCE NOTICE_SEQ
START WITH 1
NOCACHE;
-- 공지사항 댓글 테이블 생성
CREATE TABLE NOTICEREPLY(
	-- 댓글 글번호
	REPLYNUM NUMBER,
	-- 참조하는 공지사항 글 번호
	NUM NUMBER, 
	-- 작성자
	EMPNO VARCHAR2(10),
	-- 내용
	REPLY VARCHAR2(1000),
	-- 등록일
	REGDATE DATE
);
-- 댓글 글번호 시퀀스 생성
CREATE SEQUENCE NOTICEREPLY_SEQ
START WITH 1
NOCACHE;