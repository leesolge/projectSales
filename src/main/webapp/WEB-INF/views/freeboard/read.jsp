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
					value="${freeVO.name}">
				<label class="w3-wide">Title</label> 
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="title"
					readonly value="${freeVO.title}">
				<label class="w3-wide">Date</label> 
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="regDate"
					readonly value="<fmt:formatDate value='${freeVO.regDate}' pattern="yy-MM-dd"/>">
			</p>

			<p>
				<label class="w3-wide">Content</label>
				<textarea class="w3-input w3-border w3-round-large" " name="content"
					style="width: 100%; height: 300px; resize: none; border-radius: 6px;"
					readonly>${freeVO.content}</textarea>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 10%"><p></p></div>		
		<div class="w3-col w3-right" style="width: 10%"><p></p></div>		
		<div class="w3-rest w3-center">
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
				<input class="w3-btn w3-round-large"  type="button" value="수정" onclick="freeboard_update()"/>
				<input class="w3-btn w3-round-large"  type="button" value="삭제" onclick="freeboard_delete()"/>
			</sec:authorize>
			<%-- <a href="/erp/freeboard/list?pg=${pg}">리스트</a> --%>
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/freeboard/list'">목록으로</button>
		</div>
	</div>

<br>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 10%"><p></p></div>
		<div class="w3-col w3-right" style="width: 10%"><p></p>	</div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/freeboard/reply" method="post">
				<input type="hidden" name="num" value="${freeVO.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				<input type="hidden" name="name" value="${memberInfo.name}">
				
				<div class="w3-col s2 w3-center">
				<label>작성자</label> 
				<input
					class="w3-input w3-border w3-round-large"
					readonly value="${memberInfo.name}">
				</div>
				<div class="w3-col s8 w3-center">
					<label class="w3-wide">댓글</label>
					<input class="w3-input w3-border w3-round-large" type="text" name="reply">
				</div>
	
				<div class="w3-col s2 w3-center">
					<label>&nbsp;</label>
					<input class="w3-btn w3-input page_button w3-round-large w3-right"
						type="submit" value="등록">
				</div>
			</div>
		</div>
			</form>
<div>
			<!-- 달려있는 커맨트 보기 -->
			<form action="/erp/freeboard/replyDelete" name="re_delete" method="post">
				<input type="hidden" name="num" value="${freeVO.num}"> 
				<input type="hidden" name="name" value="${freeVO.name}">
				<input type="hidden" name="seq" value="0">
			</form>
			<form action="/erp/freeboard/replyUpdateForm" name="reply" method="post">
				<input type="hidden" name="num" value="${freeVO.num}"> 
				<input type="hidden" name="name" value="${freeVO.name}">
				<input type="hidden" name="seq" value="0">
			</form>
					<table width="789" border="1">
						<c:forEach var="reply" items="${reply}">
							<tr>
								<td width="42" align="center">*</td>
								<td width="86">${reply.name}</td>
								<td width="200">${reply.reply}</td>
								
								<td width="220" align="center"><fmt:formatDate value="${reply.regDate}" pattern="yy.MM.dd-hh:mm:ss"/></td>
								<c:if test="${memberInfo.empno==reply.empno}">
									<td><input type="button" value="수정"
										onclick="reply_update('${reply.seq}')" /></td>
									<td><input type="button" value="삭제"
										onclick="reply_delete('${reply.seq}')" /></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
		</div>
</body>

<script type="text/javascript">
function freeboard_update(){
	//alert("수정");
	location.href="/erp/freeboard/updateForm?num=${freeVO.num}";
	
}
function freeboard_delete(){
	//alert("삭제");
	/* location.href="/erp/board/deleteForm?num=${freeVO.num}"; */
	location.href="/erp/freeboard/delete?num=${freeVO.num}";
}
function freeboard_reply(){
	//alert("답변");
	location.href="/erp/freeboard/replyForm?num=${freeVO.num}";
}
function reply_update(seq){
	var update = document.reply;
	update.seq.value=seq;
	update.submit();
}
function reply_delete(seq){
	var jumping = document.re_delete;
	jumping.seq.value=seq;
	jumping.submit();
}
</script>
</html>