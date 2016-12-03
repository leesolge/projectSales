-- 회원
select * from smember;
-- 회원 테이블 삭제
DROP TABLE SMEMBER;
-- 사번 시퀀스 삭제
DROP SEQUENCE NUMREGISTER;
-- 회원 테이블 생성
CREATE TABLE SMEMBER(
	-- 사번
	EMPNO VARCHAR2(10) PRIMARY KEY,
	-- 비밀번호
	PWD VARCHAR2(30) NOT NULL,
	-- 사원명
	NAME VARCHAR2(20) NOT NULL,
	-- 성별
	GENDER VARCHAR2(10),
	-- 생년월일
	BIRTH DATE,
	-- 입사년월일
	JOIN DATE,
	-- 주소
	ADDRESS VARCHAR2(180),
	-- 전화번호
	PHONE VARCHAR2(20) NOT NULL,
	-- 이메일
	EMAIL VARCHAR2(30),
	-- 권한 / 직책 (EE-입사예정, EMPLOYEE-사원, BUDGET-자재팀, MANAGER-팀장, ADMIN-관리인)
	AUTH VARCHAR2(20) NOT NULL,
	-- 증명사진
	PORTRAIT VARCHAR2(200),
	-- 계좌
	ACCOUNT VARCHAR2(50) NOT NULL,
	-- 소속
	TEAM VARCHAR2(20) NOT NULL
);
-- 사번 시퀀스 생성 
CREATE SEQUENCE NUMREGISTER
START WITH 300300
NOCACHE;
-- 관리자 아이디 등록
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
('100', 'oracle', '관리자', '남', date '1972-10-12', date '2016-7-1',
'유스페이스2-A', '010-0000-0000', 'anseoklee@gmail.com', 'ROLE_ADMIN', 'port-admin.jpg', '10-71024883', '관리팀');
-- 영업1팀장 아이디 등록 (300300)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '일팀장', '여', date '1980-10-12', date '2016-8-1',
'경기 성남시 분당구 백현동 582-7', '010-0000-0001', 'manager1@gmail.com', 'ROLE_MANAGER', 'port-manager.png', '10-71024884', '영업1팀');
-- 영업2팀장 아이디 등록 (300301)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '이팀장', '남', date '1983-5-15', date '2016-8-1',
'경기 성남시 분당구 백현동 582-5', '010-0000-0002', 'manager2@gmail.com', 'ROLE_MANAGER', 'port-manager.png', '10-71024885', '영업2팀');
-- 영업3팀장 아이디 등록 (300302)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '삼팀장', '여', date '1989-4-19', date '2016-8-1',
'경기 성남시 분당구 백현동 582-1', '010-0000-0003', 'manager3@gmail.com', 'ROLE_MANAGER', 'port-manager.png', '10-71024886', '영업3팀');
-- 자재팀 아이디 등록 (300303)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '김자재', '남', date '1987-10-29', date '2016-8-1',
'경기 성남시 분당구 백현동 587-1', '010-0000-0004', 'budget1@gmail.com', 'ROLE_BUDGET', 'port-bud.png', '10-71024887', '자재팀');
-- 자재팀 아이디 등록 (300304)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '이자재', '여', date '1988-8-8', date '2016-8-1',
'경기 성남시 분당구 백현동 587-2', '010-0000-0005', 'budget2@gmail.com', 'ROLE_BUDGET', 'port-bud.png', '10-71024888', '자재팀');
-- 영업1팀 아이디 등록 (300305)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '일사원', '남', date '1990-8-24', date '2016-9-1',
'경기 성남시 분당구 백현동 584-5', '010-0000-0006', 'employee1@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024889', '영업1팀');
-- 영업1팀 아이디 등록 (300306)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '이사원', '여', date '1992-2-22', date '2016-9-2',
'경기 성남시 분당구 백현동 222-2', '010-0000-0022', 'employee2@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024822', '영업1팀');
-- 영업1팀 아이디 등록 (300307)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '삼사원', '남', date '1989-3-26', date '2016-9-1',
'경기 성남시 분당구 백현동 542-6', '010-0000-0026', 'employee3@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024825', '영업1팀');
-- 영업2팀 아이디 등록 (300308)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '사사원', '여', date '1988-6-6', date '2016-9-1',
'경기 성남시 분당구 백현동 546-2', '010-0000-0030', 'employee4@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024826', '영업2팀');
-- 영업2팀 아이디 등록 (300309)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '오사원', '남', date '1985-7-22', date '2016-9-1',
'경기 성남시 분당구 백현동 548-2', '010-0000-0031', 'employee5@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024828', '영업2팀');
-- 영업2팀 아이디 등록 (300310)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '육사원', '여', date '1981-4-29', date '2016-9-1',
'경기 성남시 분당구 백현동 548-3', '010-0000-0034', 'employee6@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024829', '영업2팀');
-- 영업3팀 아이디 등록 (300311)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '칠사원', '남', date '1959-3-30', date '2016-9-1',
'경기 성남시 분당구 백현동 629-3', '010-0000-0100', 'employee7@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024900', '영업3팀');
-- 영업3팀 아이디 등록 (300312)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '팔사원', '여', date '1989-3-30', date '2016-9-1',
'경기 성남시 분당구 백현동 630-7', '010-0000-0104', 'employee8@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024905', '영업3팀');
-- 영업3팀 아이디 등록 (300313)
INSERT INTO SMEMBER
(EMPNO, PWD, NAME, GENDER, BIRTH, JOIN,
 ADDRESS, PHONE, EMAIL, AUTH, PORTRAIT, ACCOUNT, TEAM) VALUES
(NUMREGISTER.NEXTVAL, 'oracle', '팔사투', '남', date '1990-1-31', date '2016-9-1',
'경기 성남시 분당구 백현동 630-7', '010-0000-0105', 'employee9@gmail.com', 'ROLE_EMPLOYEE', 'port-empl.png', '10-71024908', '영업3팀');