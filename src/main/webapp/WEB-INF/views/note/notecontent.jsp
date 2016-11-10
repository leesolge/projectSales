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
		<title>쪽지 보기</title>
	</head>
	
	<body>
	<c:if test="${pageCheck=='receive'}"><c:set var="ad" value="rd"/></c:if>
	<c:if test="${pageCheck=='send'}"><c:set var="ad" value="sd"/></c:if>
	<c:if test="${pageCheck=='etc'}"><c:set var="ad" value="li"/></c:if>
	${ad}
	<form action="/erp/note/write" name="write" method="post">
		<input type="hidden" name="pageCheck" value="etc">
		<input type="hidden" name="rec" value="0">
	</form>
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
	<form action="/erp/note/reply" name="rp" method="post">
		<input type="hidden" name="pageCheck" value="${pageCheck}">
		<input type="hidden" name="notenum" value="${notenum}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="keyword" value="${keyword}">
		<input type="hidden" name="receiver" value="${svo.empno}">
	</form>
	<form action="/erp/note/list" name="li" method="post">
	</form>
	
	<hr>
		${pageCheck}<br>
		발신 날짜 : ${vo.senddate}<br>
		발신자 : ${svo.team} ${svo.name} ${svo.auth}<br>
		수신자 : ${rvo.team} ${rvo.name} ${rvo.auth}<br>
		제목 : ${vo.title}<br>
		내용 : ${vo.content}<br>
	<hr>
		<c:if test="${empno==rvo.empno}"><button onclick="javascript:jumpPage('rp')">답장하기</button></c:if>
		<button onclick="javascript:jumpPage('${ad}')">목록 보기</button>
		
	</body>
</html>