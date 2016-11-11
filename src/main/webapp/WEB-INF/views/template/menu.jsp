<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">

<div class="w3-container">
	<sec:authorize access="isAuthenticated()">
		<ul class="w3-navbar w3-blue-grey w3-large w3-center">
			<li style="width: 15%"><a href="/erp/main">Main</a></li>
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_EMPLOYEE')">
			<li class="w3-dropdown-hover" style="width: 15%">
			<a href="#">개인메뉴<i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/my_Info">내정보</a>
					<a href="/erp/note/list">쪽지</a>
				</div>
			</li>
			</sec:authorize>
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
			<li class="w3-dropdown-hover" style="width: 15%">
			<a href="#">팀메뉴<i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="#">팀원 명부</a> 
					<a href="#">승인대기</a> 
					<a href="#">진행업무</a> 
					<a href="#">요청</a>
				</div>
			</li>
			</sec:authorize>
			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
			<li class="w3-dropdown-hover" style="width: 15%">
			<a href="#">관리자메뉴<i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/admin/member_ok">가입 승인</a> 
					<a href="/erp/admin/member_list">사원 명부</a>
					<a href="/erp/product/list">상품 관리</a>
				</div>
			</li>
			</sec:authorize>
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_EMPLOYEE')">
			<li class="w3-dropdown-hover" style="width: 15%">
			<a href="#">상품메뉴<i class="fa fa-caret-down"></i></a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/product/list">상품 정보</a>
				</div>
			</li>
			</sec:authorize>
		</ul>
	</sec:authorize>
</div>

