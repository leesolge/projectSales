<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	<!-- Title -->
	<div class="w3-container" align="left">
	<h1>가입승인</h1>
	</div>
	
	<div class="w3-container" align="center">
		<!-- Count -->
		<b>[${count }건]</b>
		
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
				<td>
				<input type="button" value="Approve"	class="w3-btn w3-round-large" onclick="window.location='/erp/admin/Approve?empno=${member.empno}'">
				</td>
				<td>
				<input type="button" value="Cancel" class="w3-btn w3-round-large" onclick="window.location='/erp/admin/Cancel?empno=${member.empno}'">
				</td>
			</tr>
			</c:forEach>
		</table>
		
		<!-- Page -->
		<table>
		<tr>
			<td align="center">
				<c:if test="${pg > block}">
					[<a href="/erp/admin/member_ok?pg=1">◀◀</a>]
					[<a href="/erp/admin/member_ok?pg=${fromPage - 1}">◀</a>
				</c:if>
				<c:if test="${pg <= block}">
					[<span>◀◀</span>]
					[<span>◀</span>]
				</c:if>
				<c:forEach begin="${fromPage}" end="${toPage}" var="i">
					<c:if test="${i == pg}">[${i}]</c:if>
					<c:if test="${i != pg}">
						[<a href="/erp/admin/member_ok?pg=${i}">${i}</a>]
					</c:if>
				</c:forEach>
				<c:if test="${toPage < allPage}">
					[<a href="/erp/admin/member_ok?pg=${toPage + 1}">▶</a>]
					[<a href="/erp/admin/member_ok?pg=${allPage}">▶▶</a>]
				</c:if>
				<c:if test="${toPage >= allPage}">
					[<span>▶</span>]
					[<span>▶▶</span>]
				</c:if>
			</td>
		</tr>
		</table>
	</div>
</body>
</html>