<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<head>
<style> 
 .container{
 	margin: 0 auto;
 	margin-top:8%;
 }
 .login{
 	 border-radius: 5px;
 }
 input:hover {
    background-color: #eeeeee;
 }

</style>
<title>Home</title>
</head>

<body>
  <div class="container">
	<c:url value="/login" var="loginURL"></c:url>
	<div class="w3-container w3-center">
	<p></p>
	</div>
	
	<div class="w3-container w3-center">
		<img src="resources/image/logo2.png" height="200">
	</div>
	
	<div class="w3-container w3-center">
	<p></p>
	</div>
	
	<div class="w3-row ">
		<div class="w3-col w3-left" style="width: 30%"><p></p></div>
		<div class="w3-col w3-right" style="width: 30%"><p></p></div>
		<div class="w3-rest w3-container" align="center">
			<form action="${loginURL}" method="post">
				
				<table class="w3-table w3-centered">
					<tr>
						<td>
							ID 
						</td>
						<td>
							<input type="text" name="id" placeholder="ID 입력" class="login"><br>
						</td>
					</tr>
					<tr>
						<td>
							PW  
						</td>
						<td>
							<input type="password" name="pwd" placeholder="Password 입력" class="login">
						</td>
					</tr>
					
					<tr>						
						<td colspan="2">
						<input type="submit" value="로그인" class="w3-btn w3-round-large" >&nbsp;				
						<input type="button" value="회원가입"  class="w3-btn w3-round-large"  onclick="location.href='join'"></td>
					</tr>				
					<tr>
					<td colspan="2"><a href="/erp/confirmID">아이디 찾기</a></td> 
					</tr>
					<tr>
					<td colspan="2"><a href="/erp/confirmPWD">비밀번호 찾기</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
  </div>
</body>
</html>