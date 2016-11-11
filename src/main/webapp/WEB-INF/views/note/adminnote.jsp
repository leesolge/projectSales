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
			.center{
				margin: auto;
				width: 300px;
			}
			.paging{
				width: 40px;
			}
			.notes_wrap{
				width: 640px;
				height: 480px;
				margin: auto;
				padding: 10px;
				border: 1px solid black;
				overflow-y: scroll;
			}
			.wrap_one{
				border: 1px solid black;
				width: 270px;
				height: 270px;
				position: relative;
				display: inline-table;
				margin: 2%;
			}
			.title{
				border: 1px solid black;
				overflow:hidden;
				position: relative;
				margin: 8px;
				width: 232px;
				height: 20px;
				text-overflow: ellipsis;
			}
			.content{
				border: 1px solid black;
				position: relative;
				margin: 8px;
				width: 250px;
				height: 105px;
				overflow-y: scroll;
			}
		</style>
		<title>Title</title>
	</head>
	
	<body>
	<form action="/erp/admin/note" name="jump" method="post">
			<input type="hidden" name="pageNum" value="0">
			<input type="hidden" name="field" value="${field}">
			<input type="hidden" name="keyword" value="${keyword}">
	</form>
	
	
	
		<div class="notes_wrap">
		<c:forEach var="make" items="${list}">
			<div class="wrap_one">
				<div class="title">
				${make.change}
				</div>
				<div class="title">
				수신인 :&nbsp;${make.steam}&nbsp;${make.sname}&nbsp;${make.sauth}
				</div>
				<div class="title">
				발신인 :&nbsp;${make.rteam}&nbsp;${make.rname}&nbsp;${make.rauth}
				</div>
				<div class="title">
				제목 :&nbsp;${make.title}
				</div>
				<div class="content">
				${make.content}
				</div>
				<div class="title">
				</div>
			</div>
		</c:forEach>
		</div>
		
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
	<form action="/erp/admin/note" method="post">
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
		
		
		
	</body>
</html>