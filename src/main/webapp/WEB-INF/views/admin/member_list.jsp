<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>

	<div class="w3-container">
		<table class="w3-table w3-centered">
			<tr>
				<td>EMPNO</td>
				<td>NAME</td>
				<td>PWD</td>
				<td>GENDER</td>
				<td>ADDRESS</td>
				<td>PHONE</td>
				<td>EMAIL</td>
				<td>AUTH</td>
				<td>ACCOUNT</td>
				<td>TEAM</td>
				<td>CONTENT</td>
			</tr>

			<!-- result는 contoller의 addObject로 부터 가져온다. -->
			<c:forEach items="${result}" var="member">
				<tr>
					<td>${member.empno}</td>
					<td>${member.name}</td>
					<td>${member.pwd}</td>
					<td>${member.gender}</td>
					<td>${member.address}</td>
					<td>${member.phone}</td>
					<td>${member.email}</td>
					<td>${member.auth}</td>
					<td>${member.account}</td>
					<td>${member.team}</td>
					<td><input type="button" value="Content"	class="w3-btn w3-round-large"
						onclick="window.location='/erp/admin/Content?empno=${member.empno}'"></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>