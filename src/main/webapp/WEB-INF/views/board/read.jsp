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
	/* location.href="/erp/board/deleteForm?num=${b.num}"; */
	location.href="/erp/board/delete?num=${b.num}";
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
<table width="800"> 
	<tr>
		<th>날짜</th>
		<td name="regDate" maxlength="50" size="65">
			${b.regDate}	
		</td>
	</tr>
	
	<tr>
		<th>이름</th>
		<td name="name" maxlength="50" size="65" >
			${b.name}	
		</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td name="title" maxlength="50" size="65">
			${b.title}
		</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td>		
			<textarea name="content" rows="5" cols="65" readonly="readonly">${b.content}</textarea>
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

<form action="/erp/board/comment" method="post">
	<input type="hidden" name="num" value="${b.num}">
	<table border="1">
		<tr>
			<td>이름 : </td>
			<td><input type="text" name="name"/></td>
			<td>댓글 : </td>
			<td><input type="text" name="comments"></td>
			<td><input type="submit" name="Button" value="쓰기"></td>
		</tr>
	</table>
</form>
	<!-- 달려있는 커맨트 보기 -->
		<table width="789" border="1">
			<c:forEach var="comments" items="${comments}">
				<tr>
					<td width="42" align="center">*</td>
					<td width="86">${comments.name}</td>
					<td width="639">${comments.comments}</td>
				</tr>
			</c:forEach>
		</table>
</body>
</html>