select * from orders
update orders set checks=0
select p.proamount from orders o, product p where o.procode=p.procode and id='300322o26'
select * from product
update product set proamount=proamount-1 where procode=1004

SELECT O.ID AS ID, O.EMPNO AS EMPNO, O.REGDATE AS REGDATE,
			S.NAME AS NAME, S.TEAM AS TEAM, S.AUTH AS AUTH,
			O.PROCODE AS PROCODE, P.PRONAME AS PRONAME, O.PROAMOUNT AS PROAMOUNT,
			((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT) AS PROFIT,
			O.CUSTOMER AS CUSTOMER, O.ADDRESS AS ADDRESS, O.CHECKS AS CHECKS,
			O.DELETED AS DELETED
			FROM ORDERS O, 
			(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) S,
			(SELECT PROCODE, PRONAME, PROAMOUNT, ORIGINPRICE, SELLPRICE FROM PRODUCT) P
			WHERE O.EMPNO=S.EMPNO AND O.PROCODE=P.PROCODE AND CHECKS=0 AND DELETED=0 AND O.ID='300322o26'
CREATE TABLE ORDERS(
	ID VARCHAR2(50) PRIMARY KEY,
	EMPNO VARCHAR2(20),
	PROCODE VARCHAR2(20),
	PROAMOUNT NUMBER,
	REGDATE DATE,
	CUSTOMER VARCHAR2(30),
	ADDRESS VARCHAR2(300),
	CHECKS NUMBER,
	DELETED NUMBER	
);

SELECT * FROM ORDERS;

CREATE SEQUENCE ORDERID
START WITH 1
NOCACHE;