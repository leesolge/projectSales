<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
		ORIGINPRICE : <input type="text" name="originprice" ><br><hr>
		IMAGE : <input type="file" name="file" required><br><hr>
	    EXPLA : <input type="text" name="proexpla"><br><hr>
	    
	    <input type="submit" name="confirm" value="추가완료">
		<input type="reset" name="reset" value="다시쓰기">
		<input type="button" value="취소" onclick="redirect:/product/produtList"> 
	</form>
</body>
</html>