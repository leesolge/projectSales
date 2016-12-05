<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
	<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-colors-food.css">
	
	<body>${modify.id}
		<form method="post" action="/erp/ledger/modify">
			<input type="hidden" name="id" value="${modify.id}">
			<input type="hidden" name="empno" value="${modify.empno}">
			<input type="hidden" name="regdate" value="${modify.regdate}">
			<input type="hidden" name="pastsort" value="${modify.sort}">
			<input type="hidden" name="pastamount" value="${modify.amount}">
			등록자 : ${modify.empno} ${modify.name}<br>
			내용 : <input type="text" maxlength="50" name="content" required="required" value="${modify.content}"><br>
			구분 : <select name="sort">
				<c:if test="${modify.sort=='수입'}"><option value="수입" selected="selected">수입</option></c:if>
				<c:if test="${modify.sort!='수입'}"><option value="수입">수입</option></c:if>
				<c:if test="${modify.sort=='지출'}"><option value="지출" selected="selected">지출</option></c:if>
				<c:if test="${modify.sort!='지출'}"><option value="지출">지출</option></c:if>
				</select><br>
			금액 : <input value="${modify.amount}" type="number" name="amount" required="required"><br>
			비고 : <input value="${modify.etc}"type="text" name="etc" maxlength="50"><br>
			<input type="submit" value="수정">&nbsp;
		</form>
			<button onclick="location.href='/erp/ledger/list'">목록</button>
	</body>
</html>