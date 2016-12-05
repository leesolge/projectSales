<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="js/jquery-3.1.1.min.js"></script>
</head>
<body><br>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-brown">
			<h4><i class="fa fa-pencil-square-o"></i>  대댓글 작성</h4>
		</div>
		<form action="/erp/freeboard/reReplyWrite" method="post" class="w3-container w3-white w3-card-4">
			<br>
			<input type="hidden" name="replynum" value="${vo.replynum}">
			<input type="hidden" name="num" value="${vo.num}"> 
			<input type="hidden" name="empno" value="${memberInfo.empno}">
				<p>
				<input class="w3-input w3-border w3-round-large" type="text" name="reply" required/>
				<div class="w3-row w3-center">
					<input class="w3-btn w3-brown" type="submit" value="작성" />
					<button class="w3-btn w3-brown" onclick="history.back()">취소</button>
				</div><br>
		</form>
	</div>
</div>
</body>
</html>