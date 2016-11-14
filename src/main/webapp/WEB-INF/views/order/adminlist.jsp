<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<form action="/erp/admin/order" method="get">
			<input name="firstdate" type="date">&nbsp;
			<input name="seconddate" type="date">&nbsp;
			<select name="product" required="required">
						<c:forEach var="list" items="${plist}">
							<option value="${list.procode}">${list.procode}&nbsp;${list.proname}</option>
						</c:forEach>
					</select>
			&nbsp;
			<input type="submit" value="열람">
			
		</form>
		<c:forEach var="list" items="${alist}">
			${list.id}
		</c:forEach>
	</body>
</html>