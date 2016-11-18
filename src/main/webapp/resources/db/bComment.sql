drop table bComment;

create table bComment(
seq number, 
empno varchar2(10),
num varchar2(50), 
name varchar2(50), 
comments varchar2(500),
regdate  date
);

CREATE SEQUENCE C_NUMREG
START WITH 1
NOCACHE;


select * from bComment;
insert into bComment(num, name, comments) values('2','옥경','ㅎㅎ');