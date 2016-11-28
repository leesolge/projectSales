<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	<title>받은 쪽지함</title>
</head>
	
<body><br>
	<form action="/erp/note/write" name="write" method="post">
		<input type="hidden" name="pageCheck" value="receive">
		<input type="hidden" name="rec" value="0">
	</form>
	<form action="/erp/note/rdetail" name="jump" method="post">
			<input type="hidden" name="pageNum" value="0">
			<input type="hidden" name="field" value="${field}">
			<input type="hidden" name="keyword" value="${keyword}">
	</form>
	<form action="/erp/note/view" name="cont" method="post">
		<input type="hidden" name="pageCheck" value="receive">
		<input type="hidden" name="notenum" value="0">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<input type="hidden" name="field" value="${field}">
		<input type="hidden" name="keyword" value="${keyword}">
	</form>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<h4>- 받은 쪽지함<a href="#" onclick="location.reload()"> <i class="fa fa-refresh"></i></a></h4>
			<div class="w3-row">
				<table class="w3-table w3-small">
					<tr class="w3-light-grey">
						<td style="width: 50px;"></td>
						<td style="width: 70px;">발신자</td>
						<td>제목</td>
						<td style="width: 100px;">날짜　</td>
					</tr>
					<c:forEach var="list" items="${list}">
					<tr>
						<td style="width: 50px;">
							<c:if test="${list.checks!=0}">
								<i class="fa fa-envelope-open-o"></i>
							</c:if>
							<c:if test="${list.checks==0}">
								<i class="fa fa-envelope"></i>
							</c:if>
						</td>
						<td style="width: 70px;">
							<a href="javascript:writePage('${list.sender}')">
								<span title="${list.sender} ${list.sname}">${list.sname}</span>	
							</a>
						</td>
						<td style="text-align: left;">
						<a href="javascript:content('${list.notenum}')">
							<c:if test="${list.checks==0}">
								<b><span title="${list.title}" style="text-decoration: underline;">${list.title}</span></b>
							</c:if>
							<c:if test="${list.checks!=0}">
								<span title="${list.title}">${list.title}</span>
							</c:if>
						</a>
						</td>
						<td class="w3-tiny w3-center" style="width: 100px;">
							<fmt:formatDate value="${list.senddate}" pattern="yy-MM-dd"/><br>
							<fmt:formatDate value="${list.senddate}" pattern="a hh:mm"/>
						</td>
					</tr>
					</c:forEach>
					<tr>
						<td class="w3-center" colspan="4">
							<button class="w3-btn w3-border w3-text-grey w3-border-grey w3-round-large w3-small w3-white" onclick="javascript:writePage('0')">
								쪽지 쓰기
							</button>
							<button class="w3-btn w3-border w3-text-grey w3-border-grey w3-round-large w3-small w3-white" onclick="location='/erp/note/list'">
								메인
							</button>
						</td>
					</tr>
					<tr>
						<td class="w3-centered" colspan="4">
							<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">　&laquo;</a>　</c:if>
							<c:if test="${pageNum>=3}"><a href="javascript:jumpPage('${pageNum-2}')">　${pageNum-2}</a>　</c:if>
							<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">　${pageNum-1}</a>　</c:if>
							<font color="red">　${pageNum}　</font>
							<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">　${pageNum+1}</a>　</c:if>
							<c:if test="${max>=pageNum+2}"><a href="javascript:jumpPage('${pageNum+2}')">　${pageNum+2}</a>　</c:if>
							<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">　&raquo;</a>　</c:if>
							<br><br>
							<form action="/erp/note/rdetail" method="post">
								<select name="field" class="w3-border w3-border-grey" style="width: 70px; height: 30px;">
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
										<option value="sender" selected="selected">발신자</option>
									</c:if>
									<c:if test="${field!='sender'}">
										<option value="sender">발신자</option>
									</c:if>
								</select>
								<input name="keyword" class="w3-border w3-border-grey" type="text" value="${keyword}" style="width: 120px; height: 30px;">
								<button class="w3-border w3-border-grey w3-grey" type="submit" style="height: 30px;"><i class="fa fa-search"></i></button>
							</form>
						</td>
					</tr>
				</table>
				<br>
			</div>
		</div>
	</div>
<br></body>
</html>