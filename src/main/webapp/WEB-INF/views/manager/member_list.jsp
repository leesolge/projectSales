<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
	<!-- Title -->
	<div class="w3-container w3-center">
		<h2>사원명부 [${count }건]</h2>
	</div>


	<div class="w3-container" align="center">

		<!-- List -->
		<table class="w3-table w3-centered">
			<tr>
				<th>EMPNO</th>
				<th>NAME</th>
				<th>PWD</th>
				<th>GENDER</th>
				<th>ADDRESS</th>
				<th>PHONE</th>
				<th>EMAIL</th>
				<th>AUTH</th>
				<th>ACCOUNT</th>
				<th>TEAM</th>
				<th>CONTENT</th>
			</tr>
			<!-- result는 contoller의 addObject로 부터 가져온다. -->
			<c:forEach items="${list}" var="member">
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
					<td><input type="button" value="Content"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/manager/member_info?empno=${member.empno}'">
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
</body>
</html>