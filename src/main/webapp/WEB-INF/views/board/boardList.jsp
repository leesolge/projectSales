<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>
	
		<div class="w3-container">
			<div class="w3-container w3-center">
			<h1>공지사항</h1>
			총 <c:out value="${total}"/>개의 게시물이 있습니다.
			</div>
			
			<div class="w3-container" >
				<form action="/erp/board/list" name="search" method="post">
					<select name="field" style="width: 5%">
			   			<c:if test="${field == 'name'}"><option value="name" selected="selected">이름</option></c:if>
			   			<c:if test="${field != 'name'}"><option value="name">이름</option></c:if>
			   			<c:if test="${field == 'title'}"><option value="title" selected="selected">제목</option></c:if>
			   			<c:if test="${Field != 'title'}"><option value="title">제목</option></c:if>
					</select>
					<input type="text" name="word" placeholder="검색어" value="${word}"/>
					<input type="submit" name="submit" value="검색"> 
				</form>
			</div>
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

			<c:forEach var="b" items="${list}">

				<tr>
					<td>${b.num}</td>
					<td><c:forEach begin="0" end="${b.tab}"> 여기 b.tab 얘는 어따 쓰는 앤가요
						</c:forEach> <a href="/erp/board/read?num=${b.num}&pg=${pg}">${b.title}</a>
					</td>

					<td>${b.name}</td>
					<td><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd" /></td>
				</tr>
			</c:forEach>

		</table>
	</div>

<br>
	<div class="w3-container w3-right">
		<button class="w3-btn w3-round-large"
			onclick="location='/erp/board/writeForm'">글쓰기</button>
	</div>


	<div class="w3-container w3-center">
		<ul class="w3-pagination">
			<!-- 처음 이전 링크 -->
			<c:if test="${pg>block}"><!-- 5>10 : false / 15>10 : true -->
				<li><a href="/erp/board/list?pg=1" class="w3-hover-black">&laquo;&laquo;</a></li>
				<li><a href="/erp/board/list?pg=${fromPage-1}"  class="w3-hover-black">&laquo;</a></li>
			</c:if>
			<c:if test="${pg <= block}"><!-- 5<=10 : true / 15<=10 : false -->
					<li><a href="#" class="w3-hover-black">&laquo;&laquo;</a></li>
					<li><a href="#" class="w3-hover-black">&laquo;</a></li>
			</c:if>

			<!-- 블록 범위 찍기 -->
			<c:forEach begin="${fromPage}" end="${toPage}" var="i">
				<c:if test="${i == pg}">
					<li><a href="#" class="w3-hover-red">${i}</a></li>
				</c:if>

				<c:if test="${i != pg}">
					<li><a
						href="/erp/board/list?pg=${i}"
						class="w3-hover-black">${i}</a></li>
				</c:if>
			</c:forEach>
			
			<!-- 다음, 이후 -->
			<c:if test="${toPage < allPage}">
					<li><a
						href="/erp/board/list?pg=${toPage+1}"
						class="w3-hover-black">&raquo;</a></li>
					<li><a
						href="/erp/board/list?pg=${allPage}"
						class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>

				<c:if test="${toPage >= allPage}">
					<li><a href="#" class="w3-hover-black">&raquo;</a></li>
					<li><a href="#" class="w3-hover-black">&raquo;&raquo;</a></li>
				</c:if>
		</ul>
	</div>
</body>
</html>