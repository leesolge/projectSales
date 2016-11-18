<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>

<html>
<head>
</head>
<body>
<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET', 'ROLE_MANAGER', 'ROLE_EMPLOYEE')">
	<div class="w3-container borderBox">
	<br>
		<div class="w3-row w3-center">
			<img src="/erp/resources/portraits/${memberInfo.portrait}" height="100">
		</div>
		
		<div class="w3-row w3-center">
			<b>${memberInfo.name }</b>
		</div>
		
		<div class="w3-row">
			<div class="w3-col m6 w3-center">
				<a href="/erp/my_Info">
					<font size="2"><i class="fa fa-user-circle-o" aria-hidden="true"></i> 내 정보 </font>
				</a>
			</div>
			<div class="w3-col m6 w3-center">
				<a href="/erp/note/list">
					<font size="2"><i class="fa fa-envelope" aria-hidden="true"></i> 내 쪽지</font>
				</a> 
			</div>
		</div>
		
		<div class="w3-row">
			<div class="w3-col m6 w3-center">
				<a href="/erp/employee/buy_request_list">
					<font size="2"><i class="fa fa-line-chart" aria-hidden="true"></i> 수주현황</font>
				</a>
			</div>
			<div class="w3-col m6 w3-center">
				<a href="/erp/schedule/calendarForm">
					<font size="2"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> 스케쥴</font>
				</a>
			</div>
		</div>
		
		<div class="w3-row">
			<div class="w3-col m6 w3-center">
				<a href="<c:url value='/j_spring_security_logout' />">
					<font size="2"><i class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃</font>
				</a>
			</div>
			<div class="w3-col m6">　</div>
		</div>
	<br>
	</div>
	<br>
	<div class="w3-container borderBox">
		메뉴가 들어갈 부분
	</div>
</sec:authorize>
</body>
</html>