<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE HTML>
<html>
<head>
<style type="text/css">
	#bar {
	 	text-align:center;
	 }
	 
	.fix {
		position:fixed; 
		top:0;
		left:0;
		width: 100%;
	}
	
	.topMar{
		padding-top:50px;
	}
</style>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var topBar = $("#bar").offset();
		$(window).scroll(function(){
			var docScrollY = $(document).scrollTop()
			var barThis = $("#bar")
			var fixNext = $("#content")
			if( docScrollY > topBar.top ) {
				barThis.addClass("fix");
				fixNext.addClass("topMar");
			} else {
				barThis.removeClass("fix");
				fixNext.removeClass("topMar");
			}
		});
	})
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title><tiles:getAsString name="title" /></title>
</head>
<body>
	<div>
		<tiles:insertAttribute name="top" />
	</div>
	
	<div id="bar">
		<tiles:insertAttribute name="header" />
	</div>
	<table style="width: 100%">
		<tr>
			<td width="20%" style="vertical-align: top;">
				<div>
					<tiles:insertAttribute name="side" />
				</div>
			</td>
			<td width="80%">
				<div id="content">
					<tiles:insertAttribute name="body" />
				</div>
			</td>
		</tr>
	</table>


	<div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
<!-- Script -->
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="/erp/resources/js/fix.js"></script>

<!-- CSS -->
<link href="http://www.w3schools.com/lib/w3.css" rel="stylesheet" >
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link href="/erp/resources/css/fix.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/sizeControl.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/box.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/font.css" rel="stylesheet" type="text/css">
<link href="/erp/resources/css/default.css" rel="stylesheet" type="text/css">x`
</html>