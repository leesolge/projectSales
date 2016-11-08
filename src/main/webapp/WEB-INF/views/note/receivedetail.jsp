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
				height: 500px;
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
		<c:if test="${list==null}">
		</c:if>
		<c:if test="${list!=null}">
			<c:forEach var="list" items="${list}">
				<div>
					<a href="view?noteNum=${list.notenum}">
						<c:out value="${list.sender}" />&nbsp;
						<c:out value="${list.title}" />&nbsp;
						<c:out value="${list.change}" />&nbsp;
					</a>
				</div>
				<br>
			</c:forEach>
		</c:if>
	</div>
	<br>
	
	<div class="pageWrap">
		<div id="back"><c:if test="${pageNum>=2}"><a href="rdetail?pageNum=${pageNum-1}">이전</a></c:if></div>
		<div id="1"><c:if test="${pageNum>=3}"><a href="rdetail?pageNum=${pageNum-2}">${pageNum-2}</a></c:if></div>
		<div id="2"><c:if test="${pageNum>=3}"><a href="rdetail?pageNum=${pageNum-1}">${pageNum-1}</a></c:if></div>
		<div id="3">${pageNum}</div>
		<div id="4"><c:if test="${max>pageNum&&max>=pageNum+1}"><a href="rdetail?pageNum=${pageNum+1}">${pageNum+1}</a></c:if></div>
		<div id="5"><c:if test="${max>pageNum&&max>=pageNum+2}"><a href="rdetail?pageNum=${pageNum+2}">${pageNum+2}</a></c:if></div>
		<div id="go"><c:if test="${max>pageNum}"><a href="rdetail?pageNum=${pageNum+1}">다음</a></c:if></div>
	</div>
	
	
	
	
	<center><button onclick="location.reload()">새로 고침</button>
	<button onclick="location.replace('write')">쪽지 쓰기</button></center>
	
	</body>
</html>