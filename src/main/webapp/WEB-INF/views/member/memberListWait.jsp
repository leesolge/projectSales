<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>

	<br>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<!-- Title -->
			<div class="w3-row">
				<h3><i class="fa fa-bullhorn" aria-hidden="true"></i> 가입승인</h3>
			</div>
			
			<div class="w3-row w3-right">
				<h5><i class="fa fa-bar-chart"></i><c:out value="${count}" /></h5>
			</div>
			
		<div class="w3-container w3-center">
		<!-- List -->
		<table class="w3-table w3-small w3-hoverable w3-bordered">
			<tr class="w3-deep-purple">	
				<th>사번</th>
				<th>이름</th>								
				<th>소속</th>
				<th>승인</th>
				<th>취소</th>
			</tr>
			<!-- result는 contoller의 addObject로 부터 가져온다. -->
			<c:forEach items="${list}" var="member">
				<tr>
					<td  style="vertical-align: middle;" onclick="window.location='/erp/member/memberContent?empno=${member.empno}'" style="cursor:pointer;">${member.empno}</td>
					<td  style="vertical-align: middle;" onclick="window.location='/erp/member/memberContent?empno=${member.empno}'" style="cursor:pointer;">${member.name}</td>		
					<td  style="vertical-align: middle;" onclick="window.location='/erp/member/memberContent?empno=${member.empno}'" style="cursor:pointer;">${member.team}</td>
					<td><input type="button" value="Approve"
						class="w3-btn w3-border w3-border-grey w3-round-large w3-small w3-white"
						onclick="window.location='/erp/admin/Approve?empno=${member.empno}'">
					</td>
					<td><input type="button" value="Cancel"
						class="w3-btn w3-border w3-border-grey w3-round-large w3-small w3-white"
						onclick="window.location='/erp/admin/Cancel?empno=${member.empno}'">
					</td>
				</tr>
			</c:forEach>
		</table>
<br>
		<!-- Page -->
		<div class="w3-container w3-center w3-small">
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
						<li><a href="#" class="w3-hover-red w3-text-red">${i}</a></li>
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
		</div>
	</div>
<br>

</body>
</html>