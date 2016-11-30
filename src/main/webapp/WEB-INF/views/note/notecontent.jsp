<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			function del(){
				if (confirm("쪽지는 업무 상 증빙자료로 활용될 수 있습니다.\n정말 지우시겠습니까?") == true){    //확인
					document.forms['de'].submit();
				}else{
				    return;
				}
			}
		</script>
		<title>쪽지 보기</title>
	</head>
	<body><br>
	<c:if test="${pageCheck=='receive'}"><c:set var="ad" value="rd"/></c:if>
	<c:if test="${pageCheck=='send'}"><c:set var="ad" value="sd"/></c:if>
	<c:if test="${pageCheck=='etc'}"><c:set var="ad" value="li"/></c:if>
	<form action="/erp/note/reply" name="rp" method="post">
		<input type="hidden" name="pageCheck" value="${pageCheck}">
		<input type="hidden" name="notenum" value="${notenum}">
		<c:if test="${pageCheck!='etc'}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="field" value="${field}">
			<input type="hidden" name="keyword" value="${keyword}">
		</c:if>
		<input type="hidden" name="receiver" value="${svo.empno}">
	</form>
	<form action="/erp/note/notedel" name="de" method="post">
		<input type="hidden" name="pageCheck" value="${pageCheck}">
		<input type="hidden" name="notenum" value="${notenum}">
		<c:if test="${pageCheck!='etc'}">
			<input type="hidden" name="pageNum" value="${pageNum}">
			<input type="hidden" name="field" value="${field}">
			<input type="hidden" name="keyword" value="${keyword}">
		</c:if>
		<input type="hidden" name="receiver" value="${rvo.empno}">
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
	<div class="w3-container">
		<div class="w3-card-4 w3-white">
			<header class="w3-container w3-dark-grey">
				<table class="w3-table">
					<tr>
						<td><h3><span title="${vo.title}"><a>${vo.title}</a></span></h3></td>
					</tr>
					<tr>
						<td><div class="w3-right w3-tiny"><fmt:formatDate value="${vo.senddate}" pattern="yy-MM-dd / a-hh:mm:ss"/></div></td>
					</tr>
				</table>
			</header>
			<div class="w3-container">
					<table class="w3-table">
						<tr>
							<td style="width: 90px;">
								<b>보낸사람 :</b>
							</td>
							<td>
								<span title="${svo.name}">${svo.name}(${svo.team}-${svo.auth})</span>
							</td>
						</tr>
						<tr>
							<td>
								<b>받은사람 :</b>
							</td>
							<td>
								<span title="${rvo.name}">${rvo.name}(${rvo.team}-${rvo.auth})</span>
							</td>
						</tr>
					</table>
				<hr>
				<p>
					<textarea class="w3-input" name="content" style="width: 100%; min-height: 200px; resize: none;"	readonly>${vo.content}</textarea>
				</p>
				<div class="w3-right">
					<c:if test="${empno==rvo.empno}"><button class="w3-btn w3-border w3-text-grey w3-border-grey w3-round-large w3-small w3-white" onclick="javascript:jumpPage('rp')">답장</button></c:if>
						<button class="w3-btn w3-border w3-text-grey w3-border-grey w3-round-large w3-small w3-white" onclick="javascript:jumpPage('${ad}')">목록</button>
					<c:if test="${empno==rvo.empno}"><button class="w3-btn w3-border w3-text-grey w3-border-grey w3-round-large w3-small w3-white" onclick="javascript:del()">삭제</button></c:if>
				</div>
			</div>
			<br>
			<footer class="w3-container w3-dark-grey"><br></footer>
		</div>
	</div>
	</body>
</html>