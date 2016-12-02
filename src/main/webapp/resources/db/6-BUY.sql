-- 구매

-- 구매 테이블 삭제
DROP TABLE BUY;
-- 구매 고유번호 시퀀스 삭제
DROP SEQUENCE BUY_SEQ;
-- 구매 테이블 생성
CREATE TABLE BUY(
	-- 구매 고유번호
	BUYNUM NUMBER,
	-- 구매 요청자 사번
	EMPNO VARCHAR2(20),
	-- 제품코드
	PROCODE VARCHAR2(20),
	-- 수량
	AMOUNT VARCHAR2(10),
	-- 관련 내용
	BUYCOMMENT VARCHAR2(500),
	-- 등록날짜
	REGDATE DATE,
	-- 승인날짜
	APPDATE DATE,
	-- 진행도(0-요청 / 1-종합 / 2-승인)
	BUYSTEP NUMBER,
	-- 삭제여부
	DELETED NUMBER	
);
-- 구매 고유번호 시퀀스 생성
CREATE SEQUENCE BUY_SEQ
START WITH 1
NOCACHE;