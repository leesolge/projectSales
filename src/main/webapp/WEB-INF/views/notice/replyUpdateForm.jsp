<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<body>
<div class="w3-container">
	<div class="w3-row">
		<div class="w3-container w3-indigo">
			<h4><i class="fa fa-pencil-square-o"></i>  글 수정</h4>
		</div>
		<form class="w3-container w3-white w3-card-4" action="/erp/notice/admin/noticeUpdate" method="post" >
			<br>
			<input type="hidden" name="num" value="${noticeVo.num}"/>
			<input type="hidden" name="name" value="${noticeVo.name}">
			<label class="w3-text-indigo"><b>제목</b></label>
			<input class="w3-input w3-border w3-border-indigo w3-round" name="title" type="text" value="${noticeVo.title}" placeholder="제목을 입력하세요.">
			<p>      
			<label class="w3-text-indigo"><b>내용</b></label>
			<textarea class="w3-input w3-border w3-border-indigo w3-round" name="content" placeholder="내용을 입력하세요."
			style="min-height: 300px; resize: none;" required>${noticeVo.content}</textarea>
			<p>
			<div class="w3-row w3-center">
				<input class="w3-btn w3-indigo" type="submit" value="작성" />
				<input class="w3-btn w3-indigo" type="reset" value="취소" />		
			</div><br>
		</form>
	</div>
</div>

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

			<form action="/erp/notice/replyUpdate" method="post">
				<input type="hidden" name="num" value="${vo.num}"> <input
					type="hidden" name="replynum" value="${vo.replynum}">
				<table class="w3-table w3-striped w3-border w3-centered">
					<tr>
						<th style="width: 10%">작성자</th>
						<th style="width: 60%">내용</th>
						<th style="width: 20%">작성일</th>
						<th style="width: 10%">수정</th>

					</tr>
					<tr>

						<td>${vo.empno}</td>
						<td><input class="w3-input w3-border w3-round-large" type="text" name="reply" value="${vo.reply}" /></td>
						<td><fmt:formatDate value="${vo.regDate}"
								pattern="yy.MM.dd-hh:mm:ss" /></td>
						<td><input type="submit" value="수정" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

</body>
</html>