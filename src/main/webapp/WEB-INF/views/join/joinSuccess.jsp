<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://fonts.googleapis.com/earlyaccess/nanumpenscript.css">
<head>
<style type="text/css">
#pentext h1 {font-family: 'Nanum Pen Script', serif}
#pentext h3 {font-family: 'Nanum Pen Script', serif}
#pentext h4 {font-family: 'Nanum Pen Script', serif}
#pentext h5 {font-family: 'Nanum Pen Script', serif}
</style>
</head>
<body class="w3-white">
<div id="pentext" class="w3-center w3-border-dark-grey w3-display-middle w3-topbar w3-bottombar w3-leftbar w3-rightbar" style="min-width: 350px;">
	<br><br>
	<img src="/erp/resources/image/check.png" height="150">
	<h1>회원 가입 완료</h1>
	<h3><b>${member.name }</b>님,<br>
	승인처리가 끝나면<br>
	입력하신 메일주소로 사번이 전송됩니다.</h3>
	<h5>3초뒤 메인으로 돌아갑니다.<br></h5>
	<button class="w3-btn w3-border w3-text-dark-grey w3-border-dark-grey w3-round-large w3-small w3-white" onclick="location='/erp/home'"><h4>메인가기</h4></button>
	<br><br><br>
</div>
</body>
<meta http-equiv="Refresh" content="3; url=home">
</html>

