<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	<form action="/erp/buy/buyContent" name="buyContent" method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<form action="/erp/buy/buyApprove" name="buyApprove"
		method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<div class="w3-container w3-center">
		<h2>승인요청목록 [${count }건]</h2>
		<table class="w3-table w3-centered">
			<tr>
				<th>등록번호</th>
				<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
					<th>팀</th>
				</sec:authorize>
				<th>요청건</th>
				<th>등록날짜</th>				
				<th>상태</th>
				<th>내용보기</th>
				<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_BUDGET')">
					<th>승인</th>
				</sec:authorize>
				<th>취소</th>
			</tr>
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.buynum}</td>
					<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
						<td>${list.team}</td>			
					</sec:authorize>
					<td>${list.title}</td>			
					<td><fmt:formatDate value="${list.regdate}"
							pattern="yyyy-MM-dd" /></td>
					<td>						
							<c:if test="${list.buystep == 0}">팀장승인대기</c:if>
							<c:if test="${list.buystep == 1}">자재팀승인대기</c:if>						
					</td>
					<td><a href="javascript:content('${list.buynum}')">내용</a></td>
					<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_BUDGET')">
						<td><input type="button" value="Approve" class="w3-btn w3-round-large"
											onclick="javascript:approve('${list.buynum}')"></td>
					</sec:authorize>
					<td>취소</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>

<script type="text/javascript">	
	function content(num) {
		var buyContent = document.buyContent;
		buyContent.buynum.value = num;
		buyContent.submit();
	}
	
	function approve(num) {
		var buyApprove = document.buyApprove;
		buyApprove.buynum.value = num;
		buyApprove.submit();
	}
</script>
</html>