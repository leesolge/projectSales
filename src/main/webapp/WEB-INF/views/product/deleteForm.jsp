<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<form action="/erp/product/delete" method="post">
		삭제할 PRODUCT CODE : <input type="text" name="procode"> 
		<input type="submit" value="삭제">
		<input type="reset" value="취소">
	</form>
</body>
</html>