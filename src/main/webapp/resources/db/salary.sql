select * from smember where team like '%영업%' or team = '자재팀';
drop table salary
select * from salary where salarydate=to_date('20160901000000','YYYYMMDDHH24MISS')
SELECT * FROM SALARY WHERE EMPNO=300301 ORDER BY SALARYDATE DESC
insert into salary
(empno, salarydate, salary, allowance, manager, tax1, tax2, reals)
values(300301, '2016-09-01', 10000, 10000, 0, 0, 0, 10000)
select * from salary
s, smember m where s.empno=m.empno;
select * from smember
CREATE TABLE SALARY(
	EMPNO VARCHAR2(20),
	SALARYDATE date,
	SALARY NUMBER,
	ALLOWANCE NUMBER,
	MANAGER NUMBER,
	TAX1 NUMBER,
	TAX2 NUMBER,
	REALS NUMBER
)

SELECT SUM(MANAGE) FROM
			(SELECT O.ID AS ID, O.EMPNO AS EMPNO, O.REGDATE AS REGDATE,
			S.NAME AS NAME, S.TEAM AS TEAM, S.AUTH AS AUTH,
			O.PROCODE AS PROCODE, P.PRONAME AS PRONAME, O.PROAMOUNT AS PROAMOUNT,
			((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT) AS PROFIT,
			((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT)*0.1 AS MANAGE,
			O.CUSTOMER AS CUSTOMER, O.ADDRESS AS ADDRESS, O.CHECKS AS CHECKS,
			O.DELETED AS DELETED FROM ORDERS O, 
			(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) S,
			(SELECT PROCODE, PRONAME, PROAMOUNT, ORIGINPRICE, SELLPRICE FROM PRODUCT) P
			WHERE O.EMPNO=S.EMPNO AND O.PROCODE=P.PROCODE AND CHECKS=1
			AND DELETED=0 AND S.TEAM='영업1팀' AND S.AUTH!='ROLE_MANAGER'
			AND O.REGDATE>TO_DATE('20161101000000', 'YYYYMMDDHH24MISS')
			AND O.REGDATE<TO_DATE('20161201000000', 'YYYYMMDDHH24MISS'))


INSERT INTO SALARY (EMPNO, SALARYDATE, SALARY, TAX1, TAX2, REALS)
VALUES(#{empno}, TO_DATE(#{salarydate}, 'YYYYMMDDHH24MISS'),
	#{salary}, #{tax1}, #{tax2}, #{reals})
select * from product;
drop table salary
select * from salary

select * from orders where checks=1 and empno=300301

select * from salary
			select sum(profit) from
			(SELECT O.ID AS ID, O.EMPNO AS EMPNO, O.REGDATE AS REGDATE,
			S.NAME AS NAME, S.TEAM AS TEAM, S.AUTH AS AUTH,
			O.PROCODE AS PROCODE, P.PRONAME AS PRONAME, O.PROAMOUNT AS PROAMOUNT,
			((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT) AS PROFIT,
			O.CUSTOMER AS CUSTOMER, O.ADDRESS AS ADDRESS, O.CHECKS AS CHECKS,
			O.DELETED AS DELETED
			FROM ORDERS O, 
			(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) S,
			(SELECT PROCODE, PRONAME, PROAMOUNT, ORIGINPRICE, SELLPRICE FROM PRODUCT) P
			WHERE O.EMPNO=S.EMPNO AND O.PROCODE=P.PROCODE AND CHECKS=1
			AND DELETED=0 AND O.EMPNO='300301'
			AND O.REGDATE>TO_DATE('20161001000000', 'YYYYMMDDHH24MISS')
			AND O.REGDATE<TO_DATE('20161030235959', 'YYYYMMDDHH24MISS'))
			300301
20161130235959
20161101000000
	SELECT * FROM
			(SELECT O.ID AS ID, O.EMPNO AS EMPNO, O.REGDATE AS REGDATE,
			S.NAME AS NAME, S.TEAM AS TEAM, S.AUTH AS AUTH,
			O.PROCODE AS PROCODE, P.PRONAME AS PRONAME, O.PROAMOUNT AS PROAMOUNT,
			((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT) AS PROFIT,
			((P.SELLPRICE-P.ORIGINPRICE)*O.PROAMOUNT)*0.1 AS MANAGER,
			O.CUSTOMER AS CUSTOMER, O.ADDRESS AS ADDRESS, O.CHECKS AS CHECKS,
			O.DELETED AS DELETED FROM ORDERS O, 
			(SELECT EMPNO, NAME, TEAM, AUTH FROM SMEMBER) S,
			(SELECT PROCODE, PRONAME, PROAMOUNT, ORIGINPRICE, SELLPRICE FROM PRODUCT) P
			WHERE O.EMPNO=S.EMPNO AND O.PROCODE=P.PROCODE AND CHECKS=1
			AND DELETED=0 AND S.TEAM='영업1팀' AND S.AUTH!='ROLE_MANAGER'
			
			AND O.REGDATE>TO_DATE('20161101000000', 'YYYYMMDDHH24MISS')
			AND O.REGDATE<TO_DATE('20161201000000', 'YYYYMMDDHH24MISS'))
