<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
	받은 메시지<br>
	<c:forEach var="receive" items="${receiveList}">
	<c:out value="${receive.change}" />&nbsp;
	<c:out value="${receive.sender}" />&nbsp;
	<c:out value="${receive.title}" />&nbsp;
	<c:out value="${receive.content}" />&nbsp;
	<br>
	</c:forEach>
	<br>
	보낸 메시지<br>
	<c:forEach var="send" items="${sendList}">
	<c:out value="${send.change}" />&nbsp;
	<c:out value="${send.sender}" />&nbsp;
	<c:out value="${send.title}" />&nbsp;
	<c:out value="${send.content}" />&nbsp;
	<br>
	</c:forEach>
	</body>
</html>