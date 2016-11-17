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
	<div class="big w3-container">
		<table style="width: 100%" >
			<tr>
				<td width="15%" style="vertical-align: top;">
					<div class="borderBox">
						<br>
						<table style="width: 100%">
							<tr>
								<td align="center" colspan="2">
									<img src="/erp/resources/portraits/${memberInfo.portrait}" height="100">
								</td>
							</tr>
							<tr>
								<td align="center" colspan="2">
								<b>${memberInfo.name }</b>
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href="/erp/my_Info">
									<font size="2"><i class="fa fa-user-circle-o" aria-hidden="true"></i> 내 정보　</font>
									</a>
								</td>
								<td align="center">
									<a href="/erp/note/list">
									<font size="2"><i class="fa fa-envelope" aria-hidden="true"></i> 내 쪽지</font>
									</a> 
								</td>
							</tr>
							<tr>
								<td align="center">
									<a href="/erp/employee/buy_request_list">
									<font size="2"><i class="fa fa-line-chart" aria-hidden="true"></i> 수주현황</font>
									</a>
								</td>
								<td align="center">
									<a href="/erp/schedule/calendarForm">
									<font size="2"><i class="fa fa-calendar-check-o" aria-hidden="true"></i> 스케쥴</font>
									</a>
								</td>	
							</tr>
							<tr>
								<td align="center">
									<a href="<c:url value='/j_spring_security_logout' />">
									<font size="2"><i class="fa fa-sign-out" aria-hidden="true"></i> 로그아웃</font>
									</a>
								</td>
							</tr>
						</table>
						<br>
					</div>
				</td>
			</tr>
			<tr>
				<td width="15%" style="vertical-align: top;">
					<div class="borderBox">
						뭐시기
					</div>
				</td>
			</tr>
		</table>
		<br>
	</div>
</sec:authorize>
</body>
</html>