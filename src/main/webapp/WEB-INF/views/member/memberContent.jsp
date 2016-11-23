<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>

	<div class="w3-container w3-center">
		<form action="/erp/member/memberUpdateForm" name="memberUpdateForm"	method="post">
			<input type="hidden" name="empno" value="${vo.empno}">
		</form>
		<c:if test="${memberInfo.empno==vo.empno}">
			<h2>내 정보</h2>
		</c:if>
		<c:if test="${memberInfo.empno!=vo.empno}">
			<h2>회원 정보</h2>
		</c:if>

		<table class="w3-table w3-centered">
			<tr>
				<td rowspan="6"><img
					src="/erp/resources/portraits/${vo.portrait}" width="100%"></td>
				<th>EMPNO</th>
				<td>${vo.empno}</td>
				<th>NAME</th>
				<td>${vo.name}</td>
			</tr>


			<tr>
				<th>PASSWORD</th>
				<td>${vo.pwd}</td>
				<th>GENDER</th>
				<td>${vo.gender}</td>
			</tr>

			<tr>
				<th>ADDRESS</th>
				<td>${vo.address}</td>
				<th>PHONE</th>
				<td>${vo.phone}</td>
			</tr>

			<tr>
				<th>EMAIL</th>
				<td>${vo.email}</td>
				<th>AUTH</th>
				<td>${vo.auth}</td>
			</tr>

			<tr>
				<th>ACCOUNT</th>
				<td>${vo.account}</td>
				<th>TEAM</th>
				<td>${vo.team}</td>
			</tr>

			<tr>
				<th>BIRTH</th>
				<td>${vo.birth}</td>
				<th>JOINDATE</th>
				<td>${vo.join}</td>
			</tr>
		</table>
		<c:if test="${memberInfo.empno==vo.empno}">
			<input type="button" value="내정보수정" onclick="Update()" />
		</c:if>
	</div>

</body>

<script type="text/javascript">
	function Update() {
		var memberUpdateForm = document.memberUpdateForm;
		memberUpdateForm.submit();
	}
</script>
</html>