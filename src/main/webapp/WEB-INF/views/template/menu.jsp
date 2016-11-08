<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet"	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<div class="w3-container">
	<ul class="w3-navbar w3-blue-grey w3-large w3-center">
		<li style="width: 15%"><a href="/erp/main">Main</a></li>		
		<li style="width: 15%"><a href="/erp/note/list">쪽지</a></li>
		
		<sec:authorize access="hasAuthority('ROLE_ADMIN')">		
		<li class="w3-dropdown-hover" style="width: 15%">
			<a href="#">관리자 메뉴<i class="fa fa-caret-down"></i>	</a>
			<div class="w3-dropdown-content w3-blue-grey w3-card-4">
				<a href="/erp/admin/member_ok">가입 승인</a> 
				<a href="/erp/admin/member_list">사원 명부</a> 
				<a href="#">Link3</a>
			</div>
		</li>
		</sec:authorize>
		
		<li style="width: 10%"><a href="#">a</a></li>
	</ul>
</div>

