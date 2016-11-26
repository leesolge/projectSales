<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<body>
	<form action="/erp/buy/buyContent" name="buyContent" method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<form action="/erp/buy/buyCancel" name="buyCancel" method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<br>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<!-- Title -->
			<div class="w3-row">
				<h3><i class="fa fa-bullhorn" aria-hidden="true"></i> 구매대기목록</h3>
			</div>
			<!-- Count -->
			<div class="w3-row w3-right">
				<h5><i class="fa fa-bar-chart"></i><c:out value="${count}" /></h5>
			</div>

			<div class="w3-row" >
				<table class="w3-table w3-small w3-hoverable w3-bordered" >
					<tr class="w3-indigo">
						<th style="width: 70px">등록번호</th>
						<th>요청건</th>
						<th style="width: 130px">등록날짜</th>
						<th style="width: 130px">상태</th>
						<th style="width: 70px">취소</th>
					</tr>

					<c:forEach var="list" items="${list}">
						<tr>
							<td onclick="javascript:content('${list.buynum}')" style="cursor:pointer;">${list.buynum}</td>
							<td onclick="javascript:content('${list.buynum}')" style="cursor:pointer;">${list.title}</td>
							<td onclick="javascript:content('${list.buynum}')" style="cursor:pointer;"><fmt:formatDate value="${list.regdate}"
									pattern="yyyy-MM-dd" /></td>
							<td onclick="javascript:content('${list.buynum}')" style="cursor:pointer;">
								<c:if test="${list.buystep == 0}">팀장승인대기</c:if>
								<c:if test="${list.buystep == 1}">자재팀승인대기</c:if>
							</td>
							<td><a onclick="javascript:cancel('${list.buynum}')" class="w3-hover-text-red"><i class="fa fa-times w3-large"></i></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>

		</div>
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
	
	function cancel(num) {
		var buyCancel = document.buyCancel;
		buyCancel.buynum.value = num;
		buyCancel.submit();
	}

</script>
</html>