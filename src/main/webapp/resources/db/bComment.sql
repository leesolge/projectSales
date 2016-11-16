drop table bComment;

create table bComment(
num varchar2(50), 
name varchar2(50), 
comments varchar2(500),
regdate  date
);

select * from bComment;
insert into bComment(num, name, comments) values('2','옥경','ㅎㅎ');