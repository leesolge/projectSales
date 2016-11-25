
DROP TABLE SCHEDULE;
DROP SEQUENCE CALREG;

CREATE TABLE SCHEDULE(
 	EMPNO VARCHAR2(20),
 	CONTENTS VARCHAR2(1000),
 	YEAR NUMBER,
 	MONTH NUMBER,
 	DAY NUMBER,
 	TITLE VARCHAR2(20),
 	REGDATE  DATE,
 	NUM NUMBER PRIMARY KEY
);

CREATE SEQUENCE CALREG
START WITH 1
NOCACHE;

SELECT * FROM SCHEDULE;