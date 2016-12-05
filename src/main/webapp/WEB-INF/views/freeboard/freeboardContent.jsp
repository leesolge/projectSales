<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<script type="text/javascript">
	function Update(replynum, child){
		var replyUpdate = document.replyUpdate;
		replyUpdate.replynum.value = replynum;
		replyUpdate.child.value = child;
		replyUpdate.submit();
	}

	function Delete(replynum, child){
		var replyDelete = document.replyDelete;
		replyDelete.replynum.value = replynum;
		replyDelete.child.value = child;
		replyDelete.submit();
	}
	
	function ReReply(replynum){
		var reReply = document.reReplyWrite;
		reReplyWrite.replynum.value = replynum;
		reReplyWrite.submit();
	}
</script>

<body><br>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding"><br>
			<!-- 게시판 글 -->
			<table class="w3-table w3-border-top w3-bordered">
				<tr>
					<td class="w3-text-gray" style="text-align: left; width: 80px;">제목　 | </td>
					<td style="text-align: left;"><span>${freeboardVO.title}</span></td>
					<td class="w3-text-gray" style="text-align: left; width: 80px;">작성일 | </td>
					<td style="width: 80px; text-align: left;"><fmt:formatDate value="${freeboardVO.regDate}" pattern="yy-MM-dd"/></td>
				</tr>
				<tr style="text-align: left;">
					<td class="w3-text-gray" style="text-align: left; width: 80px;">작성자 | </td>
					<td style="text-align: left;"><span>${freeboardVO.name}</span></td>
					<td class="w3-text-gray" style="text-align: left; width: 80px;">댓글　 | </td>
					<td style="width: 80px; text-align: left;">${count}</td>
				</tr>
			</table>
			<br>
			<textarea class="w3-input" name="content" style="width: 100%; min-height: 300px; resize: none;"	readonly>${freeboardVO.content}</textarea>
			<br>
	
		<!-- 수정,삭제,목록 기능 버튼 -->
		<div class="w3-row">
			<div class="w3-right">
				<c:if test="${memberInfo.name==freeboardVO.name}">
					<input class="w3-btn w3-border w3-text-brown w3-border-brown w3-round-large w3-small w3-white" type="button" value="수정"
						onclick="location='/erp/freeboard/freeboardUpdateForm?num=${freeboardVO.num}'" />
					<input class="w3-btn w3-border w3-text-brown w3-border-brown w3-round-large w3-small w3-white" type="button" value="삭제"
						onclick="location='/erp/freeboard/freeboardDelete?num=${freeboardVO.num}'" />
				</c:if>
				<button class="w3-btn w3-border w3-text-brown w3-border-brown w3-round-large w3-small w3-white"
					onclick="location='/erp/freeboard/freeboardList'">목록</button>
			</div>
		</div>
		<br>
	
		<!-- 댓글 작성 부분 -->
		<div class="w3-row">
			<form action="/erp/freeboard/replyWrite" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				<table style="width: 100%">
					<tr>
						<td class="w3-text-gray" style="width: 80px;"><span>${memberInfo.name}</span></td>
						<td><input class="w3-input w3-border" type="text" name="reply" required></td>
						<td style="width: 50px;">
						<button class="w3-btn w3-input page_button w3-round-large" type="submit">
						<i class="fa fa-pencil"></i>
						</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
				
		<!-- 달려있는 댓글 보기 -->
		<div class="w3-row w3-hoverable">
			<br>
			<form action="/erp/freeboard/replyDelete" name="replyDelete" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="child" value="${freeboardReplyVO.child}">
				<input type="hidden" name="replynum" value="${freeboardReplyVO.replynum}">
			</form>
			<form action="/erp/freeboard/replyUpdateForm" name="replyUpdate" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="child" value="${freeboardReplyVO.child}">
				<input type="hidden" name="replynum" value="0">
			</form>
			<form action="/erp/freeboard/reReplyWriteForm" name="reReplyWrite" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="replynum" value="${freeboardReplyVO.replynum}">
				<input type="hidden" name="empno" value="${memberInfo.empno}">
			</form>
			
			<table class="w3-table w3-bordered w3-striped w3-border-top w3-small" style="width: 100%">
				<c:forEach var="replyList" items="${replyList}">
				<tr>
					<c:if test="${replyList.child=='0'}">
						<td class="w3-text-gray" style="width: 80px;">${replyList.name}</td>
						<td style="text-align: left;">${replyList.reply}</td>
						<c:if test="${memberInfo.empno!=replyList.empno}">
							<td class="w3-small" style="width:120px;">
								<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd. hh:mm"/>
							</td>
							<td class="w3-large" style="width: 40px;"></td>
							<td class="w3-large" style="width: 40px;"></td>
							<td class="w3-large" style="width: 40px;">
								<a class="w3-hover-text-red" onclick="ReReply('${replyList.replynum}')"><i class="fa fa-commenting"></i></a>
							</td>
						</c:if>
						<c:if test="${memberInfo.empno==replyList.empno}">
							<td class="w3-small" style="width:120px;">
								<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd. hh:mm"/>
							</td>
							<td class="w3-large" style="width: 40px;">
								<a class="w3-hover-text-blue" onclick="Update('${replyList.replynum}', '${replyList.child}')"><i class="fa fa-pencil-square"></i></a>
							</td>
							<td class="w3-large" style="width: 40px;">
								<a class="w3-hover-text-red" onclick="Delete('${replyList.replynum}', '${replyList.child}')"><i class="fa fa-window-close"></i></a>
							</td>
							<td class="w3-large" style="width: 40px;">
								<a class="w3-hover-text-red" onclick="ReReply('${replyList.replynum}')"><i class="fa fa-commenting"></i></a>
							</td>
						</c:if>
					</c:if>
					
					<!-- 대댓글 보기 -->
					<c:if test="${replyList.child!='0'}">
						<td class="w3-text-gray" style="width: 80px;">${replyList.name}</td>
						<td style="text-align: left;"><i class="fa fa-hand-o-right"></i>${replyList.reply}</td>
						<td class="w3-small" style="width:120px;">
							<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd. hh:mm"/>
						</td>
						<c:if test="${memberInfo.empno!=replyList.empno}">
							<td class="w3-large" style="width: 40px;"></td>
							<td class="w3-large" style="width: 40px;"></td>
							<td class="w3-large" style="width: 40px;"></td>
						</c:if>
						<c:if test="${memberInfo.empno==replyList.empno}">
							<td class="w3-large" style="width: 40px;">
								<a class="w3-hover-text-blue" onclick="Update('${replyList.replynum}', '${replyList.child}')"><i class="fa fa-pencil-square"></i></a>
							</td>
							<td class="w3-large" style="width: 40px;">
								<a class="w3-hover-text-red" onclick="Delete('${replyList.replynum}', '${replyList.child}')"><i class="fa fa-window-close"></i></a>
							</td>
							<td class="w3-large" style="width: 40px;"></td>
						</c:if>
					</c:if>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
</html>