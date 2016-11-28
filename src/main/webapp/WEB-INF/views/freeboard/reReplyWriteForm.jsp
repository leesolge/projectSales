<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.1.1.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="w3-container w3-center">
		<h2>대댓글 입력</h2>
	</div>

	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 15%"><p></p></div>
		<div class="w3-col w3-right" style="width: 15%"><p></p></div>
		<div class="w3-rest w3-container ">
			<form action="/erp/freeboard/reReplyWrite" method="post">
				<input type="hidden" name="replynum" value="${vo.replynum}">
				<input type="hidden" name="num" value="${vo.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				
				<table class="w3-table w3-striped w3-border w3-centered">
					<tr>
						<th style="width: 10%">작성자</th>
						<th style="width: 60%">내용</th>
						<!-- <th style="width: 20%">작성일</th> -->
						<th style="width: 10%">작성</th>
					</tr>
					<tr>
						<td>${memberInfo.name}</td>
						<td><input class="w3-input w3-border w3-round-large" type="text" name="reply" required/></td>
						<%-- <td><fmt:formatDate value="${freeboardReplyVO.regDate}"
								pattern="yy.MM.dd-hh:mm:ss" /></td> --%>
						<td><input type="submit" value="작성" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>