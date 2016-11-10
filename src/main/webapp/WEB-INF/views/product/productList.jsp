<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
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
			alert('�˻�� �Է��ϼ���');
			document.search.procode.focus();
			return false;
		}
	}
</script> -->
</head>
<body>
		<h2>PRODUCT INFO</h2>
		<br>
		<table>
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
		<table>
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
		<table>
			<tr>
				<td align="center" valign="bottom"><h4>��ǰ�ڵ�</h4></td>
				<td align="center"><input type="text" size="30" name="procode"></td>
				<td><input type="submit" value="ã��"></td>
			</tr>
		</table>
	</form>
	<br><br><br><br>
	<div align="center">
		<button onclick="location='/erp/product/insert'">�߰�</button>
		<button onclick="location='/erp/product/delete'">����</button>
	</div>
</body>
</html>