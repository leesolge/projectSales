<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
	
	<br>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<!-- Title -->
			<div class="w3-row">
				<h3><i class="fa fa-bullhorn" aria-hidden="true"></i> 사원명부</h3>
			</div>
			
			<div class="w3-row w3-right">
				<h5><i class="fa fa-bar-chart"></i><c:out value="${count}" /></h5>
			</div>

	<div class="w3-container" align="center">
		<!-- List -->
		<table class="w3-table w3-small w3-hoverable w3-bordered">
			<tr class="w3-deep-purple">	
				<th>EMPNO</th>
				<th>NAME</th>
				<th>AUTH</th>
				<th>TEAM</th>
			</tr>
			<!-- result는 contoller의 addObject로 부터 가져온다. -->
			<c:forEach items="${list}" var="member">
				<tr>
					<td  style="vertical-align: middle;" onclick="window.location='/erp/member/memberContent?empno=${member.empno}'" style="cursor:pointer;">${member.empno}</td>
					<td  style="vertical-align: middle;" onclick="window.location='/erp/member/memberContent?empno=${member.empno}'" style="cursor:pointer;">${member.name}</td>
					<td  style="vertical-align: middle;" onclick="window.location='/erp/member/memberContent?empno=${member.empno}'" style="cursor:pointer;">${member.auth}</td>
					<td  style="vertical-align: middle;" onclick="window.location='/erp/member/memberContent?empno=${member.empno}'" style="cursor:pointer;">${member.team}</td>
					</td>
				</tr>
			</c:forEach>
		</table>
		<br>

		<!-- Page -->
		<div class="w3-container w3-center w3-small">
			<ul class="w3-pagination">
				<c:if test="${pg > block}">
					<li><a
						href="/erp/member/memberList?pg=1&field=${field}&word=${word}"
						class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a
						href="/erp/member/memberList?pg=${fromPage - 1}&field=${field}&word=${word}"
						class="w3-hover-black">&laquo;</a></li>
				</c:if>

				<c:if test="${pg <= block}">
					<li><a href="#" class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a href="#" class="w3-hover-black">&laquo;</a></li>
				</c:if>

				<c:forEach begin="${fromPage}" end="${toPage}" var="i">
					<c:if test="${i == pg}">
						<li><a href="#" class="w3-hover-red w3-text-red">${i}</a></li>
					</c:if>

					<c:if test="${i != pg}">
						<li><a
							href="/erp/member/memberList?pg=${i}&field=${field}&word=${word}"
							class="w3-hover-black">${i}</a></li>
					</c:if>
				</c:forEach>

				<c:if test="${toPage < allPage}">
					<li><a
						href="/erp/member/memberList?pg=${toPage + 1}&field=${field}&word=${word}"
						class="w3-hover-black">&raquo;</a></li>
					<li><a
						href="/erp/member/memberList?pg=${allPage}&field=${field}&word=${word}"
						class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>

				<c:if test="${toPage >= allPage}">
					<li><a href="#" class="w3-hover-black">&raquo;</a></li>
					<li><a href="#" class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>
			</ul>

			<!-- Search -->
			<form action="/erp/member/memberList" name="search" method="post">
				<select name="field" class="w3-border w3-border-deep-purple" style="width: 70px; height: 30px;">
					<c:if test="${field == 'name'}">
						<option value="name" selected="selected">이름</option>
					</c:if>
					<c:if test="${field != 'name'}">
						<option value="name">이름</option>
					</c:if>
					<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
					<c:if test="${field == 'team'}">
						<option value="team" selected="selected">소속</option>
					</c:if>
					<c:if test="${field != 'team'}">
						<option value="team">소속</option>
					</c:if>
					</sec:authorize>
				</select> <input type="text" class="w3-border w3-border-deep-purple" name="word" placeholder="검색어" value="${word}" style="width: 120px; height: 30px;"/>
				<button class="w3-border w3-border-deep-purple w3-deep-purple" type="submit" name="submit" style="height: 30px;"><i class="fa fa-search"></i></button>
			</form>
		</div>
		</div>
		</div>
		</div>
<br>
</body>
</html>