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
	<!-- Top -->
	<div class="w3-row-padding w3-margin-bottom w3-hide-small">
		<div class="w3-threequarter">
			<div class="w3-card-2 w3-white w3-round-large w3-center w3-padding" style="min-height: 210px;">
				<h1>그래프</h1>
			</div>
		</div>
		<div class="w3-quarter">
			<div class="w3-card-2 w3-white w3-round-large w3-center w3-padding" style="min-height: 210px;">
				<c:forEach items="${weather}" var="weather">
					<c:if test="${weather.wfEn == 'Clear'}">
						<img src="/erp/resources/image/clear.png" class="w3-image w3-circle w3-card-4">
					</c:if>
					<c:if test="${weather.wfEn == 'Partly Cloudy'}">
						<img src="/erp/resources/image/partly.png" class="w3-image w3-circle w3-card-4">
					</c:if>
					<c:if test="${weather.wfEn == 'Mostly Cloudy'}">
						<img src="/erp/resources/image/mostly.png" class="w3-image w3-circle w3-card-4">
					</c:if>
					<c:if test="${weather.wfEn == 'Rain'}">
						<img src="/erp/resources/image/rain.png" class="w3-image w3-circle w3-card-4">
					</c:if><br>
					<h3 class="w3-opacity">맑음, ${weather.temp}℃</h3>
				</c:forEach>
			</div>
			<div class="w3-hide-large w3-hide-medium"><br></div>
		</div>
	</div>
	
	<!-- Middle -->
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
						<td style="text-align: left;"><span title="${list.title}">${list.title}</span></td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
					</c:forEach>
				</table>
			</div>
			<div class="w3-hide-large w3-hide-medium"><br></div>
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
						<th style="width: 85px;">날짜</th>
					</tr>
					<c:forEach var="c" items="${note}" begin="0" end="4">
						<tr>
							<td style="text-align: left;"><span title="${c.title}">${c.title}</span></td>
							<td>${c.sender}</td>
							<td><fmt:formatDate value="${c.senddate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	
	<!-- Bottom -->
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<div class="w3-content w3-section w3-display-container" style="min-width:100px; max-height: 200px">
				<img class="mySlides" src="/erp/resources/image/banner01.png" style="width:100%; max-height: 180px;">
				<img class="mySlides" src="/erp/resources/image/banner02.png" style="width:100%; max-height: 180px;">
			</div>
		</div>
	</div>
</div>
<br>
<script type="text/javascript">

var myIndex = 0;
carousel();

function carousel() {
    var i;
    var x = document.getElementsByClassName("mySlides");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 3000); 
}

</script>
</body>
</html>