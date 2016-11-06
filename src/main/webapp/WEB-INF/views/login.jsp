<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<c:url value="/login" var="loginURL"></c:url>
		<form action="${loginURL}" method="post">
			<fieldset>
				<ul id="loginBox">
					<li><label for="id">아이디</label>
					<input name="id" class="text" /></li>
					<li><label for="pwd">비밀번호</label>
					<input type="password" name="pwd" class="text" /></li>
				</ul>
				<p>
					<input type="submit" id="btnLogin" value="" />
				</p>
			</fieldset>
		</form>
	
	</body>
</html>