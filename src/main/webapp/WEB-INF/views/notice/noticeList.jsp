<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html><link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>

	<div class="w3-container">
		<div class="w3-container w3-center">
			<h2>Notice</h2>
			총 <c:out value="${paging.total}" />	개의 게시물이 있습니다.
		</div>
		
		<form action="/erp/notice/noticeList" name="search" method="post">
			<div class="w3-container w3-row-padding">
				<div class="w3-quarter">
					<input class="w3-input w3-border w3-round-large" type="text"
						name="word" placeholder="검색어" value="${word}" />
				</div>
				<div class="w3-quarter">
					<input class="w3-btn w3-round-large" type="submit" value="검색">
				</div>
			</div>
		</form>
	</div>
	
	<br>
	
	<div class="w3-container">
		<table class="w3-table w3-striped w3-border w3-centered">
			<tr>
				<th style="width: 10%">번호</th>
				<th style="width: 60%">제목</th>
				<th style="width: 10%">글쓴이</th>
				<th style="width: 20%">날짜</th>
			</tr>

			<c:forEach var="notice" items="${list}">

				<tr>
					<td>${notice.num}</td>
					<td>
						<a href="/erp/notice/noticeContent?num=${notice.num}&pg=${pg}">${notice.title}</a>
					</td>
					<td>${notice.name}</td>
					<td><fmt:formatDate value="${notice.regDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>

		</table>
	</div>

<br>
	<div class="w3-container w3-right">
		<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/notice/admin/noticeWriteForm'">글쓰기</button>
		</sec:authorize>
	</div>

	<!-- Page -->
	<div class="w3-container w3-center">
		<ul class="w3-pagination">
			<c:if test="${paging.page>paging.block}">
				<li><a href="/erp/notice/noticeList?pg=1" class="w3-hover-black">&laquo;&laquo;</a></li>
				<li><a href="/erp/notice/noticeList?pg=${paging.fromPage-1}"  class="w3-hover-black">&laquo;</a></li>
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
					<li><a
						href="/erp/notice/noticeList?pg=${i}"
						class="w3-hover-black">${i}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음, 이후 -->
			<c:if test="${paging.toPage < paging.allPage}">
					<li><a
						href="/erp/notice/noticeList?pg=${paging.toPage+1}"
						class="w3-hover-black">&raquo;</a></li>
					<li><a
						href="/erp/notice/noticeList?pg=${paging.allPage}"
						class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>

				<c:if test="${paging.toPage >= paging.allPage}">
					<li><a href="#" class="w3-hover-black">&raquo;</a></li>
					<li><a href="#" class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>
		</ul>
	</div>
</body>
</html>