<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE HTML>

<sec:authorize access="isAuthenticated()">
<div class="w3-container">
<table style="width: 100%; height: 100%;">
	<tr>
		<td width="50%" align="left">
		<a href="/erp/main">
			<img src="/erp/resources/image/logo2.png" height="80">
		</a>
		</td>
		<td width="50%" align="right" style="vertical-align: bottom;">
		<font size="1">
			<a href="/erp/main">HOME</a> | 
			<a href="#">CONTACT</a> | 
			<a href="#">SITEMAP</a>
		</font>
		</td>
	</tr>
</table>
</div>
</sec:authorize>