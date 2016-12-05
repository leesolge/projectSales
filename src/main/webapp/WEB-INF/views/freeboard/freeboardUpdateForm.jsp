<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body><br>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-brown">
			<h4><i class="fa fa-pencil-square-o"></i>  글 수정</h4>
		</div>
		<form class="w3-container w3-white w3-card-4" action="/erp/freeboard/freeboardUpdate" method="post" >
			<br>
				<input type="hidden" name="num" value="${freeboardVo.num}"/>
				<input type="hidden" name="name" value="${freeboardVo.name}"/>
				<label class="w3-text-brown"><b>제목</b></label> 
				<input class="w3-input w3-border w3-border-brown w3-round" name="title" type="text" value="${freeboardVo.title}" placeholder="제목을 입력하세요.">
				<p>
				<label class="w3-wide-brown">내용</label>
				<textarea class="w3-input w3-border w3-border-brown w3-round" name="content" placeholder="내용을 입력하세요."
				style="min-height: 300px; resize: none;" required>${freeboardVo.content}</textarea>
				<p>
				<div class="w3-rest w3-center">
					<input class="w3-btn w3-brown" type="submit" value="작성" />
					<button class="w3-btn w3-brown" onclick="history.go(-1)">취소</button>						
				</div><br>
		</form>
	</div>
</div>
</body>
</html>