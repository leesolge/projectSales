<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style type="text/css">
td {
	width: auto;
}
</style>

<!-- <script type="text/javascript">
	function check() {
		if (document.search.procode.value == '') {
			alert('검색어를 입력하세요');
			document.search.procode.focus();
			return false;
		}
	}
</script> -->
</head>
<body>
		<h2>PRODUCT INFO</h2>
		<br>
		<table width="400" border="1" align="center">
			<tr>
				<td>CODE</td>
				<td>NAME</td>
				<td>AMOUNT</td>
				<td>SELLPRICE</td>
				<td>ORIGINPRICE</td>
				<td>IMAGE</td>
				<td>EXPLA</td>
			</tr>
		</table>
		<hr>
		<table width="400" border="1" align="center">
			<c:forEach items="${proList}" var="list">
				<tr>
					<td>${list.procode}</td>
					<td>${list.proname}</td>
					<td>${list.proamount}</td>
					<td>${list.sellprice}</td>
					<td>${list.originprice}</td>
					<td>${list.proimage}</td>
					<td>${list.proexpla}</td>
				</tr>
			</c:forEach>
		</table>
		<hr>
	<form method="post" action="/erp/product/list">
		<table width="500" border="0" align="center">
			<tr>
				<td align="center" valign="bottom"><h4>제품코드</h4></td>
				<td align="center"><input type="text" size="30" name="procode"></td>
				<td><input type="submit" value="찾기"></td>
			</tr>
		</table>
	</form>
	<br><br><br><br>
	<div align="center">
		<button onclick="location='/erp/product/insert'">추가</button>
		<button onclick="location='/erp/product/delete'">삭제</button>
	</div>
</body>
</html>