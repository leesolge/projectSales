<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	<!-- Title -->
	<div class="w3-container w3-center">
		<h2>가입승인 [${count }건]</h2>
	</div>

	<div class="w3-container w3-center">

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
				<th>APPROVE</th>
				<th>CANCEL</th>
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
					<td><input type="button" value="Approve"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/admin/Approve?empno=${member.empno}'">
					</td>
					<td><input type="button" value="Cancel"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/admin/Cancel?empno=${member.empno}'">
					</td>
				</tr>
			</c:forEach>
		</table>

		<!-- Page -->
		<div class="w3-container w3-center">
			<ul class="w3-pagination">
				<c:if test="${pg > block}">
					<li><a href="/erp/admin/member_ok?pg=1" class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a href="/erp/admin/member_ok?pg=${fromPage - 1}"
						class="w3-hover-black">&laquo;</a></li>
				</c:if>

				<c:if test="${pg <= block}">
					<li><a href="#" class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a href="#" class="w3-hover-black">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${fromPage}" end="${toPage}" var="i">
					<c:if test="${i == pg}">
						<li><a href="#" class="w3-hover-red">${i}</a></li>
					</c:if>

					<c:if test="${i != pg}">
						<li><a href="/erp/admin/member_ok?pg=${i}"
							class="w3-hover-black">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${toPage < allPage}">
					<li><a href="/erp/admin/member_ok?pg=${toPage + 1}"
						class="w3-hover-black">&raquo;</a></li>
					<li><a href="/erp/admin/member_ok?pg=${allPage}"
						class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>

				<c:if test="${toPage >= allPage}">
					<li><a href="#" class="w3-hover-black">&raquo;</a></li>
					<li><a href="#" class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>
			</ul>
		</div>
</body>
</html>