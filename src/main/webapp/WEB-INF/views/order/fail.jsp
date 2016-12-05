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
</style>
</head>
<body class="w3-white">
<div id="pentext" class="w3-center w3-border-dark-grey w3-display-middle w3-topbar w3-bottombar w3-leftbar w3-rightbar" style="min-width: 300px;">
	<br>
	<img src="/erp/resources/image/warning.png" height="150">
	<h1>승인 실패</h1>
	<h3>상품의 재고가 부족합니다.</h3><br>
	<button class="w3-btn w3-border w3-text-dark-grey w3-border-dark-grey w3-round-large w3-small w3-white" onclick="location='/erp/order/list'"><h4>메인가기</h4></button>
	<br><br><br>
</div>
	<div class="w3-row ">
		<div class="w3-col w3-left" style="width: 30%">
			<p></p>
		</div>
		<div class="w3-col w3-right" style="width: 30%">
			<p></p>
		</div>
	</div>
</body>
</html>