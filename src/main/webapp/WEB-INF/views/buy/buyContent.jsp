<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>
<br>
	<form action="/erp/buy/buyApprove" name="buyApprove" method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<br>
			<!-- Info -->
			<table class="w3-table w3-border-top w3-bordered">
				<tr>
					<td class="w3-text-gray" style="text-align: left; width: 100px;">부서
						|</td>
					<td style="text-align: left;"><span>${writer.team}</span></td>
					<td class="w3-text-gray" style="text-align: left; width: 100px;">작성일
						|</td>
					<td style="text-align: left;"><fmt:formatDate
							value="${list1.regdate}" pattern="yy-MM-dd" /></td>
				</tr>
				<tr style="text-align: left;">
					<td class="w3-text-gray" style="text-align: left; width: 100px;">등록자
						|</td>
					<td style="text-align: left;"><span>${writer.name}</span></td>
					<td class="w3-text-gray" style="text-align: left; width: 100px;">승인상태
						|</td>
					<td style="text-align: left;"><c:if
							test="${list1.buystep == 0 && list1.deleted==0}">팀장승인대기</c:if> <c:if
							test="${list1.buystep == 1 && list1.deleted==0}">자재팀승인대기</c:if> <c:if
							test="${list1.buystep == 0 && list1.deleted==1}">
							<font color="red">구매취소</font>
						</c:if> <c:if test="${list1.buystep > 0 && list1.deleted==1}">
							<font color="red">승인취소</font>
						</c:if>
						<c:if test="${list1.buystep == 2 && list1.deleted==0}">
							구매승인
						</c:if>
						</td>
				</tr>
			</table>
			<br>
			<div class="w3-row">
				<table class="w3-table w3-small w3-bordered">
					<tr class="w3-light-grey">
						<th style="width: 130px">물품코드</th>
						<th style="width: 130px">물품명</th>
						<th style="width: 130px">주문수량</th>
						<th>주문사유</th>
					</tr>
					<c:forEach var="list" items="${list}">
						<tr>
							<td>${list.procode }</td>
							<td>${list.proname }</td>
							<td>${list.amount }</td>
							<td><span title="${list.buycomment }">${list.buycomment }<span></td>
						</tr>
					</c:forEach>
				</table>
				<br>
				<div class="w3-center">
					<input class="w3-btn w3-border w3-border-grey w3-round-large w3-small w3-white"
										type="button" value="목록"	onclick="javascript:history.back()">
					<sec:authorize
						access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
						<c:if test="${list1.buystep != 2}">
						<input type="button" value="승인" class="w3-btn w3-border w3-border-grey w3-round-large w3-small w3-white"
							onclick="javascript:approve('${buynum}')">
						</c:if>						
					</sec:authorize>
				</div>
				 
			</div>
		</div>
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