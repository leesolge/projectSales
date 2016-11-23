<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<body>
	<div class="w3-container w3-center">
		<h2>글 수정</h2>
	</div>
	
	<div class="w3-row"> 
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-container">
			<form class="w3-container" action="/erp/freeboard/freeboardUpdate" method="post" >
				<input type="hidden" name="num" value="${freeboardVo.num}"/>
				<p>
					<label class="w3-wide">Name</label>
					<input
						class="w3-input w3-border w3-round-large"
						style="width: 20%; border-radius: 6px;" name="name"
						readonly value="${freeboardVo.name}">
				</p>

				<p>
					<label class="w3-wide">Title</label> <input
						class="w3-input w3-border w3-round-large"
						style="width: 50%; border-radius: 6px;" type="text" name="title"
						value="${freeboardVo.title}">
				</p>

				<p>
					<label class="w3-wide">Content</label>
					<textarea class="w3-input w3-border w3-round-large"" name="content" placeholder=" 내용을 입력하세요."
						style="width: 100%; height: 300px; resize: none; border-radius: 6px;">${freeboardVo.content}</textarea>
				</p>
				<div class="w3-row">
					<div class="w3-col w3-left" style="width:10%"><p></p></div>
					
					<div class="w3-rest w3-center">
						<input class="w3-btn w3-round-large" type="submit" value="수정" /> 
						<input class="w3-btn w3-round-large" type="reset" value="취소" />
					</div>
				</div>
			</form>
			<div class="w3-col w3-right" style="width:10%"><button class="w3-btn w3-round-large"
							onclick="history.back();">돌아가기</button></div>
		</div>
	</div>
</body>
</html>