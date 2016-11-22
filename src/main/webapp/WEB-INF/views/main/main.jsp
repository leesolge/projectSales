<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<style type="text/css">
	.shortLine {
		margin-top: 2px;
		border: solid 1px #D3D3D3;
		width: 70%;
	}
</style>
<body>
<div class="w3-container">
	<div class="w3-row borderBox" style="height: 200px;">사내 정보, 배너가 들어갈 공간</div>
	<br><hr>
	<div class="w3-row">
		<div class="w3-col m6">
			<div align="left">
				<h5>
					<i class="fa fa-bullhorn" aria-hidden="true"></i> 공지사항<br>
				</h5>
			</div>
			<table class="w3-table w3-bordered w3-small" style="width: 90%;">
				<tr>
					<th style="width: 70%;">제목</th>
					<th style="width: 30%;">날짜</th>
				</tr>
				<c:forEach var="list" items="${list}" begin="0" end="4">
					<tr style="cursor:pointer;" onclick="location.href='/erp/notice/noticeContent?num=${list.num}'">
						<td>
							${list.title}
						</td>
						<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="w3-col m6">
			<div align="left">
				<h5>
					<i class="fa fa-envelope-o" aria-hidden="true"></i> 새로운 쪽지<br>
				</h5>
			</div>
			<table class="w3-table w3-bordered w3-small" style="width: 90%;">
				<tr>
					<th style="width: 50%;">제목</th>
					<th style="width: 20%;">발신자</th>
					<th style="width: 30%;">날짜</th>
				</tr>
				<c:forEach var="c" items="${note}" begin="0" end="4">
					<tr style="cursor:pointer;" onclick="location.href='/erp/note/list'">
						<td>${c.title}</td>
						<td>${c.sender}</td>
						<td><fmt:formatDate value="${c.senddate}" pattern="yyyy-MM-dd"/></td>
					</tr>
				</c:forEach>

			</table>
		</div>
	</div>
</div>
</body>