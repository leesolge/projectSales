-- 월급

-- 월급 테이블 삭제
DROP TABLE SALARY;
-- 월급 테이블 생성
CREATE TABLE SALARY(
	-- 월급 지급 대상 사번
	EMPNO VARCHAR2(20),
	-- 월급 지급일
	SALARYDATE date,
	-- 월급 총액
	SALARY NUMBER,
	-- 판매 수당
	ALLOWANCE NUMBER,
	-- 매니저 수당
	MANAGER NUMBER,
	-- 소득세
	TAX1 NUMBER,
	-- 주민세
	TAX2 NUMBER,
	-- 실 지급액
	REALS NUMBER
);