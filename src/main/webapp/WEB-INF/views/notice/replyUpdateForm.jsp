<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body><br>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-indigo">
			<h4><i class="fa fa-pencil-square-o"></i>  댓글 수정</h4>
		</div>
		<form class="w3-container w3-white w3-card-4" action="/erp/notice/replyUpdate" method="post" >
			<br>
			<input type="hidden" name="num" value="${vo.num}"> 
			<input type="hidden" name="replynum" value="${vo.replynum}">
			<input class="w3-input w3-border w3-round-large" type="text" name="reply" value="${vo.reply}" /><br>
			<div class="w3-row w3-center">
				<input class="w3-btn w3-indigo" type="submit" value="수정" />
			</div><br>
		</form>
	</div>
</div>
</body>
</html>