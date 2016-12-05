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
</head>
<body><br>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-brown">
			<h4><i class="fa fa-pencil-square-o"></i>  댓글 수정</h4>
		</div>
		<form class="w3-container w3-white w3-card-4" action="/erp/freeboard/replyUpdate" method="post">
			<br>
			<input type="hidden" name="num" value="${vo.num}"> 
			<input type="hidden" name="replynum" value="${vo.replynum}">
			<input type="hidden" name="child" value="${vo.child}">
			
			<input class="w3-input w3-border w3-round-large" type="text" name="reply" value="${vo.reply}" required/><br>
			<div class="w3-row w3-center">
				<input class="w3-btn w3-brown" type="submit" value="수정" />
				<button class="w3-btn w3-brown" onclick="history.back()">취소</button>
			</div><br>
		</form>
	</div>
</div>
</body>
</html>