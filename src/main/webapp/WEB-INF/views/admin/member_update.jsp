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
	<form method="post" action="Admin_Update_SMember" ">
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
				<td><input type="hidden" name="empno" value="${vo.empno}">${vo.empno}</td>
				<td>${vo.name}</td>
				<td>${vo.pwd}</td>
				<td>${vo.gender}</td>
				<td>${vo.address}</td>
				<td>${v.phone}</td>
				<td>${vo.email}</td>
				<td><input type="text" name="auth" value="${vo.auth}"></td>
				<td>${vo.account}</td>
				<td><input type="text" name="team" value="${vo.team}"></td>
			</tr>
		</table>
				<input type="submit" name="confirm" class="w3-btn w3-round-large" value="정보수정완료">
				<input type="button" value="취소" class="w3-btn w3-round-large" onclick="window.location='/erp/admin/member_info?empno=${vo.empno}'"> 
		</form>
		<div class="w3-container w3-center">
			<img src="/erp/resources/portraits/${vo.portrait}" height="300">
		</div>
	</div>
</body>
</html>