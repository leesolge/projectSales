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
		<input type="hidden" name="history" value="buyAppList">
	</form>
	<form action="/erp/buy/buyAppList" name="buyAppList" method="post">
		<input type="hidden" name="page" value="0">
		<input type="hidden" name="team" value="0">
		<input type="hidden" name="start_date" value="0">
		<input type="hidden" name="end_date" value="0">					
	</form>	
	
	<br>

	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<!-- Title -->
			<div class="w3-row">
				<h3><i class="fa fa-bullhorn" aria-hidden="true"></i> 구매목록</h3>
			</div>
			<div class="w3-container w3-center">
				<table>
					<tr>
						<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
						<th style="width: 130px">
						팀 : 
						<select class="w3-round-large" name="team" id="team">				
								<option value="${paging.team}" disabled selected>${paging.team}</option>
								<c:forEach items="${team_list}" var="team_list">
									<option value="${team_list}">${team_list}</option>
								</c:forEach>
						</select>
						</th>
						</sec:authorize>
						<sec:authorize access="hasAnyAuthority('ROLE_MANAGER', 'ROLE_EMPLOYEE')">
							<input type="hidden" name="team" value="${paging.team}" id="team">
						</sec:authorize>
						<th>
							기간 : 
							<input class="w3-round-large" type="date" id="start_date" name="start_date" value=${paging.start_date }> ~ 
							<input class="w3-round-large" type="date" id="end_date" name="end_date"  value=${paging.end_date } >
						</th>
						<th>
							<button onclick="javascript:jumppage('1')" class="w3-round-large w3-indigo w3-border w3-border-indigo"><i class="fa fa-search"></i></button>
						</th>
					</tr>
				</table>
			</div>

			<div class="w3-row">
				<div class="w3-row w3-right">
					<h5><i class="fa fa-bar-chart"></i>  <c:out value="${paging.total}" /></h5>
				</div>
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<tr class="w3-indigo">						
						<th style="width: 70px">등록번호</th>
						<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
							<th style="width: 130px">팀</th>
						</sec:authorize>
						<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET', 'ROLE_MANAGER')">
							<th style="width: 130px">사원번호</th>
						</sec:authorize>
						<th>요청건</th>
						<th style="width: 130px">등록날짜</th>
						<th style="width: 130px">승인날짜</th>								
					</tr>
					<c:forEach var="list" items="${list}">
						<tr onclick="javascript:content('${list.buynum}')" style="cursor:pointer;">				
							<td>${list.buynum}</td>
							<sec:authorize
								access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
								<td>${list.team}</td>
							</sec:authorize>
							<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET', 'ROLE_MANAGER')">
							<td style="width: 130px">${list.empno}</td>
							</sec:authorize>
							<td><span title="${list.title}">${list.title}</span></td>
							<td><fmt:formatDate value="${list.regdate}"
									pattern="yyyy-MM-dd" /></td>
							<td><fmt:formatDate value="${list.appdate}"
									pattern="yyyy-MM-dd" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<br>
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
	
	function jumppage(page) {
		var buyApprove = document.buyAppList;
		buyAppList.page.value = page;
		buyAppList.team.value = document.getElementById('team').value;
		buyAppList.start_date.value = document.getElementById('start_date').value;
		buyAppList.end_date.value = document.getElementById('end_date').value;
		buyAppList.submit();
	}
</script>
</html>