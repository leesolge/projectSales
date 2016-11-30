<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML>

<html>

<nav class="w3-sidenav w3-collapse w3-white" style="z-index:3;width:250px;" id="mySidenav"><br>
	<div class="w3-container w3-row">
		<a class="w3-hide-large w3-right w3-hover-white" onclick="w3_close()" style="cursor:pointer;"><i class="fa fa-remove"></i></a>
		<div class="w3-col s12 w3-center">
			<img src="/erp/resources/portraits/${memberInfo.portrait}" class="w3-circle w3-card-4" style="width:92px; height: 100px;">
		</div>
		<div class="w3-col s12 w3-center">
			<span>Welcome, <strong>${memberInfo.name }</strong></span><br>
			<sec:authorize access="hasAnyAuthority('ROLE_MANAGER','ROLE_EMPLOYEE', 'ROLE_BUDGET')">
			<a href="/erp/salary/view" class="w3-hover-none w3-hover-text-yellow w3-show-inline-block"><i class="fa fa-money"></i></a>
			</sec:authorize>
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
			<a href="/erp/admin/salary" class="w3-hover-none w3-hover-text-yellow w3-show-inline-block"><i class="fa fa-money"></i></a>
			</sec:authorize>
			<a href="/erp/note/list" class="w3-hover-none w3-hover-text-blue w3-show-inline-block"><i class="fa fa-envelope-o"></i>(<i class="w3-text-red" id="note_count"></i>)</a><br>
			<a href="/erp/member/memberContent" class="w3-hover-none w3-hover-text-green w3-show-inline-block"><i class="fa fa-user"></i></a>
			<a href="/erp/schedule/calendarForm" class="w3-hover-none w3-hover-text-orange w3-show-inline-block"><i class="fa fa-calendar"></i></a>
			<a href="<c:url value='/j_spring_security_logout' />" class="w3-hover-none w3-hover-text-red w3-show-inline-block"><i class="fa fa-sign-out"></i></a>
		</div>
	</div>
	<hr>
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_EMPLOYEE', 'ROLE_BUDGET')">
			<div class="w3-accordion w3-padding">
				<a href="/erp/notice/noticeList" class="w3-padding w3-hover-blue">
					<i class="fa fa-bullhorn"></i>  공지사항
				</a>
			</div>
	</sec:authorize>
	
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_BUDGET', 'ROLE_MANAGER','ROLE_EMPLOYEE')">
		<div class="w3-accordion w3-padding">
		    <a onclick="myAccFunc1()" class="w3-padding w3-hover-blue">
				<i class="fa fa-balance-scale"></i>  구매메뉴  
				<i class="fa fa-angle-down"></i>
		    </a>
		    <div id="demoAcc1" class="w3-accordion-content w3-padding">
				<a href="/erp/buy/buyWriteForm">- 구매요청</a>				
				<sec:authorize access="hasAnyAuthority('ROLE_EMPLOYEE')">
				<a href="/erp/buy/buyListWait">- 구매대기목록</a>					
				</sec:authorize>
				<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER','ROLE_BUDGET')">				
				<a href="/erp/buy/buyListAppWait">- 승인대기목록</a> 
				</sec:authorize>				
				<a href="/erp/buy/buyAppList">- 구매목록</a>
				
				
		    </div>
	  	</div>
	</sec:authorize>
	
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER', 'ROLE_EMPLOYEE')">
		<div class="w3-accordion w3-padding">
		    <a onclick="myAccFunc2()" class="w3-padding w3-hover-blue">
				<i class="fa fa-users"></i>  영업팀메뉴  
				<i class="fa fa-angle-down"></i>
		    </a>
		    <div id="demoAcc2" class="w3-accordion-content w3-padding">
			    <sec:authorize access="hasAnyAuthority('ROLE_ADMIN', 'ROLE_MANAGER')">
				<a href="/erp/member/memberList">- 사원 명부</a> 
				</sec:authorize>
				<a href="/erp/order/registForm">- 판매등록</a>
				<a href="/erp/order/list">- 판매목록</a>
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
				<a href="/erp/product/list">- 상품 관리</a>
				<a href="/erp/ledger/list">- 회계장부</a>
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
		    	<a href="/erp/admin/memberListWait">- 가입 승인</a> 				
		    </div>
	  	</div>
	</sec:authorize>
	<a href="/erp/sell/sellList">- 테스트</a>
	<br><br><br><br>
</nav>

<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>
	setInterval("getCount()", 1000);
	function getCount(){
		$.getJSON("/erp/count/countNote", function(data){
		var str = "";
		   
		   $(data).each(function(){
		      str += this.empno;
		   });
		   
		   $("#note_count").html(str);
		}); 
	}
</script>
</html>