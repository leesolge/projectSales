<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<html>
<body><br>
<div class="w3-container">
	<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding"><br>
		<!-- Info -->
		<table class="w3-table w3-border-top w3-bordered">
			<tr>
				<td class="w3-text-gray" style="text-align: left; width: 80px;">제목　 | </td>
				<td style="text-align: left;"><span>${noticeVo.title}</span></td>
				<td class="w3-text-gray" style="text-align: left; width: 80px;">작성일 | </td>
				<td style="width: 80px; text-align: left;"><fmt:formatDate value="${noticeVo.regDate}" pattern="yy-MM-dd"/></td>
			</tr>
			<tr style="text-align: left;">
				<td class="w3-text-gray" style="text-align: left; width: 80px;">작성자 | </td>
				<td style="text-align: left;"><span>${noticeVo.name}</span></td>
				<td class="w3-text-gray" style="text-align: left; width: 80px;">댓글　 | </td>
				<td style="width: 80px; text-align: left;">${count}</td>
			</tr>
		</table>
		<br>
		<textarea class="w3-input" name="content" style="width: 100%; min-height: 300px; resize: none;"	readonly>${noticeVo.content}</textarea>
		<br>
		
		<!-- Control Button -->
		<div class="w3-row">
			<div class="w3-right">
				<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
					<input class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white" type="button" value="수정"
						onclick="location='/erp/notice/admin/noticeUpdateForm?num=${noticeVo.num}'" />
					<input class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white" type="button" value="삭제"
						onclick="location='/erp/notice/admin/noticeDelete?num=${noticeVo.num}'" />
				</sec:authorize>
				<button class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white"
					onclick="location='/erp/notice/noticeList'">목록</button>
			</div>
		</div>
		<br>
		
		<!-- Reply Write -->
		<div class="w3-row">
			<form action="/erp/notice/replyWrite" method="post">
				<input type="hidden" name="num" value="${noticeVo.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				<table style="width: 100%">
					<tr>
						<td class="w3-text-gray" style="width: 80px;"><span>${memberInfo.name}</span></td>
						<td><input class="w3-input w3-border" type="text" name="reply"></td>
						<td style="width: 50px;">
						<button class="w3-btn w3-input page_button w3-round-large" type="submit">
						<i class="fa fa-pencil"></i>
						</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
		<!-- Reply Print -->
		<div class="w3-row w3-hoverable">
			<br>
			<form action="/erp/notice/replyDelete" name="replyDelete" method="post">
				<input type="hidden" name="num" value="${noticeVo.num}">
				<input type="hidden" name="replynum" value="0">
			</form>
			<form action="/erp/notice/replyUpdateForm" name="replyUpdate" method="post">
				<input type="hidden" name="num" value="${noticeVo.num}">
				<input type="hidden" name="replynum" value="0">
			</form>
			<table class="w3-table w3-bordered w3-striped w3-border-top w3-small" style="width: 100%">
				<c:forEach var="replyList" items="${replyList}">
				<tr>
					<td class="w3-text-gray" style="width: 80px;">${replyList.name}</td>
					<td style="text-align: left;">${replyList.reply}</td>
					<c:if test="${memberInfo.empno!=replyList.empno}">
					<td class="w3-large" style="width: 40px;"></td>
					<td class="w3-large" style="width: 40px;"></td>
					</c:if>
					<c:if test="${memberInfo.empno==replyList.empno}">
					<td class="w3-large" style="width: 40px;">
						<a class="w3-hover-text-blue" onclick="Update('${replyList.replynum}')"><i class="fa fa-pencil-square"></i></a>
					</td>
					<td class="w3-large" style="width: 40px;">
						<a class="w3-hover-text-red" onclick="Delete('${replyList.replynum}')"><i class="fa fa-window-close"></i></a>
					</td>
					</c:if>
				</tr>
				</c:forEach>
			</table>
		</div><br>
	</div>
</div>
<br></body>

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