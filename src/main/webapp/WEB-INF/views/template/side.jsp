<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>

<html>
<nav class="w3-sidenav w3-collapse w3-white" style="z-index:3;width:250px;" id="mySidenav"><br>
	<div class="w3-container w3-row">
		<div class="w3-col s12 w3-center">
			<img src="/erp/resources/portraits/${memberInfo.portrait}" class="w3-circle" style="width:92px; height: 100px;">
		</div>
		<div class="w3-col s12 w3-center">
			<span>Welcome, <strong>${memberInfo.name }</strong></span><br>
			<a href="/erp/note/list" class="w3-hover-none w3-hover-text-blue w3-show-inline-block"><i class="fa fa-envelope"></i></a>
			<a href="/erp/my_Info" class="w3-hover-none w3-hover-text-green w3-show-inline-block"><i class="fa fa-user"></i></a>
			<a href="/erp/schedule/calendarForm" class="w3-hover-none w3-hover-text-orange w3-show-inline-block"><i class="fa fa-calendar"></i></a>
			<a href="<c:url value='/j_spring_security_logout' />" class="w3-hover-none w3-hover-text-red w3-show-inline-block"><i class="fa fa-sign-out"></i></a>
		</div>
	</div>
	<hr>
	<div class="w3-container">
		<h5>Menu</h5>
	</div>

	<a href="#" class="w3-padding-16 w3-hide-large w3-dark-grey w3-hover-black" onclick="w3_close()" title="close menu"><i class="fa fa-remove fa-fw"></i>  Close Menu</a>
	
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_EMPLOYEE', 'ROLE_BUDGET')">
			<div class="w3-accordion w3-padding">
				<a href="/erp/main" class="w3-padding w3-hover-blue">
					<i class="fa fa-home"></i>  홈
				</a>
			</div>
			<div class="w3-accordion w3-padding">
				<a href="/erp/notice/noticeList" class="w3-padding w3-hover-blue">
					<i class="fa fa-bullhorn"></i>  공지사항
				</a>
			</div>
	</sec:authorize>
	
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_EMPLOYEE')">
		<div class="w3-accordion w3-padding">
		    <a onclick="myAccFunc1()" class="w3-padding w3-hover-blue">
				<i class="fa fa-balance-scale"></i>  거래메뉴  
				<i class="fa fa-angle-down"></i>
		    </a>
		    <div id="demoAcc1" class="w3-accordion-content w3-padding">
				<a href="/erp/buy/buyWriteForm">- 구매요청</a>
				<a href="/erp/buy/buyListWait">- 구매대기목록</a>
				<a href="/erp/employee/buy_approved_list">- 구매승인목록</a>
		    </div>
	  	</div>
	</sec:authorize>
	
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
		<div class="w3-accordion w3-padding">
		    <a onclick="myAccFunc2()" class="w3-padding w3-hover-blue">
				<i class="fa fa-users"></i>  영업팀메뉴  
				<i class="fa fa-angle-down"></i>
		    </a>
		    <div id="demoAcc2" class="w3-accordion-content w3-padding">
				<a href="/erp/manager/member_list">- 팀원 명부</a> 
				<a href="/erp/manager/buy_request_list">- 승인대기목록</a> 
				<a href="/erp/manager/buy_approved_list">- 구매승인목록</a>
		    </div>
	  	</div>
	</sec:authorize>
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET')">
		<div class="w3-accordion w3-padding">
		    <a onclick="myAccFunc3()" class="w3-padding w3-hover-blue">
				<i class="fa fa-cubes"></i>  자재팀메뉴  
				<i class="fa fa-angle-down"></i>
		    </a>
		    <div id="demoAcc3" class="w3-accordion-content w3-padding">
				<a href="/erp/transact/transactlist_default">- 거래내역</a> 
				<a href="/erp/transact/buy_request_list">- 승인대기목록</a> 
		    </div>
	  	</div>
	</sec:authorize>
	
	<sec:authorize access="hasAuthority('ROLE_ADMIN')">
		<div class="w3-accordion w3-padding">
		    <a onclick="myAccFunc4()" class="w3-padding w3-hover-blue">
				<i class="fa fa-cog"></i>  관리자메뉴
				<i class="fa fa-angle-down"></i>
		    </a>
		    <div id="demoAcc4" class="w3-accordion-content w3-padding">
		    	<a href="/erp/admin/member_ok">- 가입 승인</a> 
				<a href="/erp/admin/member_list">- 사원 명부</a>
				<a href="/erp/transact/transactlist_default">- 거래내역</a> 
				<a href="/erp/transact/buy_request_list">- 승인대기목록</a> 
				<a href="/erp/product/list">- 상품 관리</a>
				<a href="/erp/order/list">- 수주 관리</a>
		    </div>
	  	</div>
	</sec:authorize>
	<br><br><br><br>
</nav>
</html>