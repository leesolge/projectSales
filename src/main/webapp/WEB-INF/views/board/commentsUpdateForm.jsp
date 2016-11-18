<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="/erp/board/commentsUpate">
	<input type="hidden" name="num" value="${b.num}">
	<input type="hidden" name="seq" value="${comments.seq}">
	<table width="789" border="1">
			<c:forEach var="comments1" items="${comments1}">
				<tr>
					<td width="42" align="center">*</td>
					<td width="86">${comments1.name}</td>
					<td width="639"><input type="text" name="comments" value="${comments1.comments}"/></td>
					<td width="220" align="center">${comments1.regDate}</td>
				</tr>
			</c:forEach>
		</table>
</form>
</body>
</html>