<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
</head>

<body>
<h1>글쓰기</h1>
<div class="w3-col w3-center">
<a href="/erp/board/list">리스트</a>
</div>
<form name="write" action="write" method="post">
		<table>
			<tr>
				<th>이름</th>
				<td>${senderVo.name}</td>
				<td>
				<input type="hidden" name="name" value="${senderVo.name}">
				</td>
			</tr>
			
			<tr>
				<th>제목</th>
				<td>
					<input type="text" name="title" maxlength="50" size="72"/>
				</td>
			</tr>
			
			<tr>
				<th>내용</th>
				<td>
					<textarea name="content" rows="10" cols="72"></textarea>
				</td>	
			</tr>
			
			<tr>
				<td colspan="2">
					<input type="submit" value="쓰기"/>
					<input type="reset" value="취소"/>
				</td>
			</tr>
		</table>
</form>
</body>
</html>