<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
		<script type="text/javascript">
			function jumpPage(wh){
				var name=wh;
				document.forms[name].submit();
			}
			function writePage(receive){
				var writes = document.write;
				writes.rec.value=receive;
				writes.submit();
			}
			function content(vl){
				var cont = document.cont;
				cont.notenum.value=vl;
				cont.submit();
			}
		</script>
	</head>
	
	<body><br>
	<c:if test="${pageCheck=='receive'}"><c:set var="ad" value="rd"/></c:if>
	<c:if test="${pageCheck=='send'}"><c:set var="ad" value="sd"/></c:if>
	<c:if test="${pageCheck=='etc'}"><c:set var="ad" value="li"/></c:if>
	<form action="/erp/note/sdetail" name="sd" method="post">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
	<form action="/erp/note/rdetail" name="rd" method="post">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
	<form action="/erp/note/list" name="li" method="post">
	</form>
	<div class="w3-container">
		<div class="w3-row">
			<div class="w3-container w3-grey">
				<h4 class="w3-text-white"><i class="fa fa-envelope-open"></i>  쪽지 쓰기</h4>
			</div>
			<form class="w3-container w3-white w3-card-4" action="/erp/note/writes" method="post">
				<br>
				<input type="hidden" name="sender" value="${id}">
				<input type="hidden" name="pageCheck" value="${pageCheck}"><br>
				<label class="w3-text-grey"><b>수신인</b></label>
				<c:if test="${rec!=0}">
				<input type="hidden" name="receiver" value="${rec}">
				<input class="w3-input w3-border w3-border-grey w3-round" type="text" readonly value="${receiverVo.team} - ${receiverVo.auth} - ${receiverVo.name}(${receiverVo.empno})">
				</c:if>
				<c:if test="${rec==0}">
					<select name="receiver" class="w3-input w3-border w3-border-grey w3-round">
						<c:forEach var="rlist" items="${list}">
							<option value="${rlist.empno}">${rlist.team} - ${rlist.auth} - ${rlist.name}(${rlist.empno})</option>
						</c:forEach>
					</select>
				</c:if><br>
				<label class="w3-text-grey"><b>제목</b></label>
				<input class="w3-input w3-border w3-border-grey w3-round" name="title" type="text" placeholder="제목을 입력하세요." required><br>
				<label class="w3-text-grey"><b>내용</b></label>
				<textarea class="w3-input w3-border w3-border-grey w3-round" name="content" placeholder="내용을 입력하세요."
				style="min-height: 300px; resize: none;" required></textarea><br>
				<div class="w3-row w3-center">
					<input class="w3-btn w3-grey w3-text-white" type="submit" value="전송">
					<button class="w3-btn w3-grey w3-text-white" onclick="javascript:jumpPage('${ad}')">목록 보기</button>
				</div>
			<br>
			</form>
		</div>
	</div>
	<br></body>
</html>