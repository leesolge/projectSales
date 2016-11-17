<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<sec:authorize access="isAuthenticated()">
	<ul class="w3-navbar w3-blue-grey w3-center"><li></li>
	
		<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_EMPLOYEE', 'ROLE_BUDGET')">
			<li class="w3-dropdown-hover">
			<a href="/erp/board/list">공지사항</a>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_EMPLOYEE')">
			<li class="w3-dropdown-hover">
			<a href="#">거래메뉴</a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/employee/buy_request_list">구매요청리스트</a>
					<a href="/erp/employee/buy_request">자재충원요청</a>
				</div>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
		<li></li>
			<li class="w3-dropdown-hover">
			<a href="#">팀메뉴</a>
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
			<a href="/erp/transact/transactlist_default">자재관리</a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/transact/transactlist_default">거래내역</a> 
					<a href="#">메뉴1</a> 
				</div>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAuthority('ROLE_ADMIN')">
			<li class="w3-dropdown-hover">
			<a href="/erp/admin/member_ok">관리자메뉴</a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/admin/member_ok">가입 승인</a> 
					<a href="/erp/admin/member_list">사원 명부</a>
					<a href="/erp/product/list">상품 관리</a>
					<a href="/erp/admin/order">수주 관리</a>
				</div>
			</li>
		</sec:authorize>
		
	</ul>
</sec:authorize>