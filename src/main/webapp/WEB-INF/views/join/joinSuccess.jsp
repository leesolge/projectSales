<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	${member.name }님 회원가입 감사합니다.
	승인될때 까지 기다려 주시기 바랍니다.
	아이디는 입력하신 메일로 발송됩니다.
	<br>
	<input type="button" value="홈으로" onclick="window.location='/erp/home'"> 
</body>

<meta http-equiv="Refresh" content="3; url=home">
</html>