<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<head>
<link rel="shortcut icon" href="/erp/resources/image/favicon.ico">
<title>nodazi ERP</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body class="w3-dark-grey w3-animate-opacity">
	<c:url value="/login" var="loginURL"></c:url>
	<div class="w3-display-middle w3-center">
		<img src="/erp/resources/image/logowhite.png" class="w3-image" style="max-height: 200px;"><br>
		<button onclick="document.getElementById('id01').style.display='block'" class="w3-btn w3-round-xxlarge w3-dark-grey w3-border w3-border-white w3-section w3-padding">START</button>
	</div>
	<div id="id01" class="w3-modal">
		<div class="w3-modal-content w3-card-8 w3-animate-zoom" style="max-width:400px">
		<div class="w3-center"><br>
        	<img src="/erp/resources/image/logoblack.png" style="width:30%" class="w3-image">
		</div>
		<form class="w3-container" action="${loginURL}" method="post">
	        <div class="w3-section">
				<label class="w3-text-black"><b>ID</b></label>
				<input class="w3-input w3-border w3-margin-bottom" type="text" placeholder="Enter ID" name="id" required>
				<label class="w3-text-black"><b>Password</b></label>
				<input class="w3-input w3-border" type="password" placeholder="Enter Password" name="pwd" required><br>
				<div class="w3-row w3-center">
					<div class="w3-half"><button class="w3-btn w3-blue" type="submit">Login</button></div>
					<div class="w3-hide-medium w3-hide-large"><br><br></div>
					<div class="w3-half"><button onclick="document.getElementById('id01').style.display='none'" type="button" class="w3-btn w3-red">Cancel</button></div>
					<div class="w3-hide-medium w3-hide-large"><br><br></div>
				</div>
	        </div>
      	</form>
		<div class="w3-container w3-border-top w3-padding-16 w3-light-grey">
			<span class="w3-left w3-padding w3-hide-small">
				<a href="join">회원가입</a>
			</span>
			<span class="w3-right w3-padding w3-hide-small">
				<a href="/erp/confirmID">ID /Password 찾기</a>
			</span>
		</div>
	</div>
</div>
</body>
</html>