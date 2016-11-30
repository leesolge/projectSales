<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
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
		<title>Title</title>
	</head>
	
<body>
	<form action="/erp/note/view" name="cont" method="post">
	<input type="hidden" name="pageCheck" value="${pageCheck}">
	<input type="hidden" name="notenum" value="${pageCheck}">
	<c:if test="${pageCheck!='etc'}">
	<input type="hidden" name="pageNum" value="${pageNum}">
	<input type="hidden" name="field" value="${field}">
	<input type="hidden" name="keyword" value="${keyword}">
	</c:if>
	</form>
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
	</form><br>
	<div class="w3-container">
		<div class="w3-row">
			<div class="w3-container w3-grey">
				<h4 class="w3-text-white"><i class="fa fa-envelope-open"></i>  
					답장하기
				</h4>
			</div>
			<form action="/erp/note/replys" method="post" class="w3-container w3-white w3-card-4">
				<br>
				<input type="hidden" name="pageCheck" value="${pageCheck}">
				<input type="hidden" name="notenum" value="${notenum}">
				<c:if test="${pageCheck!='etc'}">
					<input type="hidden" name="pageNum" value="${pageNum}">
					<input type="hidden" name="field" value="${field}">
					<input type="hidden" name="keyword" value="${keyword}">
				</c:if>
				<label class="w3-text-grey"><b>수신인</b></label>
				<input class="w3-input w3-border w3-border-grey w3-round" type="text" readonly value="${rvo.team} - ${rvo.auth} - ${rvo.name}(${rvo.empno})">
				<input type="hidden" name="sender" value="${svo.empno}">
				<input type="hidden" name="receiver" value="${rvo.empno}"><br>
				<label class="w3-text-grey"><b>제목</b></label>
				<input class="w3-input w3-border w3-border-grey w3-round" type="text" name="title" size="30" required="required"><br>
				<label class="w3-text-grey"><b>내용</b></label>
				<textarea class="w3-input w3-border w3-border-grey w3-round" name="content" placeholder="내용을 입력하세요."
				style="min-height: 300px; resize: none;" required></textarea>
				<div class="w3-row w3-center"><br>
					<input class="w3-btn w3-grey w3-text-white" type="submit" value="전송">
					<button class="w3-btn w3-grey w3-text-white" onclick="javascript:jumpPage('${ad}')">목록</button>
					<button class="w3-btn w3-grey w3-text-white" onclick="javascript:content('${notenum}')">뒤로</button>
				</div><br>
			</form>
		</div>
	</div>
	<br>
</body>
</html>