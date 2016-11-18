<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	<form action="/erp/employee/buy_request_content" name="requestContent" method="post">
		<input type="hidden" name="onum" value="0">
	</form>
	<div class="w3-container w3-center">
		<h2>구매요청 [${count }건]</h2>
		<table class="w3-table w3-centered">
			<tr>
				<th>구분</th>
				<th>등록날짜</th>
				<th>이름</th>
				<th>요청건</th>
				<th>내용보기</th>
				<th>취소</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.onum}</td>
					<td>${list.regdate}</td>
					<td>${list.empno}</td>
					<td>${list.title}</td>					
					<td><a href="javascript:content('${list.onum}')">내용</a></td>
					<td>취소</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

<script type="text/javascript">	
	function content(num) {
		var requestContent = document.requestContent;
		requestContent.onum.value = num;
		requestContent.submit();
	}
</script>
</html>