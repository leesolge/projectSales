<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<body><br>
<div class="w3-container">
	<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
		<!-- Title -->
		<div class="w3-row">
			<h3><i class="fa fa-bullhorn" aria-hidden="true"></i>${team} 게시판</h3>
		</div>
		<!-- Count -->
		<div class="w3-row w3-right">
			<h5><i class="fa fa-bar-chart"></i>  <c:out value="${paging.total}" /></h5>
		</div>
			
		<!-- Table -->
		<div class="w3-row">
			<table class="w3-table w3-small w3-hoverable w3-bordered">
				<tr class="w3-brown">
					<th style="width: 70px">번호</th>
					<th>제목</th>
					<th style="width: 70px">글쓴이</th>
					<th style="width: 80px">날짜</th>
				</tr>
				<c:forEach var="freeboard" items="${list}">
				<tr onclick="location.href='/erp/freeboard/freeboardContent?num=${freeboard.num}&pg=${pg}'" style="cursor:pointer;">
					<td>${freeboard.num}</td>
					<td style="text-align: left;">
						<span>${freeboard.title}</span>
					</td>
					<td>${freeboard.name}</td>
					<td><fmt:formatDate value="${freeboard.regDate}" pattern="yy-MM-dd" /></td>
				</tr>
				</c:forEach>
			</table>
		</div>
		<br>
	
		<!-- Write Button -->
		<div align="right">
				<button class="w3-btn w3-border w3-border-brown w3-round-large w3-small w3-white" onclick="location='/erp/freeboard/freeboardWriteForm'">글쓰기</button>
		</div>
		
		<!-- Page -->
		<div class="w3-row w3-center">
			<ul class="w3-pagination">
				<c:if test="${paging.page>paging.block}">
					<li><a href="/erp/freeboard/freeboardList?pg=1" class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a href="/erp/freeboard/freeboardList?pg=${paging.fromPage-1}"  class="w3-hover-black">&laquo;</a></li>
				</c:if>
				<c:if test="${paging.page <= paging.block}">
					<li><a href="#" class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a href="#" class="w3-hover-black">&laquo;</a></li>
				</c:if>
				<!-- 블록 범위 찍기 -->
				<c:forEach begin="${paging.fromPage}" end="${paging.toPage}" var="i">
					<c:if test="${i == paging.page}">
						<li><a href="#" class="w3-hover-red">${i}</a></li>
					</c:if>
					<c:if test="${i != paging.page}">
						<li><a href="/erp/freeboard/freeboardList?pg=${i}" class="w3-hover-black">${i}</a></li>
					</c:if>
				</c:forEach>
				<!-- 다음, 이후 -->
				<c:if test="${paging.toPage < paging.allPage}">
					<li><a href="/erp/freeboard/freeboardList?pg=${paging.toPage+1}" class="w3-hover-black">&raquo;</a></li>
					<li><a href="/erp/freeboard/freeboardList?pg=${paging.allPage}" class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>
				<c:if test="${paging.toPage >= paging.allPage}">
					<li><a href="#" class="w3-hover-black">&raquo;</a></li>
					<li><a href="#" class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>
			</ul>
		</div>
		
		<!-- Search -->
		<div class="w3-row w3-center">
			<form action="/erp/freeboard/freeboardList" name="search" method="post">
				<input class="w3-border w3-border-brown" type="text" name="word" placeholder="검색어" value="${word}" />
				<button class="w3-border w3-border-brown w3-brown" type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div><br>
		
	</div>
</div>
<br></body>
</html>