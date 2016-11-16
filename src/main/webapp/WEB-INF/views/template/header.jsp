<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<div class="w3-container">
	<sec:authorize access="isAuthenticated()">
		<ul class="w3-navbar w3-blue-grey w3-center">
			<li><a href="/erp/main">Main</a></li>
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET', 'ROLE_MANAGER', 'ROLE_EMPLOYEE')">
				<li class="w3-dropdown-hover">
				<a href="#">개인메뉴<i class="fa fa-caret-down"></i></a>
					<div class="w3-dropdown-content w3-blue-grey w3-card-4">
						<a href="/erp/schedule/calendarForm">스케줄관리</a>
						<a href="/erp/my_Info">내정보</a>
						<a href="/erp/note/list">쪽지</a>
					</div>
				</li>
			</sec:authorize>
			
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
				<li class="w3-dropdown-hover">
				<a href="#">팀메뉴<i class="fa fa-caret-down"></i></a>
					<div class="w3-dropdown-content w3-blue-grey w3-card-4">
						<a href="#">팀원 명부</a> 
						<a href="#">승인대기</a> 
						<a href="#">진행업무</a> 
						<a href="#">요청</a>
					</div>
				</li>
			</sec:authorize>
			
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
				<li class="w3-dropdown-hover">
				<a href="#">자재관리<i class="fa fa-caret-down"></i></a>
					<div class="w3-dropdown-content w3-blue-grey w3-card-4">
						<a href="/erp/transact/transactlist_default">거래내역</a> 
						<a href="#">메뉴1</a> 
					</div>
				</li>
			</sec:authorize>
			
			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
				<li class="w3-dropdown-hover">
				<a href="#">관리자메뉴<i class="fa fa-caret-down"></i></a>
					<div class="w3-dropdown-content w3-blue-grey w3-card-4">
						<a href="/erp/admin/member_ok">가입 승인</a> 
						<a href="/erp/admin/member_list">사원 명부</a>
						<a href="/erp/product/list">상품 관리</a>
						<a href="/erp/admin/order">수주 관리</a>
					</div>
				</li>
			</sec:authorize>
			
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_EMPLOYEE')">
				<li class="w3-dropdown-hover">
				<a href="#">상품메뉴<i class="fa fa-caret-down"></i></a>
					<div class="w3-dropdown-content w3-blue-grey w3-card-4">
						<a href="/erp/product/list">상품 정보</a>
					</div>
				</li>
			</sec:authorize>
			
			<li>
			<a href="<c:url value='/j_spring_security_logout' />">로그아웃</a>
			</li>
		</ul>
	</sec:authorize>
</div>