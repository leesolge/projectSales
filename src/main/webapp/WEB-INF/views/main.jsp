<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>

<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script>
	function myFunction(id) {
		var x = document.getElementById(id);
		if (x.className.indexOf("w3-show") == -1) {
			x.className += " w3-show";
			x.previousElementSibling.className += " w3-red";
		} else {
			x.className = x.className.replace(" w3-show", "");
			x.previousElementSibling.className = x.previousElementSibling.className
					.replace(" w3-red", "");
		}
	}
</script>
<body>
	<div class="w3-container">
		<p></p>
	</div>

	<div class="w3-container">
		<ul class="w3-navbar w3-blue-grey w3-large w3-center">
			<li style="width: 10%"><a href="home">Main</a></li>
			<li style="width: 10%"><a href="sMemberList">MemberList</a></li>
			<li style="width: 10%"><a href="note/list">쪽지</a></li>
			<li style="width: 10%"><a href="#">a</a></li>
			<li style="width: 10%"><a href="#">a</a></li>
		</ul>
	</div>

	<div class="w3-container w3-row ">
		<div class="w3-accordion w3-col  w3-light-grey" style="width: 15%">
			<sec:authorize access="hasAuthority('ROLE_ADMIN')">
				<button onclick="myFunction('Demo1')"
					class="w3-btn-block w3-left-align">관리자 메뉴</button>
				<div id="Demo1" class="w3-accordion-content w3-container">
					<a href="member_ok">가입 승인</a>
					<a href="member_list">사원 명부</a>
					<a href="#">Link3</a>
				</div>
			</sec:authorize>

			<button onclick="myFunction('Demo2')"
				class="w3-btn-block w3-left-align">일반메뉴1</button>
			<div id="Demo2" class="w3-accordion-content w3-container">
				<p>Some other text..</p>
			</div>
		</div>
	</div>


</body>
</html>