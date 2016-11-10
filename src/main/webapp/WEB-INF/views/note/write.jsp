<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
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
	</head>
	
	<body>
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
			<form action="/erp/note/writes" method="post">
				<input type="hidden" name="pageCheck" value="${pageCheck}">
				<table>
					<tr>
						<td>발신인 : ${senderName}<input type="hidden" name="sender" value="${id}"></td>
						<td>수신인 : 
						<c:if test="${rec!=0}">${receiverVo.empno}&nbsp;${receiverVo.name}&nbsp;${receiverVo.auth}&nbsp;${receiverVo.team}&nbsp;<input type="hidden" name="receiver" value="${rec}"></c:if>
						<c:if test="${rec==0}">
							<select name="receiver">
								<c:forEach var="rlist" items="${list}">
									<option value="${rlist.empno}">${rlist.empno}&nbsp;${rlist.name}&nbsp;${rlist.auth}&nbsp;${rlist.team}&nbsp;</option>
								</c:forEach>
							</select>
						</c:if>
						</td>
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
		</div>
		
		
	</body>
</html>