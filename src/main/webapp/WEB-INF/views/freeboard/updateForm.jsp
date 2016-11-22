<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 수정</title>

<script type="text/javascript">
	function freeboard_update(){
		//alert("쓰기")
		if(document.writeForm.name.value==""){
			alert("이름을 입력해주세요");
		}else if(document.writeForm.title.value==""){
			alert("제목을 입력해주세요");
			document.writeForm.title.focus();
		}else if(document.writeForm.content.value==""){
			alert("내용을 입력해주세요");
			document.writeForm.content.focus();
		}else{
			document.writeForm.submit();//전송
		}
		
	}
</script>
</head>
<body>
<h1>글 수정</h1>
<form name="writeForm" action="update" method="post">
<table width="800">
	<tr>
		<th>이름</th>
		<td>
			${freeVO.name}	
			<%-- <input type="hidden" name="pg" value="${pg}"/> --%>
			<input type="hidden" name="num" value="${freeVO.num}"/>
			<input type="hidden" name="name" value="${freeVO.name}"/>
		</td>
	</tr>
	
	<tr>
		<th>제목</th>
		<td>
			<input type="text" name="title" maxlength="50" size="65" value="${freeVO.title}"/>
		</td>
	</tr>
	
	<tr>
		<th>내용</th>
		<td>
			<textarea name="content" rows="5" cols="65">${freeVO.content}</textarea>
		</td>
	</tr>
	
	<tr>
		<td colspan="2">
			<input type="button" value="수정" onclick="freeboard_update()"/>
			<input type="button" value="취소" onclick="location.href='/erp/freeboard/list';"/>
		</td>
	</tr>
</table>

</form>
</body>
</html>