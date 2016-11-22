<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<body>
	<div class="w3-container w3-center">
		<form action="/erp/employee/buy_request_manager" method="post">
			<h2>자재충원요청</h2>
			<table class="w3-table w3-centered">
				<tr>
					<th>등록자 사번</th>
					<td><input type="hidden" name="empno" value="${memberInfo.empno}"> ${memberInfo.empno}</td>
					<th>등록자 부서</th>
					<td>${memberInfo.team}</td>
				</tr>
			</table>
			
			<table class="order_list w3-table w3-centered">
				<tr>
					<th>요청상품</th>
					<th>주문수량</th>
					<th>주문사유</th>					
					<th>주문일</th>
				</tr>
				<c:forEach var="list" items="${list}">
				<tr>
				<td>${list.procode }</td>
				<td>${list.amount }</td>
				<td>${list.buycomment }</td>
				<td>${list.regdate }</td>
				</tr>
				</c:forEach>
			</table>
			<input class="w3-btn page_button"  type="submit" value="수정" >
		</form>
	</div>
</body>
</html>