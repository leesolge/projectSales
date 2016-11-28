INSERT INTO LEDGER (ID, EMPNO, REGDATE, ENABLE,
SORT, CONTENT, AMOUNT, MONEY, ETC) 
VALUES(TO_CHAR(LEDGERSEQ.NEXTVAL),
#{empno}, SYSDATE, 1, #{sort}, #{content}, #{amount},
(SELECT MONEY FROM LEDGER WHERE ID = (SELECT MAX(ID) FROM LEDGER))+#{sortamount},
#{etc})
UPDATE LEDGER SET SORT=${sort}, CONTENT=#{content}, AMOUNT=#{amount},
MONEY=MONEY+#{sortamount}+{pastamount}, ETC=#{etc}
WHERE ID=#{id}
(SELECT * FROM LEDGER WHERE ID = (SELECT ID FROM LEDGER))
UPDATE LEDGER SET SORT=${sort}, CONTENT=#{content}, AMOUNT=#{amount},
MONEY=MONEY+#{sortamount}+{pastamount}, ETC=#{etc}
WHERE ID=#{id}

select * from ledger where id=15
UPDATE LEDGER SET SORT='수입', CONTENT='그런 게 있음', AMOUNT=211,
MONEY=MONEY+500+2333, ETC='none'
WHERE ID>1
SELECT rownum, ledger.* FROM LEDGER order by id desc
SELECT * FROM (SELECT ROWNUM R, L.*, S.NAME FROM LEDGER L, SMEMBER S WHERE L.EMPNO=S.EMPNO
			ORDER BY REGDATE DESC)
			
SELECT L.*, S.NAME FROM LEDGER L, SMEMBER S WHERE L.EMPNO=S.EMPNO AND ID=
ORDER BY REGDATE DESC

SELECT COUNT(*) FROM (SELECT ROWNUM R, L.*, S.NAME FROM LEDGER L, SMEMBER S WHERE L.EMPNO=S.EMPNO ORDER BY ID DESC)
SELECT * FROM (SELECT ROWNUM R, L.*, S.NAME FROM LEDGER L, SMEMBER S WHERE L.EMPNO=S.EMPNO ORDER BY ID DESC) WHERE R>=1 AND R<=10
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
SELECT MONEY FROM LEDGER WHERE ID = (SELECT MAX(TO_NUMBER(ID)) FROM LEDGER)
SELECT L.*, S.NAME FROM LEDGER L, SMEMBER S WHERE L.EMPNO=S.EMPNO ORDER BY REGDATE DESC

INSERT INTO LEDGER (ID, EMPNO, REGDATE, ENABLE, SORT, CONTENT, AMOUNT, MONEY, ETC)
VALUES(TO_CHAR(LEDGERSEQ.NEXTVAL), 100, SYSDATE, 0, '수입', '초기 자금', 5000000000, 5000000000, '초기 자금 50억 입력')
INSERT INTO LEDGER (ID, EMPNO, REGDATE, ENABLE, SORT, CONTENT, AMOUNT, MONEY, ETC)
VALUES(TO_CHAR(LEDGERSEQ.NEXTVAL), 100, SYSDATE, 1, '수입', '100만원 수입', 1000000, (SELECT MONEY FROM LEDGER WHERE ID = (SELECT MAX(ID) FROM LEDGER))+1000000, '테스트')



CREATE SEQUENCE LEDGERSEQ
START WITH 1
NOCACHE;