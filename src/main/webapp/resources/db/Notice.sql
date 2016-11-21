DROP TABLE SALESBOARD;
DROP SEQUENCE CALREG;
DROP TABLE BCOMMENT;
DROP SEQUENCE C_NUMREG;

CREATE TABLE NOTICE(
  NUM NUMBER, 
  NAME VARCHAR2(50), 
  TITLE  VARCHAR2(500), 
  CONTENT  VARCHAR2(3000), 
  REGDATE  DATE
  );

CREATE SEQUENCE NOTICE_SEQ
START WITH 1
NOCACHE;

CREATE TABLE NOTICEREPLY(
REPLYNUM NUMBER,
NUM NUMBER, 
EMPNO VARCHAR2(10), 
REPLY VARCHAR2(1000),
REGDATE  DATE
);

CREATE SEQUENCE NOTICEREPLY_SEQ
START WITH 1
NOCACHE;
