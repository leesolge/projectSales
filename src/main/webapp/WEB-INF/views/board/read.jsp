<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<body>
	<div class="w3-container w3-center">
		<h1>글읽기</h1>
	</div>

	<div class="w3-row"> 
		<div class="w3-col w3-left" style="width:10%"><p></p></div>
		<div class="w3-col w3-right" style="width:10%"><p></p></div>
		<div class="w3-rest w3-container ">

			<p>
				<label class="w3-wide">Name</label> 
				<input
					class="w3-input w3-border w3-round-large"
					style="width: 20%; border-radius: 6px;" name="name" readonly
					value="${b.name}">
				<label class="w3-wide">Title</label> 
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="title"
					readonly value="${b.title}">
				<label class="w3-wide">Date</label> 
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="regDate"
					readonly value="<fmt:formatDate value="${b.regDate}" pattern="yyyy-MM-dd"/>">
			</p>

			<p>
				<label class="w3-wide">Content</label>
				<textarea class="w3-input w3-border w3-round-large" " name="content"
					style="width: 100%; height: 300px; resize: none; border-radius: 6px;"
					readonly>${b.content}</textarea>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 10%"><p></p></div>		
		<div class="w3-col w3-right" style="width: 10%"><p></p></div>		
		<div class="w3-rest w3-center">
			<input class="w3-btn w3-round-large"  type="button" value="수정" onclick="board_update()"/>
			<input class="w3-btn w3-round-large"  type="button" value="삭제" onclick="board_delete()"/>
			<%-- <a href="/erp/board/list?pg=${pg}">리스트</a> --%>
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/board/list'">목록으로</button>
		</div>
	</div>

	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 10%"><p></p></div>
		<div class="w3-col w3-right" style="width: 10%"><p></p>	</div>
		<div class="w3-rest w3-center">
			<form action="/erp/board/comment" method="post">
				<input type="hidden" name="num" value="${b.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				<input type="hidden" name="name" value="${memberInfo.name}">
				<table class="w3-table" >
					<tr>
						<td style="width : 10%">이름 :</td>
						<td style="width : 10%">${memberInfo.name}</td>
						<td style="width : 10%">댓글 :</td>
						<td style="width : 60%"><input type="text" name="comments" size="50"></td>
						<td style="width : 10%"><input type="submit" name="Button" value="쓰기"></td>
					</tr>
				</table>
			</form>

			<!-- 달려있는 커맨트 보기 -->
			<form action="/erp/board/commentsDelete" name="c_delete"
				method="post">
				<form action="/erp/board/commentsUpdateForm" name="reply"
					method="post">
					<input type="hidden" name="num" value="${b.num}"> <input
						type="hidden" name="name" value="${b.name}"> <input
						type="hidden" name="seq" value="0">
					<table width="789" border="1">
						<c:forEach var="comments" items="${comments}">
							<tr>
								<td width="42" align="center">*</td>
								<td width="86">${comments.name}</td>
								<td width="639">${comments.comments}</td>
								<td width="220" align="center">${comments.change}</td>
								<c:if test="${memberInfo.empno==senderVo.empno}">
									<td><input type="button" value="수정"
										onclick="comments_update('${comments.seq}')" /></td>
									<td><input type="button" value="삭제"
										onclick="comments_delete('${comments.seq}')" /></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</form>
		</div>
	</div>

</body>

<script type="text/javascript">
function board_update(){
	//alert("수정");
	location.href="/erp/board/updateForm?num=${b.num}";
	
}
function board_delete(){
	//alert("삭제");
	/* location.href="/erp/board/deleteForm?num=${b.num}"; */
	location.href="/erp/board/delete?num=${b.num}";
}
function board_reply(){
	//alert("답변");
	location.href="/erp/board/replyForm?num=${b.num}";
}
function comments_update(seq){
	var jumping = document.reply;
	jumping.seq.value=seq;
	jumping.submit();
}
function comments_delete(seq){
	var jumping = document.c_delete;
	jumping.seq.value=seq;
	jumping.submit();
}
</script>
</html>