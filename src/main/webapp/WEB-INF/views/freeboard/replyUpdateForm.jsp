<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="w3-container w3-center">
		<h2>댓글 수정</h2>
	</div>

	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 15%">
			<p></p>
		</div>
		<div class="w3-col w3-right" style="width: 15%">
			<p></p>
		</div>
		<div class="w3-rest w3-container ">

			<form action="/erp/freeboard/replyUpdate" method="post">
				<input type="hidden" name="num" value="${vo.num}"> 
				<input type="hidden" name="replynum" value="${vo.replynum}">
				<input type="hidden" name="child" value="${vo.child}">
				<table class="w3-table w3-striped w3-border w3-centered">
					<tr>
						<th style="width: 84%">수정할 내용</th>
						<th style="width: 7%"></th>
						<th style="width: 9%"></th>
					</tr>
					<tr>
						<td><input class="w3-input w3-border w3-round-large" type="text" name="reply" value="${vo.reply}" /></td>
						<td><input type="submit" value="수정" /></td>
						<td><button onclick="history.back()">취소</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>