select * from salesBoard;
	
CREATE TABLE salesBoard
  (
  num NUMBER, 
  NAME VARCHAR2(50), 
  title  VARCHAR2(50), 
  content  VARCHAR2(50), 
  regdate  date,
  parent  NUMBER, 
  SORT  NUMBER, 
  tab  NUMBER
  );

CREATE SEQUENCE NUMREG
START WITH 1
NOCACHE;