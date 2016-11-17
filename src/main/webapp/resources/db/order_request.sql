CREATE TABLE OREQUEST(
	ONUM NUMBER,
	EMPNO VARCHAR2(20),
	PROCODE VARCHAR2(20),
	OAMOUNT NUMBER,
	OCOMMENT VARCHAR2(500),
	OURL VARCHAR2(500),
	OPRICE NUMBER,	
	REGDATE DATE,
	CHECKS NUMBER,
	DELETED NUMBER	
);

SELECT * FROM OREQUEST;

CREATE SEQUENCE ONUM_SEQ
START WITH 1
NOCACHE;