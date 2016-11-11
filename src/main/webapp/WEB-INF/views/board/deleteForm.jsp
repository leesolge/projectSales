<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글삭제</title>
<!-- <script type="text/javascript">
	function deletepro(){
		if(document.f.num.value==""){
			alert("글번호를 입력해주세요!");
			document.f.num.focus();
		}else{
			document.f.submit();
		}
	}

</script> -->
</head>
<body>
<h1>글 삭제</h1>
<a href="/erp/board/list">리스트</a>
<form name="f" action="delete" method="post">
<table width="400">
	<tr>
		<th>글번호</th>
		<td>
			<input type="hidden" name="pg" value="${param.pg}"/>
			<input type="hidden" name="num" value="${param.num}"/>
			<input type="text" name="num" size="12" maxlength="12"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" align="left">
			<!-- <input type="button" value="삭제" onclick="deletepro()"/> -->
			<input type="submit" value="삭제"/>
			<input type="reset" value="취소"/>
		</td>
	</tr>
</table>


</form>
</body>
</html>