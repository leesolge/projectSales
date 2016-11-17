<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>

	<div class="w3-container w3-center" >
		<h2>구매요청 [${count }건]</h2>
		<table class="w3-table w3-centered">
			<tr>
				<th>구분</th>
				<th>등록날짜</th>
				<th>이름</th>
				<th>요청건</th>
				<th>수정</th>
				<th>취소</th>
			</tr>
			<c:forEach var="alist" items="${list}">
				<tr>
					<td>${alist.onum}</td>
					<td>${alist.regdate}</td>
					<td>${alist.empno}</td>
					<td>${alist.ocomment}</td>
					<td>수정</td>
					<td>취소</td>					
				</tr>
			</c:forEach>
		</table>
		<a href="/erp/employee/buy_request">등록</a>
	</div>
</body>
</html>