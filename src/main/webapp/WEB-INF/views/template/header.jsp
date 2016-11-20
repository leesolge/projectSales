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
					<a href="/erp/employee/buy_request">구매요청</a>
					<a href="/erp/employee/buy_request_list">구매대기목록</a>
					<a href="/erp/employee/buy_approved_list">구매승인목록</a>
					
				</div>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
		<li></li>
			<li class="w3-dropdown-hover">
			<a href="#">영업팀메뉴</a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/manager/member_list">팀원 명부</a> 
					<a href="/erp/manager/buy_request_list">승인대기목록</a> 
					<a href="/erp/manager/buy_approved_list">구매승인목록</a>
					<a href="#">요청</a>
				</div>
			</li>
		</sec:authorize>
		
		<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
			<li class="w3-dropdown-hover">
			<a href="/erp/transact/transactlist_default">자재팀메뉴</a>
				<div class="w3-dropdown-content w3-blue-grey w3-card-4">
					<a href="/erp/transact/transactlist_default">거래내역</a> 
					<a href="/erp/transact/buy_request_list">승인대기목록</a> 
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
					<a href="/erp/order/list">수주 관리</a>
					<a href="#">발주 관리</a>
				</div>
			</li>
		</sec:authorize>
		
	</ul>
</sec:authorize>