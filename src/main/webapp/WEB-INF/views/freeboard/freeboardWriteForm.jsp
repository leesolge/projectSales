<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body><br>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-brown">
			<h4><i class="fa fa-pencil"></i>  글 작성</h4>
		</div>
		<form id="form1" name="write" class="w3-container w3-white w3-card-4" action="freeboardWrite" method="post">
			<br>
			<input type="hidden" name="name" value="${memberInfo.name}">
			<label class="w3-text-brown"><b>제목</b></label>
			<input class="w3-input w3-border w3-border-brown w3-round" name="title" type="text" placeholder="제목을 입력하세요.">
				<p>
				<label class="w3-text-brown"><b>내용</b></label>
				<textarea class="w3-input w3-border w3-border-brown w3-round" id="content1" name="content" placeholder="내용을 입력하세요."
				style="min-height: 300px; resize: none;" required></textarea>
				<p>
				<div class="w3-row w3-center">
					<input class="w3-btn w3-brown" type="submit" value="작성" />
					<button class="w3-btn w3-brown" onclick="history.back()">취소</button>
				</div><br>
		</form>
	</div>
</div>
</body>
</html>