<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글쓰기</title>
<!-- <script type="text/javascript">
	function board_write(){
		//alert("쓰기");
		if(document.writeForm.name.value==""){
			alert("이름을 입력해주세요");
		}else if(document.writeForm.title.value==""){
			alert("제목을 입력해주세요");
			document.writeForm.title.focus();
		}else if(document.writeForm.content.value==""){
			alert("내용을 입력해주세요");
			document.writeForm.content.focus();
		}else{
			document.writeForm.submit(); //전송
		}
	}
</script> -->
</head>
<body>
<h1>글쓰기</h1>
<div class="w3-col w3-center">
<a href="/erp/board/list">리스트</a>
</div>
<form name="writeForm" action="write" method="post">
		<table width="800">
			<tr>
				<th>이름</th>
				<td>
					<input type="text" name="name" maxlength="5" size="12"/>
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