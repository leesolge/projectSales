<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<div>
		<!-- TOP, MENU -->
		<div class="w3-row">
			<div class="w3-col m1"><p></p></div>
			<div class="w3-col m10 w3-center">
				<div>
					<tiles:insertAttribute name="top" />
				</div>
				<div>
					<tiles:insertAttribute name="header" />
				</div>
			</div>
			<div class="w3-col m1"><p></p></div>
		</div>

		<br>
		<!-- BODY -->
		<div class="w3-row">
			<div class="w3-col m1"><p></p></div>
			<div class="w3-col m2">
				<div>
					<tiles:insertAttribute name="side" />
				</div>
			</div>
			<div class="w3-col m8">
				<div>
					<tiles:insertAttribute name="body" />
				</div>
			</div>
			<div class="w3-col m1"><p></p></div>
		</div>
		

		<!-- Bottom -->
		<div class="w3-row">
			<div class="w3-col m12">
				<tiles:insertAttribute name="footer" />
			</div>
		</div>
	</div>
</body>

<!-- Script -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- CSS -->
<link href="http://www.w3schools.com/lib/w3.css" rel="stylesheet" >
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/erp/resources/css/fix.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/sizeControl.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/box.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/font.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/default.css" rel="stylesheet" type="text/css">
</html>