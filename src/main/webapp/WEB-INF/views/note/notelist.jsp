<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
	<title>쪽지</title>
</head>
<body><br>
	<s:authorize access="hasRole('ROLE_ADMIN')">
		<a href="#" onclick="jumpPage('adm')" class="w3-right"><i class="fa fa-cogs"></i>  쪽지관리　</a><br><br>
	</s:authorize>
	<form action="/erp/admin/note" name="adm"></form>
	<form action="/erp/note/write" name="write" method="post">
		<input type="hidden" name="pageCheck" value="etc">
		<input type="hidden" name="rec" value="0">
	</form>
	<form action="/erp/note/sdetail" name="sd" method="post"></form>
	<form action="/erp/note/rdetail" name="rd" method="post"></form>
	<form action="/erp/note/view" name="cont" method="post">
		<input type="hidden" name="pageCheck" value="etc">
		<input type="hidden" name="notenum" value="0">
	</form>
	
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" style="min-height: 300px;">
			<h4>- 받은 쪽지함<a href="#" onclick="location.reload()"> <i class="fa fa-refresh"></i></a></h4>
			<div class="w3-row">
				<a href="#" onclick="jumpPage('rd')" class="w3-text-grey w3-right">
					<i class="fa fa-caret-right"></i>  더보기
				</a>
				<table class="w3-table w3-small">
					<tr class="w3-light-grey">
						<td style="width: 50px;"></td>
						<td style="width: 70px;">발신자</td>
						<td>제목</td>
						<td style="width: 100px;">날짜　</td>
					</tr>
				</table>
				<div style="height:250px; overflow: auto;">
				<table class="w3-table w3-small">
					<c:forEach var="receive" items="${receiveList}">
					<tr>
						<td style="width: 50px;">
							<c:if test="${receive.checks!=0}">
								<i class="fa fa-envelope-open-o"></i>
							</c:if>
							<c:if test="${receive.checks==0}">
								<i class="fa fa-envelope"></i>
							</c:if>
						</td>
						<td style="width: 70px;">
							<c:if test="${receive.sender!=receive.receiver}">
							<a href="javascript:writePage('${receive.sender}')">
							
								<span title="${receive.sender} ${receive.sname}">${receive.sname}</span>	
							</a>
							</c:if>
							<c:if test="${receive.sender==receive.receiver}">
								<span title="${receive.sender} ${receive.sname}">${receive.sname}</span>	
							</c:if>
						</td>
						<td style="text-align: left;">
							<a href="javascript:content('${receive.notenum}')">
							<c:if test="${receive.checks==0}">
								<b><span title="${receive.title}" style="text-decoration: underline;">${receive.title}</span></b>
							</c:if>
							<c:if test="${receive.checks!=0}">
								<span title="${receive.title}">${receive.title}</span>
							</c:if>
							</a>
						</td>
						<td class="w3-tiny w3-center" style="width: 100px;">
							<fmt:formatDate value="${receive.senddate}" pattern="yy-MM-dd"/><br>
							<fmt:formatDate value="${receive.senddate}" pattern="a hh:mm"/>
						</td>
					</tr>
					</c:forEach>
				</table>
				</div>
				<br>
			</div>
		</div>
		<br>
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" style="min-height: 300px;">
			<h4>- 보낸 쪽지함<a href="#" onclick="location.reload()"> <i class="fa fa-refresh"></i></a></h4>
			<div class="w3-row">
				<a href="#" onclick="jumpPage('sd')" class="w3-text-grey w3-right">
					<i class="fa fa-caret-right"></i>  더보기
				</a>
				<table class="w3-table w3-small">
					<tr class="w3-light-grey">
						<td style="width: 50px;"></td>
						<td style="width: 70px;">수신자</td>
						<td>제목</td>
						<td style="width: 100px;">날짜　</td>
					</tr>
				</table>
				<div style="height:250px; overflow: auto;">
				<table class="w3-table w3-small">
					<c:forEach var="send" items="${sendList}">
					<tr>
						<td style="width: 50px;">
							<c:if test="${send.checks!=0}">
								<i class="fa fa-envelope-open-o"></i>
							</c:if>
							<c:if test="${send.checks==0}">
								<i class="fa fa-envelope"></i>
							</c:if>
						</td>
						<td style="width: 70px;">
							<c:if test="${send.sender!=send.receiver}">
								<a href="javascript:writePage('${send.receiver}')">
									<span title="${send.receiver} ${send.rname}">${send.rname}</span>	
								</a>
							</c:if>
							<c:if test="${send.sender==send.receiver}">
									<span title="${send.receiver} ${send.rname}">${send.rname}</span>	
							</c:if>
						</td>
						<td style="text-align: left;">
						<a href="javascript:content('${send.notenum}')">
							<c:if test="${send.checks==0}">
								<b><span title="${send.title}" style="text-decoration: underline;">${send.title}</span></b>
							</c:if>
							<c:if test="${send.checks!=0}">
								<span title="${send.title}">${send.title}</span>
							</c:if>
						</a>
						</td>
						<td class="w3-tiny w3-center" style="width: 100px;">
							<fmt:formatDate value="${send.senddate}" pattern="yy-MM-dd"/><br>
							<fmt:formatDate value="${send.senddate}" pattern="a hh:mm"/>
						</td>
					</tr>
					</c:forEach>
				</table>
				</div>
				<br>
			</div>
		</div>
	</div>
	<br>
</body>
	
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
</html>