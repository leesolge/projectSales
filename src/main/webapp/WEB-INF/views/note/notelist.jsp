<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
		<style type="text/css">
			h4 {
				text-align: center;
			}
			.wrapper{
				border: 1px solid black; 
				width: 25%;
				height: 250px;
				/* overflow-y: scroll; */
				margin: auto;
				box-shadow: 3px 3px 6px #adadad;
				padding: 10px;
			}
		</style>
	</head>
	
	<body>
	<h4>확인하지 않은 쪽지</h4><br>
	<div class="wrapper">
		<c:if test="${receiveList==null}">
		</c:if>
		<c:if test="${receiveList!=null}">
			<c:forEach var="receive" items="${receiveList}">
				<div>
					<a href="view?noteNum=${receive.notenum}">
						<c:out value="${receive.sender}" />&nbsp;
						<c:out value="${receive.title}" />&nbsp;
						<c:out value="${receive.change}" />&nbsp;
					</a>
				</div>
				<br>
			</c:forEach>
		</c:if>
	</div>
	<center><button onclick="location.reload()">새로 고침</button>
	<button onclick="location.replace('rdetail')">목록 보기</button>
	<button onclick="location.replace('write')">쪽지 쓰기</button></center>
	
	<h4>확인받지 않은 쪽지</h4><br>
	<div class="wrapper">
		<c:if test="${sendList==null}">
		</c:if>
		<c:if test="${sendList!=null}">
			<c:forEach var="send" items="${sendList}">
				<div>
					<a href="view?noteNum=${send.notenum}">
						<c:out value="${send.sender}" />&nbsp;
						<c:out value="${send.title}" />&nbsp;
						<c:out value="${send.change}" />&nbsp;
					</a>
				</div>
				<br>
			</c:forEach>
		</c:if>
	</div>
	<center><button onclick="location.reload()">새로 고침</button>
	<button onclick="location.replace('sdetail')">목록 보기</button>
	<button onclick="location.replace('write')">쪽지 쓰기</button></center>
	</body>
</html>