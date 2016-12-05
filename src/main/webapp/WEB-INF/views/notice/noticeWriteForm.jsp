<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<body><br>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-blue-grey">
			<h4><i class="fa fa-pencil"></i>  글 작성</h4>
		</div>
		<form class="w3-container w3-white w3-card-4" action="/erp/notice/admin/noticeWrite" method="post">
			<br>
			<input type="hidden" name="name" value="${memberInfo.name}">
			<label class="w3-text-blue-grey"><b>제목</b></label>
			<input class="w3-input w3-border w3-border-blue-grey w3-round" name="title" type="text" placeholder="제목을 입력하세요.">
			<p>      
			<label class="w3-text-blue-grey"><b>내용</b></label>
			<textarea class="w3-input w3-border w3-border-blue-grey w3-round" name="content" placeholder="내용을 입력하세요."
			style="min-height: 300px; resize: none;" required></textarea>
			<p>
			<div class="w3-row w3-center">
				<input class="w3-btn w3-blue-grey" type="submit" value="작성" />
				<input class="w3-btn w3-blue-grey" type="reset" value="취소" />		
			</div><br>
		</form>
	</div>
</div>
</body>
</html>