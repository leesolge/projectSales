<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	로그인 실패
	<c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
	<body>
	</body>
</html>