<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<head>
<title>Home</title>
</head>

<body>
	<c:url value="/login" var="loginURL"></c:url>
	<div class="w3-container w3-center">
	<p></p>
	</div>
	
	<div class="w3-container w3-center">
		<img src="resources/image/main.jpg" height="300">
	</div>
	
	<div class="w3-container w3-center">
	<p></p>
	</div>
	
	<div class="w3-row ">
		<div class="w3-col w3-left" style="width: 40%">			<p></p>		</div>
		<div class="w3-col w3-right" style="width: 40%">			<p></p>		</div>
		<div class="w3-rest w3-container" align="center">
			<form action="${loginURL}" method="post">
				
				<table class="w3-table w3-centered">
					<tr>
						<td colspan="2">
							<input type="text" name="id" placeholder="ID 입력"><br>	
							<input type="password" name="pwd" placeholder="Password 입력">
						</td>
					</tr>
					
					<tr>						
						<td><input type="submit" value="로그인" class="w3-btn w3-round-large" ></td>					
						<td><input type="button" value="회원가입"  class="w3-btn w3-round-large"  onclick="location.href='Join'""></td>
					</tr>				
				</table>
			</form>
		</div>
	</div>
</body>
</html>