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
	<div class="temp">
		<div id="bar">
			<tiles:insertAttribute name="header" />
		</div>
	</div>
	<table>
		<tr>
			<td>
				
			</td>
			<td>
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
</html>