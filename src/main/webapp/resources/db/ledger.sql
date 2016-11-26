SELECT * FROM LEDGER
CREATE TABLE LEDGER(
	--고유번호
	ID VARCHAR2(20) PRIMARY KEY,
	
	--등록자
	EMPNO VARCHAR2(20),
	
	--등록날짜
	REGDATE DATE,
	
	--수정가능 : 1일 경우 수정 가능
	ENABLE VARCHAR2(10),
	
	--수입/지출 여부 : 수입 / 지출 로 표기
	SORT VARCHAR2(10),
	
	--내역
	CONTENT VARCHAR2(200),
	
	--금액
	AMOUNT NUMBER,
	
	--자산
	MONEY NUMBER,
	
	--비고
	ETC VARCHAR2(200)
)
SELECT MONEY FROM LEDGER WHERE ID = (SELECT MAX(ID) FROM LEDGER)
SELECT L.*, S.NAME FROM LEDGER L, SMEMBER S WHERE L.EMPNO=S.EMPNO ORDER BY REGDATE DESC

INSERT INTO LEDGER (ID, EMPNO, REGDATE, ENABLE, SORT, CONTENT, AMOUNT, MONEY, ETC)
VALUES(TO_CHAR(LEDGERSEQ.NEXTVAL), 100, SYSDATE, 0, '수입', '초기 자금', 5000000000, 5000000000, '초기 자금 50억 입력')
INSERT INTO LEDGER (ID, EMPNO, REGDATE, ENABLE, SORT, CONTENT, AMOUNT, MONEY, ETC)
VALUES(TO_CHAR(LEDGERSEQ.NEXTVAL), 100, SYSDATE, 1, '수입', '100만원 수입', 1000000, (SELECT MONEY FROM LEDGER WHERE ID = (SELECT MAX(ID) FROM LEDGER))+1000000, '테스트')

CREATE SEQUENCE LEDGERSEQ
START WITH 1
NOCACHE;