<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	<div class="w3-container w3-center">
		<h2>글 읽기</h2>
	</div>

	<div class="w3-row"> 
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-container ">
			<p>
				<label class="w3-wide">Name</label> 
				<input
					class="w3-input w3-border w3-round-large"
					style="width: 20%; border-radius: 6px;" name="name" readonly
					value="${freeboardVO.name}">
				<label class="w3-wide">Title</label> 
				<input 
					class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="title"
					readonly value="${freeboardVO.title}">
				<label class="w3-wide">Date</label> 
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="regDate"
					readonly 
					value='<fmt:formatDate value="${freeboardVO.regDate}" pattern="yy-MM-dd_hh:mm:ss"/>'>
			</p>

			<p>
				<label class="w3-wide">Content</label>
				<textarea class="w3-input w3-border w3-round-large" " name="content"
					style="width: 100%; height: 300px; resize: none; border-radius: 6px;"
					readonly>${freeboardVO.content}</textarea>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 15%"><p></p></div>		
		<div class="w3-col w3-right" style="width: 15%"><p></p></div>		
		<div class="w3-rest w3-center">
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
				<input class="w3-btn w3-round-large"  type="button" value="수정" 
					onclick="location='/erp/freeboard/freeboardUpdateForm?num=${freeboardVO.num}'"/>
				<input class="w3-btn w3-round-large"  type="button" value="삭제" 
					onclick="location='/erp/freeboard/freeboardDelete?num=${freeboardVO.num}'"/>
			</sec:authorize>
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/freeboard/freeboardList'">목록으로</button>
		</div>
	</div>

	<br>

	<!-- 댓글 작성 부분 -->
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 15%"><p></p></div>
		<div class="w3-col w3-right" style="width: 15%"><p></p>	</div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/freeboard/replyWrite" method="post">
			
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				
				<div class="w3-col s2 w3-center">
					<label>작성자</label> 
					<input class="w3-input w3-border w3-round-large"
						readonly value="${memberInfo.name}">
				</div>
				
				<div class="w3-col s8 w3-center">
					<label class="w3-wide">댓글</label>
					<input class="w3-input w3-border w3-round-large" type="text" name="reply">
				</div>
				<div class="w3-col s1 w3-center"><p></p></div>
				<div class="w3-col s1 w3-center">
					<label>&nbsp;</label>
					<input class="w3-btn w3-input page_button w3-round-large w3-right"
						type="submit" value="등록">
				</div>
			</form>
		</div>
	</div>
			
	<!-- 달려있는 댓글 보기 -->
	<div class="w3-row">
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/freeboard/replyDelete" name="replyDelete" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="replynum" value="0">
			</form>
			<form action="/erp/freeboard/replyUpdateForm" name="replyUpdate" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="replynum" value="0">
			</form>
			<form action="/erp/freeboard/reReplyWriteForm" name="reReplyWrite" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="replynum" value="0">
			</form>
			
			<table class="w3-table w3-striped w3-border w3-centered">
				<tr>
					<th style="width: 10%">작성자</th>
					<th style="width: 55%">내용</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 5%">수정</th>
					<th style="width: 5%">삭제</th>
					<th style="width: 5%">댓글</th>
				</tr>
				<c:forEach var="replyList" items="${replyList}">
					<tr>
						<td>${replyList.name}</td>
						<td>${replyList.reply}</td>
						<td>
							<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd_hh:mm:ss"/>
						</td>
						<c:if test="${memberInfo.empno==replyList.empno}">
							<td><input type="button" value="수정"
								onclick="Update('${replyList.replynum}')" /></td>
							<td><input type="button" value="삭제"
								onclick="Delete('${replyList.replynum}')" /></td>
						</c:if>
						<td>
							<input type="button" value="댓글"
								onclick="ReReply('${replyList.replynum}')"/>	
						</td>
					</tr>
					<tr>
						<c:if test="${replyList.sort}==1">
							<c:forEach var="replyList" items="${replyList}">
								<td>${replyList.name}</td>
								<td>${replyList.reply}</td>
								<td>
									<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd_hh:mm:ss"/>
								</td>
								<c:if test="${memberInfo.empno==replyList.empno}">
									<td><input type="button" value="수정"
										onclick="Update('${replyList.replynum}')" /></td>
									<td><input type="button" value="삭제"
										onclick="Delete('${replyList.replynum}')" /></td>
								</c:if>
							</c:forEach>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
</body>

<script type="text/javascript">
	function Update(replynum){
		var replyUpdate = document.replyUpdate;
		replyUpdate.replynum.value = replynum;
		replyUpdate.submit();
	}

	function Delete(replynum){
		var replyDelete = document.replyDelete;
		replyDelete.replynum.value = replynum;
		replyDelete.submit();
	}
	
	function ReReply(replynum){
		var reReply = document.reReplyWrite;
		reReplyWrite.replynum.value = replynum;
		reReplyWrite.submit();
	}
</script>
</html>