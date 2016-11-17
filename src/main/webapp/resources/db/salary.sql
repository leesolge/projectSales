select * from product
SELECT O.ID AS ID, O.EMPNO AS EMPNO, O.REGDATE AS REGDATE,
			S.NAME AS NAME, S.TEAM AS TEAM, S.AUTH AS AUTH,
			O.PROCODE AS PROCODE, P.PRONAME AS PRONAME, O.PROAMOUNT AS PROAMOUNT,
			((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT) AS PROFIT,
			(P.SELLPRICE*O.PROAMOUNT) AS SALES,
			O.CUSTOMER AS CUSTOMER, O.ADDRESS AS ADDRESS, O.CHECKS AS CHECKS,
			O.DELETED AS DELETED
			FROM ORDERS O, 
			(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) S,
			(SELECT PROCODE, PRONAME, PROAMOUNT, ORIGINPRICE, SELLPRICE FROM PRODUCT) P
			WHERE O.EMPNO=S.EMPNO AND O.PROCODE=P.PROCODE AND CHECKS=1
			AND DELETED=0 AND O.EMPNO='300301'
			AND O.REGDATE>=TO_DATE('20161101000000', 'YYYYMMDDHH24MISS')
			AND O.REGDATE<=TO_DATE('20161130235959', 'YYYYMMDDHH24MISS')
			300301
20161130235959
20161101000000
			
SELECT SUM((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT) AS PROFITSUM
			FROM ORDERS O, 
			(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) S,
			(SELECT PROCODE, PRONAME, PROAMOUNT, ORIGINPRICE, SELLPRICE FROM PRODUCT) P
			WHERE O.EMPNO=S.EMPNO AND O.PROCODE=P.PROCODE AND CHECKS=1
			AND DELETED=0 AND O.EMPNO='300322'
			AND O.REGDATE>=TO_DATE('20161101000000', 'YYYYMMDDHH24MISS')
			AND O.REGDATE<=TO_DATE('20161130235959', 'YYYYMMDDHH24MISS')
			GROUP BY O.EMPNO