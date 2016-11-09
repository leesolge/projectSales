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
			</tr>

			<!-- result는 contoller의 addObject로 부터 가져온다. -->

			<tr>
				<td>${vo.empno}</td>
				<td>${vo.name}</td>
				<td>${vo.pwd}</td>
				<td>${vo.gender}</td>
				<td>${vo.address}</td>
				<td>${vo.phone}</td>
				<td>${vo.email}</td>
				<td>${vo.auth}</td>
				<td>${vo.account}</td>
				<td>${vo.team}</td>
			</tr>

		</table>
		<div class="w3-container w3-center">
			<img src="/erp/resources/portraits/${vo.portrait}" height="300">
		</div>

		<input type="button" value="정보수정" class="w3-btn w3-round-large"
			onclick="window.location='/erp/admin/member_update?empno=${vo.empno}'"> 
		<input type="button" value="퇴사" class="w3-btn w3-round-large"
			onclick="window.location='/erp/admin/member_delete?empno=${vo.empno}'">
	</div>
</body>
</html>