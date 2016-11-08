<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<div class="w3-container w3-center">
	<h2 class="w3-red">
		Sales Team Project<br>
		<sec:authorize access="isAuthenticated()">
			<a href="<c:url value='/j_spring_security_logout' />">로그아웃</a>
		</sec:authorize>
	</h2>
</div>