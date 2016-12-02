-- 판매

-- 판매 테이블 삭제
DROP TABLE ORDERS;
-- 판매 고유번호 시퀀스 삭제
DROP SEQUENCE ORDERID;
-- 판매 테이블 생성
CREATE TABLE ORDERS(
	-- 판매 고유번호
	ID VARCHAR2(50) PRIMARY KEY,
	-- 판매자 사번
	EMPNO VARCHAR2(20),
	-- 판매 제품코드
	PROCODE VARCHAR2(20),
	-- 판매 수량
	PROAMOUNT NUMBER,
	-- 등록날짜
	REGDATE DATE,
	-- 고객명
	CUSTOMER VARCHAR2(30),
	-- 고객주소
	ADDRESS VARCHAR2(300),
	-- 승인 여부(결제 여부)
	CHECKS NUMBER,
	-- 삭제 여부(미사용)
	DELETED NUMBER	
);
-- 판매 고유번호 시퀀스 생성
CREATE SEQUENCE ORDERID
START WITH 1
NOCACHE;