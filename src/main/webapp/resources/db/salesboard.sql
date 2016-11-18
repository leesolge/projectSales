select * from salesBoard;

drop table salesBoard;

CREATE TABLE SALESBOARD
  (
  NUM NUMBER, 
  NAME VARCHAR2(50), 
  TITLE  VARCHAR2(50), 
  CONTENT  VARCHAR2(500), 
  REGDATE  DATE,
  PARENT  NUMBER, 
  SORT  NUMBER, 
  TAB  NUMBER
  );

CREATE SEQUENCE calreg
START WITH 1
NOCACHE;

select * from (select rownum r, d.* from (select * from SALESBOARD where title like '%3%' order by num desc) d) where r>=1 and r<=2 order by r desc

select * from (select rownum r, d.* from (select * from SALESBOARD where #{field} like #{word} order by num desc) d) where r <![CDATA[>=]]> #{start} and r <![CDATA[<=]]> #{end}

select * from
	 		(select A.*,ROWNUM r from 
	 		 	(select * from salesBoard order by parent desc, sort) A
	 	 	)
 	 	where r >=1 and r <=3