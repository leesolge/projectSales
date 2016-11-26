<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<body><br>
	<form action="/erp/buy/buyContent" name="buyContent" method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<form action="/erp/buy/buyApprove" name="buyApprove"
		method="post">
		<input type="hidden" name="buynum" value="0">
	</form>

	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<div class="w3-row">
				<h3><i class="fa fa-bullhorn" aria-hidden="true"></i> 구매대기목록</h3>
			</div>
			<!-- Count -->
			<div class="w3-row w3-right">
				<h5><i class="fa fa-bar-chart"></i>  <c:out value="${paging.total}" /></h5>
			</div>
		</div>
	</div>


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