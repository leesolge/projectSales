<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
	<script type="text/javascript">
		function jumpPage(id){
			var name=id;
			document.forms[name].submit();
		}
	</script>
		<style type="text/css">
			h4 {
				text-align: center;
			}
			.wrapper{
				border: 1px solid black; 
				width: 25%;
				height: 500px;
				/* overflow-y: scroll; */
				margin: auto;
				box-shadow: 3px 3px 6px #adadad;
				padding: 10px;
			}
		</style>
		<title>Title</title>
	</head>
	
	<body>
	<h4>보낸 쪽지</h4>
	<div class="wrapper">
		<c:if test="${list==null}">
		</c:if>
		<c:if test="${list!=null}">
			<c:forEach var="list" items="${list}">
				<div>
				<c:if test="${list.checks==0}"><b></c:if>
					<a href="view?noteNum=${list.notenum}">
						<c:out value="${list.sender}" />&nbsp;
						<c:out value="${list.title}" />&nbsp;
						<c:out value="${list.change}" />&nbsp;
					</a>
				<c:if test="${list.checks==0}"><b></c:if>
				</div>
				<br>
			</c:forEach>
		</c:if>
	</div>
	<br>
	${pageNum}
	<div class="pageWrap">
		<div class="page" id="back">
			<form action="/erp/note/sdetail" name="minus1" method="post">
				<input type="hidden" name="pageNum" value="${pageNum-1}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
			</form>
			<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('minus1')">이전</a></c:if></div>
			
		<div class="page" id="1">
			<form action="/erp/note/sdetail" name="minus2" method="post">
				<input type="hidden" name="pageNum" value="${pageNum-2}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
			</form>
			<c:if test="${pageNum>=3}"><a href="javascript:jumpPage('minus2')">${pageNum-2}</a></c:if></div>
		<div class="page" id="2">
			<form action="/erp/note/sdetail" name="minus" method="post">
				<input type="hidden" name="pageNum" value="${pageNum-1}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
			</form>
			<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('minus')">${pageNum-1}</a></c:if></div>
		<div class="page" id="3">${pageNum}</div>
		<div class="page" id="4">
			<form action="/erp/note/sdetail" name="plus1" method="post">
				<input type="hidden" name="pageNum" value="${pageNum+1}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
			</form>
			<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('plus1')">${pageNum+1}</a></c:if></div>
		<div class="page" id="5">
			<form action="/erp/note/sdetail" name="plus2" method="post">
				<input type="hidden" name="pageNum" value="${pageNum+2}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
			</form>
			<c:if test="${max>=pageNum+2}"><a href="javascript:jumpPage('plus2')">${pageNum+2}</a></c:if></div>
		<div class="page" id="go">
			<form action="/erp/note/sdetail" name="plus" method="post">
				<input type="hidden" name="pageNum" value="${pageNum+1}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
			</form>
			<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('plus')">다음</a></c:if></div>
	</div>
	
	<div>
	<form action="sdetail" method="post">
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
	
	<form action="/erp/note/write" name="write" method="post">
		<input type="hidden" name="pageCheck" value="send">
	</form>
	
	<center>
		<button onclick="location.reload()">새로 고침</button>
		<button onclick="javascript:jumpPage('write')">쪽지 쓰기</button>
		<button onclick="location='/erp/note/list'">첫 페이지</button>
	</center>
	
	</body>
</html>