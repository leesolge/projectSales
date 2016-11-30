<%@page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<div class="w3-container w3-top w3-large w3-padding w3-dark-grey" style="z-index:4">
	<a class="w3-hide-large w3-padding-0 w3-dark-grey" onclick="w3_open();" style="cursor:pointer;">
		<i class="fa fa-bars"></i>  Menu
	</a>
	<span class="w3-right w3-hide-large">
		<a href="/erp/main">
			<img src="/erp/resources/image/logowhite.png" height="27">
		</a>
	</span>
	<table class="w3-center w3-hide-small w3-hide-medium">
		<tr>
			<td onClick="location.href='/erp/main'" style="cursor:pointer;">
				<div style="width: 220px;">
					<img src="/erp/resources/image/logowhite.png" height="27">
				</div>
			</td>
			<td class="w3-small">　　${history }</td>
		</tr>
	</table>
	

</div>