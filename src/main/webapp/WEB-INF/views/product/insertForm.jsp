<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
 <h3>PRODUCT ADD</h3><br><br><br><br><hr>
	<form action="/erp/product/insert" method="post" enctype="multipart/form-data">
		
		CODE : <input type="text" name="procode"><br><hr>
		NAME : <input type="text" name="proname"><br><hr>
		AMOUNT : <input type="text" name="proamount"><br><hr>
	    SELLPRICE : <input type="text" name="sellprice"><br><hr>
		ORIGINPRICE : <input type="text" name="originprice"><br><hr>
		IMAGE : <input type="file" name="file"><br><hr>
	    EXPLA : <input type="text" name="proexpla"><br><hr>
	    
	    <input type="submit" name="confirm" value="�߰��Ϸ�">
		<input type="reset" name="reset" value="�ٽþ���">
		<input type="button" value="���" onclick="redirect:/product/produtList"> 
	</form>
</body>
</html>