<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>공지사항</title>
</head>
<body>
	<h1>공지사항</h1>
		<div class="w3-row ">
			<div class="w3-col w3-center">
			총 <c:out value="${total}"/>개의 게시물이 있습니다.
			</div>
			<div class="w3-col w3-left" style="width: 30%">
				<form action="/erp/board/list" name="search" method="post">
					<select name="field">
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
	<table width="600" cellpadding="3">
		<tr>
			<th width="50">번호</th>
			<th width="270">제목</th>
			<th width="100">글쓴이</th>
			<th width="120">날짜</th>
		</tr>
	
<c:forEach var="b" items="${list}">
	
	<tr>
		<td>${b.num}</td>
		<td>
		
		<c:forEach begin="0" end="${b.tab}">
		&nbsp;&nbsp;&nbsp;			
		</c:forEach>
		
		<a href="/erp/board/read?num=${b.num}&pg=${pg}">${b.title}</a>
		</td>
		
		<td>${b.name}</td>
		<td><fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd"/></td>
	</tr>
</c:forEach>
	
	</table>
	<div style="width:600px;text-align:right"><a href="/erp/board/writeForm">글쓰기</a></div>
	
	<table width="600">
	<tr>
		<td align="center">
			<!-- 처음 이전 링크 -->
			<c:if test="${pg>block}"> <!-- 5>10 : false / 15>10 : true -->
				[<a href="/erp/board/list?pg=1">◀◀</a>]
				[<a href="/erp/board/list?pg=${fromPage-1}">◀</a>
			</c:if>
			<c:if test="${pg<=block}"><!-- 5<=10 : true / 15<=10 : false -->
				[<span>◀◀</span>]
				[<span>◀</span>]
			</c:if>
			
			<!-- 블록 범위 찍기 -->
			<c:forEach begin="${fromPage}" end="${toPage}" var="i">
				<c:if test="${i==pg}">[${i}]</c:if>
				<c:if test="${i!=pg}">
					[<a href="/erp/board/list?pg=${i}">${i}</a>]
				</c:if>
			</c:forEach>
			
			<!-- 다음, 이후 -->
			<c:if test="${toPage<allPage}"> <!-- 20<21 : true -->
				[<a href="/erp/board/list?pg=${toPage+1}">▶</a>]
				[<a href="/erp/board/list?pg=${allPage}">▶▶</a>]
			</c:if>
			<c:if test="${toPage>=allPage}"> <!-- 21>=21 : true -->
				[<span>▶</span>]
				[<span>▶▶</span>]
			
			</c:if>
		
		</td>
	</tr>
	</table>
</body>
</html>