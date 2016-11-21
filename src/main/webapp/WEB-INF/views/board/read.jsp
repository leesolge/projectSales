<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
					readonly value="<fmt:formatDate value="${b.regDate}" pattern="yy-MM-dd"/>">
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
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
				<input class="w3-btn w3-round-large"  type="button" value="수정" onclick="board_update()"/>
				<input class="w3-btn w3-round-large"  type="button" value="삭제" onclick="board_delete()"/>
			</sec:authorize>
			<%-- <a href="/erp/board/list?pg=${pg}">리스트</a> --%>
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/board/list'">목록으로</button>
		</div>
	</div>

<br>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 10%"><p></p></div>
		<div class="w3-col w3-right" style="width: 10%"><p></p>	</div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/board/comment" method="post">
				<input type="hidden" name="num" value="${b.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				<input type="hidden" name="name" value="${memberInfo.name}">
				
				<div class="w3-col s2 w3-center">
				<label>작성자</label> <input
					class="w3-input w3-border w3-round-large"
					readonly value="${memberInfo.name}">
				</div>
				<div class="w3-col s8 w3-center">
					<label class="w3-wide">댓글</label>
					<input class="w3-input w3-border w3-round-large" type="text" name="comments">
				</div>
	
				<div class="w3-col s2 w3-center">
					<label>&nbsp;</label>
					<input class="w3-btn w3-input page_button w3-round-large w3-right"
						type="submit" 
						value="등록">
				</div>
			</div>
		</div>
			</form>
<div>
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
								<td width="200">${comments.comments}</td>
								
								<td width="220" align="center"><fmt:formatDate value="${comments.regDate}" pattern="yy.MM.dd-hh:mm:ss"/></td>
								<c:if test="${memberInfo.empno==comments.empno}">
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