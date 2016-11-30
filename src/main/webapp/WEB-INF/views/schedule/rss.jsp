<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
   <table border="1">
	<c:forEach items="${list}" var="list">
	  <td align="center">
		${list.temp}℃
		<br><br><br>
		${list.wfEn}
		<br><br>
		${list.hour1}
		<br><br>
		<img src="/erp/resources/weather/${list.wfEn}.PNG" width="25px" height="25px">	
	  </td>
	</c:forEach>
   </table>
</body>
</html>