<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="/erp/resources/js/jquery.ulslide.js"></script>
<script type="text/javascript">
$(function() {
	$('#main_bn').ulslide({
		statusbar: true,
		width: 450,
		height: 338, 
		affect: 'slide', 
		axis: 'x', 	
		navigator: '#main_bn_btn a',
		duration: 400, 
		autoslide: 3000 
	});
});
</script>
<style type="text/css">
	#wrap{ position:relative; width:100%; }
	#main_bn { margin:0 auto; width:450px; height:338px; }
	#main_bn img { width:100%; height:auto;}
	#main_bn_btn { list-style-type:none; position:absolute;	bottom:5px; left:5px; }
	main_bn_btn li { float: left; padding:0px 2px; margin-right:5px; }
	a, a:hover, a:visited { text-decoration:none; }
	ul li { list-style : none; }
</style>
<body><br>
<div class="w3-container">
<div id="wrap">
	<div id="main_bn">
	        <li>
	            <img src="/erp/resources/image/image_1.jpg" alt="" />
	        </li>
	        <li>
	            <img src="/erp/resources/image/image_2.jpg" alt="" />
	        </li>
	        <li>
	            <img src="/erp/resources/image/image_3.jpg" alt="" />
	        </li>
	    <div id="main_bn_btn">
	        <li><a href="#"><img src="/erp/resources/image/blt.png"></a></li>
	        <li><a href="#"><img src="/erp/resources/image/blt.png"></a></li>
	        <li><a href="#"><img src="/erp/resources/image/blt.png"></a></li>
	    </div>
	</div>
</div>

	<!-- Slider -->
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<div class="w3-row w3-border w3-border-blue" style="height: 200px;">사내 정보, 배너가 들어갈 공간</div>
		</div>
	</div>
	<br><br>
	
	<div class="w3-container">
		<div class="w3-row">
			<!-- Notice -->
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding w3-col m5" style="min-height: 280px;">
				<div align="left">
					<h5><i class="fa fa-bullhorn" aria-hidden="true"></i> 공지사항</h5>
				</div>
				<table class="w3-table w3-bordered w3-small">
					<tr>
						<th>제목</th>
						<th style="width: 80px;">날짜</th>
					</tr>
					<c:forEach var="list" items="${list}" begin="0" end="4">
					<tr style="cursor:pointer;" onclick="location.href='/erp/notice/noticeContent?num=${list.num}'">
						<td style="text-align: left;"><span>${list.title}</span></td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<!-- Note -->
			<div class="w3-col m2">　</div>
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding w3-col m5" style="min-height: 280px;">
				<div align="left">
					<h5>
						<i class="fa fa-envelope-o" aria-hidden="true"></i> 새로운 쪽지<br>
					</h5>
				</div>
				<table class="w3-table w3-bordered w3-small" style="cursor:pointer;" onclick="location.href='/erp/note/list'">
					<tr>
						<th>제목</th>
						<th style="width: 70px">발신자</th>
						<th style="width: 80px;">날짜</th>
					</tr>
					<c:forEach var="c" items="${note}" begin="0" end="4">
						<tr>
							<td style="text-align: left;"><span>${c.title}</span></td>
							<td>${c.sender}</td>
							<td><fmt:formatDate value="${c.senddate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</div>
<br></body>
</html>