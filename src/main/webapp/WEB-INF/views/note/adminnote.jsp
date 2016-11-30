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
				function reNote(pn, nn){
					var jumping = document.res;
					jumping.pageNum.value=pn;
					jumping.notenum.value=nn;
					if (confirm("해당 쪽지를 복구하시겠습니까?") == true){
						jumping.submit();
					}else{
					    return;
					}
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
<body><br>
	<form action="/erp/admin/note" name="jump" method="post">
			<input type="hidden" name="pageNum" value="0">
			<input type="hidden" name="field" value="${field}">
			<input type="hidden" name="keyword" value="${keyword}">
	</form>
	<form action="/erp/admin/restorenote" name="res" method="post">
			<input type="hidden" name="pageNum" value="0">
			<input type="hidden" name="notenum" value="0">
			<input type="hidden" name="field" value="${field}">
			<input type="hidden" name="keyword" value="${keyword}">
	</form>
	<div class="w3-container w3-tiny">
		<div class="w3-card-2 w3-white w3-round-large w3-padding">
		<div class="w3-row">
			<h3><i class="fa fa-cogs"></i>  쪽지관리　</h3>
		</div><br>
			<div class="w3-container">
				<c:forEach var="make" items="${list}">
					<div class="w3-container w3-third w3-margin-bottom">
						<div class="w3-card-2 w3-white">
							<header class="w3-container w3-dark-grey">
								<table class="w3-table">
									<tr>
										<td><span class="w3-small" title="${make.title}"><a>${make.title}</a></span></td>
										<td>
											<div class="w3-right w3-tiny"><fmt:formatDate value="${make.senddate}" pattern="yy-MM-dd"/></div><br>
											<div class="w3-right w3-tiny"><fmt:formatDate value="${make.senddate}" pattern="a-hh:mm:ss"/></div>
										</td>
									</tr>
								</table>
							</header>
							<div class="w3-container">
								<table class="w3-table">
									<tr>
										<td style="width: 70px;">
											<b>보낸사람 :</b>
										</td>
										<td>
											<span title="${make.sname}">${make.sname}(${make.steam}-${make.sauth})</span>
										</td>
									</tr>
									<tr>
										<td>
											<b>받은사람 :</b>
										</td>
										<td>
											<span title="${make.rname}">${make.rname}(${make.rteam}-${make.rauth})</span>
										</td>
									</tr>
								</table>
								<hr>
									<textarea class="w3-input" name="content" style="width: 100%; min-height: 100px; resize: none;"	readonly>${make.content}</textarea>
								<div class="w3-right">
									<button class="w3-round-large w3-white" onclick="javascript:reNote('${pageNum-1}', '${make.notenum}')" title="복구"><i class="fa fa-share"></i></button>
								</div>
							</div>
						</div>
						<br>
					</div>
				</c:forEach>
			</div>
			<div class="w3-center w3-small">
				<div class="w3-right">
					<button class="w3-btn w3-border w3-text-grey w3-border-grey w3-round-large w3-small w3-white" onclick="location.href='/erp/note/list'">목록</button>
				</div>
			<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">　&laquo;</a>　</c:if>
			<c:if test="${pageNum>=3}"><a href="javascript:jumpPage('${pageNum-2}')">　${pageNum-2}</a>　</c:if>
			<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">　${pageNum-1}</a>　</c:if>
			<font color="red">　${pageNum}　</font>
			<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">　${pageNum+1}</a>　</c:if>
			<c:if test="${max>=pageNum+2}"><a href="javascript:jumpPage('${pageNum+2}')">　${pageNum+2}</a>　</c:if>
			<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">　&raquo;</a>　</c:if>
			<br><br>
			<form action="/erp/admin/note" method="post">
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
					<c:if test="${field=='sname'}">
						<option value="sname" selected="selected">발신인</option>
					</c:if>
					<c:if test="${field!='sname'}">
						<option value="sname">발신인</option>
					</c:if>
					<c:if test="${field=='rname'}">
						<option value="rname" selected="selected">수신인</option>
					</c:if>
					<c:if test="${field!='rname'}">
						<option value="rname">수신인</option>
					</c:if>
				</select>
				<input name="keyword" class="w3-border w3-border-grey" type="text" value="${keyword}" style="width: 120px; height: 30px;">
				<button class="w3-border w3-border-grey w3-grey" type="submit" style="height: 30px;"><i class="fa fa-search"></i></button>
			</form>
			</div>
		<br>
		</div>
	</div>
	<br>
</body>
</html>