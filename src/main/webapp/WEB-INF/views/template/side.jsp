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
				<img src="/erp/resources/portraits/${memberInfo.portrait}"
					width="100%">
			</div>
<br>
			<div class="w3-row ">
				<div class="w3-col m6 w3-center">
					<b>이름</b>
				</div>
				<div class="w3-col m6 ">${memberInfo.name }</div>
			</div>

			<div class="w3-row ">
				<div class="w3-col m6 w3-center">
					<b>부서</b>
				</div>
				<div class="w3-col m6 ">${memberInfo.team }</div>
			</div>

			<div class="w3-row ">
				<div class="w3-col m6 w3-center">
					<b>권한</b>
				</div>
				<div class="w3-col m6 ">${memberInfo.auth }</div>
			</div>
			<br>
		</div>
		<br>

		<div class="w3-container borderBox">
		<div class="w3-panel">
			준규야 원래 니가 하던거 side1.jsp로 보관해둠 이런식으로 구성하면 어떨까 싶어서 해봄 </div>
		<div class="w3-panel">
			<a class="w3-padding w3-hover-red" href="/erp/my_Info"> <i
				class="fa fa-user-circle-o" aria-hidden="true"></i> 내 정보
			</a> </div>
			<div class="w3-panel"><a class="w3-padding w3-hover-red" href="/erp/note/list"> <i
				class="fa fa-envelope" aria-hidden="true"></i> 내 쪽지(안읽은쪽지숫자 나오게 수정해야됨)<span class="w3-tag w3-blue-grey w3-round w3-right">8</span>
			</a> </div>
			<div class="w3-panel"><a class="w3-padding w3-hover-red" href="/erp/employee/buy_request_list"> <i
				class="fa fa-line-chart" aria-hidden="true"></i> 수주현황
			</a></div>
			<div class="w3-panel"><a class="w3-padding w3-hover-red" href="/erp/schedule/calendarForm"> <i
				class="fa fa-calendar-check-o" aria-hidden="true"></i> 스케쥴
			</a></div>
			<div class="w3-panel"><a class="w3-padding w3-hover-red"
				href="<c:url value='/j_spring_security_logout' />"> <i
				class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃
			</a>
			</div>
		
		</div>

	</sec:authorize>
</body>
</html>