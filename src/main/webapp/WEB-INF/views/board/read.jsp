<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
function board_update(){
	//alert("수정");
	location.href="/erp/board/updateForm?num=${b.num}";
	
}
function board_delete(){
	//alert("삭제");
	location.href="/erp/board/deleteForm?num=${b.num}";
}
function board_reply(){
	//alert("답변");
	location.href="/erp/board/replyForm?num=${b.num}";
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 읽기</title>
</head>
<body>
<h1>글 읽기</h1>

<%-- <a href="/erp/board/list?pg=${pg}">리스트</a> --%>
<a href="/erp/board/list?">리스트</a>
<table width="500">

	<tr>
		<th colspan="4">
			${b.title}
		</th>
	</tr>
	
	<tr>
		<td width="20%"><!-- 이름 -->${b.name}</td>
		<td width="15%">${b.regDate}</td>
	</tr>
	
	<tr>
		<td colspan="4">
			<textarea rows="10" cols="60" readonly="readonly">${b.content}</textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="4" align="right">
			<input type="button" value="수정" onclick="board_update()"/>
			<input type="button" value="삭제" onclick="board_delete()"/>
			<!-- <input type="button" value="답변" onclick="board_reply()"/> -->
		</td>
	</tr>

</table>
</body>
</html>