drop table product;
create table product(

	procode varchar2(20) primary key,
	proname varchar2(20) not null,
	proamount varchar2(10) not null,
	sellprice varchar2(20) not null,
	originprice varchar2(20) not null,
	proimage varchar2(2000), 
	proexpla varchar2(500)
);
UPDATE PRODUCT SET PROAMOUNT= (PROAMOUNT+#{oamount}) WHERE PROCODE=#{procode}

select * from PRODUCT

UPDATE PRODUCT SET PROAMOUNT= (PROAMOUNT+'152') WHERE PROCODE='1004'
select * from PRODUCT;
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1004','천사채','4000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1005','천오복분자','5000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1006','천육포','7000','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('6121','이일팔구','2500','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('10084','팔사세요','8700','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('1009','천구과자','23400','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('2104','공사삽','7700','2000','1000',null,'짱이에요짱');
insert into PRODUCT(procode,proname,proamount,sellprice,originprice,proimage,proexpla) 
values('3412','이리오게','9900','2000','1000',null,'짱이에요짱');

UPDATE PRODUCT SET PROCODE='1000', PRONAME='2132',PROAMOUNT='1236',SELLPRICE='1004',
  		ORIGINPRICE='1004',PROEXPLA='1004'  WHERE PROCODE='1005'    