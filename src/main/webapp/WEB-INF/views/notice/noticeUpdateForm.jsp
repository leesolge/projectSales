<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<body><br>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-blue-grey">
			<h4><i class="fa fa-pencil-square-o"></i>  글 수정</h4>
		</div>
		<form class="w3-container w3-white w3-card-4" action="/erp/notice/admin/noticeUpdate" method="post" >
			<br>
			<input type="hidden" name="num" value="${noticeVo.num}"/>
			<input type="hidden" name="name" value="${noticeVo.name}">
			<label class="w3-text-blue-grey"><b>제목</b></label>
			<input class="w3-input w3-border w3-border-blue-grey w3-round" name="title" type="text" value="${noticeVo.title}" placeholder="제목을 입력하세요.">
			<p>      
			<label class="w3-text-blue-grey"><b>내용</b></label>
			<textarea class="w3-input w3-border w3-border-blue-grey w3-round" name="content" placeholder="내용을 입력하세요."
			style="min-height: 300px; resize: none;" required>${noticeVo.content}</textarea>
			<p>
			<div class="w3-row w3-center">
				<input class="w3-btn w3-blue-grey" type="submit" value="작성" />
				<button class="w3-btn w3-blue-grey" onclick="history.go(-1)">취소</button>		
			</div><br>
		</form>
	</div>
</div>
</body>
</html>
