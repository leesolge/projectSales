
create table product(

	procode varchar2(20) primary key,
	proname varchar2(20) not null,
	proamount varchar2(10) not null,
	sellprice varchar2(20) not null,
	originprice varchar2(20) not null,
	proimage varchar2(2000), 
	proexpla varchar2(500)
	
);

select * from PRODUCT;
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1004','땡땡땡','1000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1005','asd','1000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1006','erwqwr','1000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('6121','땡땡땡','1000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('10084','qtwer','1000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1009','qwt','1000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('2104','땡땡땡','1000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('3412','땡땡땡','1000','2000','1000',null,'짱이에요짱');