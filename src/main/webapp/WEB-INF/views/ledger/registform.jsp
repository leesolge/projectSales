<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<form method="post" action="/erp/ledger/regist">
			<input type="hidden" name="empno" value="${empno}">
			<input type="hidden" name="enable" value="1">
			등록자 : ${empno} ${name}<br>
			내용 : <input type="text" maxlength="50" name="content" required="required"><br>
			구분 : <select name="sort"><option value="수입">수입</option><option value="지출">지출</option></select><br>
			금액 : <input type="number" name="amount" required="required"><br>
			비고 : <input type="text" name="etc" maxlength="50"><br>
			<input type="submit" value="등록">&nbsp;<input type="reset" value="다시 작성">&nbsp;
			<button onclick="location.href='/erp/ledger/list'">목록</button>
		</form>
	</body>
</html>