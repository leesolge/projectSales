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
	<c:if test="${pageCheck!='etc'}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="keyword" value="${keyword}">
	</c:if>
	</form>
	<c:if test="${pageCheck=='receive'}"><c:set var="ad" value="rd"/></c:if>
	<c:if test="${pageCheck=='send'}"><c:set var="ad" value="sd"/></c:if>
	<c:if test="${pageCheck=='etc'}"><c:set var="ad" value="li"/></c:if>
	${ad}
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
	
		<div style="margin: auto;">
			<form action="/erp/note/replys" method="post">
				<input type="hidden" name="pageCheck" value="${pageCheck}">
				<input type="hidden" name="notenum" value="${notenum}">
			<c:if test="${pageCheck!='etc'}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
			</c:if>
				<table>
					<tr>
						<td>발신인 : ${svo.name}<input type="hidden" name="sender" value="${svo.empno}"></td>
						<td>수신인 : ${rvo.name}<input type="hidden" name="receiver" value="${rvo.empno}"></td>
					</tr>
					<tr>
						<td colspan="2">제목&nbsp;<input type="text" name="title" size="30" required="required"></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><textarea cols="35" rows="6" name="content" required="required"></textarea></td>
					</tr>
					<tr>
						<td><input type="submit" value="전송"></td>
						<td><button onclick="javascript:jumpPage('${ad}')">목록 보기</button></td>
					</tr>
				</table>
			</form>
			<button onclick="javascript:content('${notenum}')">원래 쪽지</button>
		</div>
		
		
	</body>
</html>