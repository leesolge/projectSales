<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>

<html>
<style>
.mySlides {display:none;}
</style>

<body><br>
<div class="w3-container">
	<div class="w3-row-padding w3-margin-bottom">
		<div class="w3-quarter">
			<div class="w3-container w3-red w3-padding-16">
				<div class="w3-left"><i class="fa fa-comment w3-xxxlarge"></i></div>
				<div class="w3-right">
					<h3>52</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>Messages</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-blue w3-padding-16">
			<div class="w3-left"><i class="fa fa-eye w3-xxxlarge"></i></div>
			<div class="w3-right">
				<h3>99</h3>
			</div>
			<div class="w3-clear"></div>
			<h4>Views</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-teal w3-padding-16">
				<div class="w3-left"><i class="fa fa-share-alt w3-xxxlarge"></i></div>
				<div class="w3-right">
					<h3>23</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>Shares</h4>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-container w3-orange w3-text-white w3-padding-16">
				<div class="w3-left"><i class="fa fa-users w3-xxxlarge"></i></div>
				<div class="w3-right">
					<h3>50</h3>
				</div>
				<div class="w3-clear"></div>
				<h4>Users</h4>
			</div>
		</div>
	 </div>
	  
	<div class="w3-row-padding w3-margin-bottom">
		<!-- Notice -->
		<div class="w3-half">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" style="min-height: 280px;">
				<div align="left">
						<h5><a href="/erp/notice/noticeList">
							<i class="fa fa-bullhorn" aria-hidden="true"></i> 공지사항
						</a></h5>
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
		</div>
			
		<!-- Note -->
		<div class="w3-half">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" style="min-height: 280px;">
				<div align="left">
					<h5><a href="/erp/note/list">
						<i class="fa fa-envelope-o" aria-hidden="true"></i> 새로운 쪽지<br>
					</a></h5>
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
	
	<!-- Slider -->
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<div class="w3-content w3-section w3-display-container" style="min-width:100px; max-height: 200px">
				<img class="mySlides" src="/erp/resources/image/banner01.png" style="width:100%; max-height: 180px;">
				<img class="mySlides" src="/erp/resources/image/banner02.png" style="width:100%; max-height: 180px;">
			</div>
		</div>
	</div>
</div>
<br></body>

</html>