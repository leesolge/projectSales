<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<script type="text/javascript">
			function jumpPage(pn){
				var jumping = document.jump;
				jumping.pageNum.value=pn;
				jumping.submit();
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
				width: 300px;
			}
			.paging{
				width: 40px;
			}
			.wrapper{
				border: 1px solid black;
				width: 50%;
				height: 400px;
				/* overflow-y: scroll; */
				margin: auto;
				box-shadow: 3px 3px 6px #adadad;
				padding: 10px;
				text-align: center;
			}
		</style>
		<title>보낸 쪽지함</title>
	</head>
	
	<body>
	<form action="/erp/note/write" name="write" method="post">
		<input type="hidden" name="pageCheck" value="send">
		<input type="hidden" name="rec" value="0">
	</form>
	<form action="/erp/note/sdetail" name="jump" method="post">
			<input type="hidden" name="pageNum" value="0">
			<input type="hidden" name="field" value="${field}">
			<input type="hidden" name="keyword" value="${keyword}">
		</form>
	<form action="/erp/note/view" name="cont" method="post">
		<input type="hidden" name="pageCheck" value="send">
		<input type="hidden" name="notenum" value="0">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
	
	<h4>보낸 쪽지</h4>
	<div class="wrapper">
		<c:if test="${list==null}">
		</c:if>
		<c:if test="${list!=null}">
			<table>
				<tr>
					<td>받은 날짜</td><td>발신인</td><td>수신인</td><td>제목</td>
				</tr>
				<c:forEach var="list" items="${list}">
					<tr>
						<td><c:out value="${list.change}" /></td>
						<td><c:out value="${list.sender}" /></td>
						<td><a href="javascript:writePage('${list.receiver}')"><c:out value="${list.receiver}" /></a></td>
						<td><c:if test="${list.checks==0}"><b></c:if>
						<a href="javascript:content('${list.notenum}')"><c:out value="${list.title}" /></a>
						<c:if test="${list.checks==0}"></b></c:if></td>
					</tr>
				</c:forEach>
			</table>
		</c:if>
	</div>
	<br>
	
	<div class="center">
		<table><tr>
			<td class="paging"><c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">이전</a></c:if>&nbsp;</td>
			<td class="paging"><c:if test="${pageNum>=3}"><a href="javascript:jumpPage('${pageNum-2}')">${pageNum-2}</a></c:if>&nbsp;</td>
			<td class="paging"><c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">${pageNum-1}</a></c:if>&nbsp;</td>
			<td class="paging">${pageNum}</td>
			<td class="paging"><c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">${pageNum+1}</a></c:if>&nbsp;</td>
			<td class="paging"><c:if test="${max>=pageNum+2}"><a href="javascript:jumpPage('${pageNum+2}')">${pageNum+2}</a></c:if>&nbsp;</td>
			<td class="paging"><c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">다음</a></c:if>&nbsp;</td>
		</tr></table>
	</div>
	
	<div class="center">
	<form action="/erp/note/sdetail" method="post">
		<select name="field">
			<c:if test="${field=='title'}">
				<option value="title" selected="selected">제목</option>
			</c:if>
			<c:if test="${field!='title'}">
				<option value="title">제목</option>
			</c:if>
			<c:if test="${field=='content'}">
				<option value="content" selected="selected">내용</option>
			</c:if>
			<c:if test="${field!='content'}">
				<option value="content">내용</option>
			</c:if>
			<c:if test="${field=='sender'}">
				<option value="sender" selected="selected">작성자</option>
			</c:if>
			<c:if test="${field!='sender'}">
				<option value="sender">작성자</option>
			</c:if>
		</select>&nbsp;
		<input name="keyword" type="text" size="10" value="${keyword}">
		<input type="submit" value="검색">
	</form>
	</div>
	
	<p align="center">
		<button onclick="location.reload()">새로 고침</button>
		<button onclick="javascript:writePage('0')">쪽지 쓰기</button>
		<button onclick="location='/erp/note/list'">첫 페이지</button>
	</p>
	
	</body>
</html>