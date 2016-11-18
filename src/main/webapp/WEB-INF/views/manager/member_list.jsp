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
					<td><input type="button" value="Content"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/admin/member_info?empno=${member.empno}'">
					</td>
				</tr>
			</c:forEach>
		</table>

		<!-- Page -->
		<div class="w3-container w3-center">
			<ul class="w3-pagination">
				<c:if test="${pg > block}">
					<li><a
						href="/erp/admin/member_list?pg=1&field=${field}&word=${word}"
						class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a
						href="/erp/admin/member_list?pg=${fromPage - 1}&field=${field}&word=${word}"
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
						<li><a
							href="/erp/admin/member_list?pg=${i}&field=${field}&word=${word}"
							class="w3-hover-black">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${toPage < allPage}">
					<li><a
						href="/erp/admin/member_list?pg=${toPage + 1}&field=${field}&word=${word}"
						class="w3-hover-black">&raquo;</a></li>
					<li><a
						href="/erp/admin/member_list?pg=${allPage}&field=${field}&word=${word}"
						class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>

				<c:if test="${toPage >= allPage}">
					<li><a href="#" class="w3-hover-black">&raquo;</a></li>
					<li><a href="#" class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>
			</ul>

			<!-- Search -->
			<form action="/erp/admin/member_list" name="search" method="post">
				<select name="field">
					<c:if test="${field == 'name'}">
						<option value="name" selected="selected">이름</option>
					</c:if>
					<c:if test="${field != 'name'}">
						<option value="name">이름</option>
					</c:if>
					<c:if test="${field == 'team'}">
						<option value="team" selected="selected">소속</option>
					</c:if>
					<c:if test="${Field != 'team'}">
						<option value="team">소속</option>
					</c:if>
				</select> <input type="text" name="word" placeholder="검색어" value="${word}" />
				<input type="submit" name="submit" value="검색">
			</form>
		</div>
</body>
</html>