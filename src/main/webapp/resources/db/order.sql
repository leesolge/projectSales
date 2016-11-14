select * from orders;

create table orders(
	empno varchar(20) primary key,
	procode varchar(20) not null,
	proamount varchar(10) not null,
)