<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>
<form action="/erp/buy/buyApprove" name="buyApprove"
		method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<div class="w3-container w3-center">
		
			<h2>자재충원요청</h2>
			<table class="w3-table w3-centered">
				<tr>
					<th>등록자 사번</th>
					<td><input type="hidden" name="empno" value="${memberInfo.empno}"> ${memberInfo.empno}</td>
					<th>등록자 부서</th>
					<td>${memberInfo.team}</td>
				</tr>
			</table>
			
			<table class="w3-table w3-centered">
				<tr>
					<th>요청상품</th>
					<th>주문수량</th>
					<th>주문사유</th>					
					<th>주문일</th>
				</tr>
				<c:forEach var="list" items="${list}">
				<tr>
				<td>${list.procode }</td>
				<td>${list.amount }</td>
				<td>${list.buycomment }</td>
				<td><fmt:formatDate value="${list.regdate}"
							pattern="yyyy-MM-dd" /></td>
				</tr>
				</c:forEach>
			</table>
			
			<input type="button" value="목록" onclick="javascript:history.back()">
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
						<input type="button" value="Approve" class="w3-btn w3-round-large"
			onclick="javascript:approve('${buynum}')">
			</sec:authorize>
			
		
	</div>
</body>
<script type="text/javascript">
	function approve(num) {
		var buyApprove = document.buyApprove;
		buyApprove.buynum.value = num;
		buyApprove.submit();
	}
</script>
</html>