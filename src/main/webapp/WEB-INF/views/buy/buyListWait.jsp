<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<body>
	<form action="/erp/buy/buyContent" name="buyContent" method="post">
		<input type="hidden" name="buynum" value="0">
		<input type="hidden" name="history" value="buyListWait">
	</form>
	<form action="/erp/buy/buyCancel" name="buyCancel" method="post">
		<input type="hidden" name="buynum" value="0">
	</form>
	<form action="/erp/buy/buyListWait" name="buyListWait" method="post">
		<input type="hidden" name="page" value="0">
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
				<h5><i class="fa fa-bar-chart"></i><c:out value="${paging.total}" /></h5>
			</div>

			<div class="w3-row" >
				<table class="w3-table w3-small w3-hoverable w3-bordered" >
					<tr class="w3-light-blue">
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
								<c:if test="${list.buystep == 0 && list.deleted==0}">팀장승인대기</c:if>
								<c:if test="${list.buystep == 1 && list.deleted==0}">자재팀승인대기</c:if>
								<c:if test="${list.buystep == 0 && list.deleted==1}"><font color="red">구매취소</font></c:if>
								<c:if test="${list.buystep > 0 && list.deleted==1}"><font color="red">승인취소</font></c:if>
							</td>
							<td><a onclick="javascript:cancel('${list.buynum}')" class="w3-hover-text-red"><i class="fa fa-times w3-large"></i></a></td>
						</tr>
					</c:forEach>
				</table>
			</div>


					<!-- Page -->
		<div class="w3-row w3-center w3-small">
			<ul class="w3-pagination">
				<c:if test="${paging.page>paging.block}">
					<li><a href="javascript:jumppage('${paging.page}')" class="w3-hover-black w3-hide-small">&laquo;&laquo;</a></li>
					<li><a href="javascript:jumppage('${paging.fromPage-1}')" class="w3-hover-black">&laquo;</a></li>
				</c:if>
				<c:if test="${paging.page <= paging.block}">
					<li><a href="#" class="w3-hover-black w3-hide-small">&laquo;&laquo;</a></li>
					<li><a href="#" class="w3-hover-black">&laquo;</a></li>
				</c:if>
				<!-- 블록 범위 찍기 -->
				<c:forEach begin="${paging.fromPage}" end="${paging.toPage}" var="i">
					<c:if test="${i == paging.page}">
						<li><a href="#" class="w3-hover-red w3-text-red"><b>${i}</b></a></li>
					</c:if>
					<c:if test="${i != paging.page}">
						<li><a href="javascript:jumppage('${i}')" class="w3-hover-black">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 다음, 이후 -->
				<c:if test="${paging.toPage < paging.allPage}">
					<li><a href="javascript:jumppage('${paging.toPage+1}')" class="w3-hover-black">&raquo;</a></li>
					<li><a href="javascript:jumppage('${paging.allPage}')" class="w3-hover-black w3-hide-small">&raquo;&raquo;</a></li>
				</c:if>
				<c:if test="${paging.toPage >= paging.allPage}">
					<li><a href="#" class="w3-hover-black">&raquo;</a></li>
					<li><a href="#" class="w3-hover-black w3-hide-small">&raquo;&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		<!-- end Paging -->
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
	
	function jumppage(page) {
		var buyListWait = document.buyListWait;
		buyListWait.page.value = page;
		buyListWait.submit();
	}
</script>
</html>