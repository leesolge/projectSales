<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE HTML>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<sec:authorize access="isAuthenticated()">
<div class="w3-container w3-center">@copywrite kosta125</div>
</sec:authorize>