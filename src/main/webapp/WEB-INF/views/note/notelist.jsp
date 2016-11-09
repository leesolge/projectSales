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
		<title>쪽지</title>
		<style type="text/css">
			h4 {
				text-align: center;
			}
			table {
				margin: auto;
			}
			td {
				text-align: center;
			}
			.center{
				margin: auto;
				text-align: center;
			}
			.paging{
				width: 40px;
			}
			.wrapper{
				border: 1px solid black;
				width: 30%;
				height: 200px;
				overflow-y: scroll;
				margin: auto;
				box-shadow: 3px 3px 6px #adadad;
				padding: 10px;
				text-align: center;
			}
		</style>
	</head>
	
	<body>
	<form action="/erp/note/write" name="write" method="post">
		<input type="hidden" name="pageCheck" value="etc">
		<input type="hidden" name="rec" value="0">
	</form>
	<form action="/erp/note/sdetail" name="sd" method="post">
	</form>
	<form action="/erp/note/rdetail" name="rd" method="post">
	</form>
	<form action="/erp/note/view" name="cont" method="post">
		<input type="hidden" name="pageCheck" value="etc">
		<input type="hidden" name="notenum" value="0">
	</form>
	
	<h4>최근 받은 쪽지</h4>
	<div class="wrapper">
		<table>
			<c:forEach var="receive" items="${receiveList}">
				<tr>
					<td colspan="2"><c:out value="${receive.change}" /></td>
				</tr>
				<tr>
					<td><a href="javascript:writePage('${receive.sender}')"><c:out value="${receive.sender}" /></a></td>
					<td><c:out value="${receive.receiver}" /></td>
				</tr>
				<tr><td colspan="2">
				<c:if test="${receive.checks==0}"><b></c:if>
					<a href="javascript:content('${receive.notenum}')"><c:out value="${receive.title}" /></a>
				<c:if test="${receive.checks==0}"></b></c:if></td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>
			</c:forEach>
		</table>
	</div>
	<div class="center">
		<button onclick="location.reload()">새로 고침</button>
		<button onclick="jumpPage('rd')">목록 보기</button>
	</div>
	
	<br>
	<br>
	<h4>최근 보낸 쪽지</h4>
	<div class="wrapper">
		<table>
			<c:forEach var="send" items="${sendList}">
				<tr>
					<td colspan="2"><c:out value="${send.change}" /></td>
				</tr>
				<tr>
					<td><c:out value="${send.sender}" /></td>
					<td><a href="javascript:writePage('${send.receiver}')"><c:out value="${send.receiver}" /></a></td>
				</tr>
				<tr><td colspan="2">
				<c:if test="${send.checks==0}"><b></c:if>
					<a href="javascript:content('${send.notenum}')"><c:out value="${send.title}" /></a>
				<c:if test="${send.checks==0}"></b></c:if></td>
				</tr>
				<tr><td colspan="2">&nbsp;</td></tr>
			</c:forEach>
		</table>
	</div>
	<div class="center">
		<button onclick="location.reload()">새로 고침</button>
		<button onclick="jumpPage('sd')">목록 보기</button>
	</div>
	</body>
</html>