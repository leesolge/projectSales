<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	<div class="w3-container w3-center">
		<h2>공지사항</h2>
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
					value="${noticeVo.name}">
				<label class="w3-wide">Title</label>
				<input
					class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="title"
					readonly value="${noticeVo.title}">
				<label class="w3-wide">Date</label>
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="regDate"
					readonly
					value="<fmt:formatDate value="${noticeVo.regDate}" pattern="yy-MM-dd"/>">
			</p>

			<p>
				<label class="w3-wide">Content</label>
				<textarea class="w3-input w3-border w3-round-large" " name="content"
					style="width: 100%; height: 300px; resize: none; border-radius: 6px;"
					readonly>${noticeVo.content}</textarea>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-center">
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
				<input class="w3-btn w3-round-large" type="button" value="수정"
					onclick="location='/erp/notice/admin/noticeUpdateForm?num=${noticeVo.num}'" />
				<input class="w3-btn w3-round-large" type="button" value="삭제"
					onclick="location='/erp/notice/admin/noticeDelete?num=${noticeVo.num}'" />
			</sec:authorize>
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/notice/noticeList'">목록으로</button>
		</div>
	</div>
	
	<br>
	
	<!-- 댓글 작성부분 -->
	<div class="w3-row">
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/notice/replyWrite" method="post">
			
				<input type="hidden" name="num" value="${noticeVo.num}"> 
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
						type="submit"  value="등록">
				</div>
			</form>
		</div>
	</div>
	
	<!-- 댓글 출력 -->
	<div class="w3-row">
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/notice/replyDelete" name="replyDelete" method="post">
				<input type="hidden" name="num" value="${noticeVo.num}">
				<input type="hidden" name="replynum" value="0">
			</form>
			<form action="/erp/notice/replyUpdateForm" name="replyUpdate" method="post">
				<input type="hidden" name="num" value="${noticeVo.num}">
				<input type="hidden" name="replynum" value="0">
			</form>
			
			<table class="w3-table w3-striped w3-border w3-centered">
				<tr>
					<th style="width: 10%">작성자</th>
					<th style="width: 60%">내용</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 5%">수정</th>
					<th style="width: 5%">삭제</th>
				</tr>
				<c:forEach var="replyList" items="${replyList}">
					<tr>
						<td>${replyList.name}</td>
						<td>${replyList.reply}</td>
						<td>
							<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd-hh:mm:ss" />
						</td>
						<c:if test="${memberInfo.empno==replyList.empno}">
							<td><input type="button" value="수정"
								onclick="Update('${replyList.replynum}')" /></td>
							<td><input type="button" value="삭제"
								onclick="Delete('${replyList.replynum}')" /></td>
						</c:if>
					</tr>
				</c:forEach>
			</table>			
		</div>
	</div>


</body>

<script type="text/javascript">
	function Update(replynum) {
		var replyUpdate = document.replyUpdate;
		replyUpdate.replynum.value = replynum;
		replyUpdate.submit();
	}
	function Delete(replynum) {
		var replyDelete = document.replyDelete;
		replyDelete.replynum.value = replynum;
		replyDelete.submit();
	}
</script>
</html>