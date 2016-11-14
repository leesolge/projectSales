<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
<script type="text/javascript">
	function registOrder(){
		var pc = document.forms['regist'].procode.value;
		var pa = document.forms['regist'].proamount.value;
		var cu = document.forms['regist'].customer.value;
		var ad = document.forms['regist'].address.value;
		if (confirm("입력하신 사항이 모두 확실합니까?\n제품번호 : "+pc+"\n주문수량 : "+pa+"\n고객명 : "+cu+"\n고객주소 : "+ad) == true){
			document.forms['regist'].submit();
		}else{
		    return;
		}
	}
</script>
	
	<body>
	<form name="regist" action="/erp/order/registOrder" method="post">
		<table>
			<tr>
				<td>
					<input type="hidden" name="id" value="0">
					등록자 사번<input type="hidden" name="empno" value="${empno}">
				</td>
				<td>${empno}
				</td>
			</tr>
			<tr>
				<td>
					수주상품
				</td>
				<td>
					<select name="procode" required="required">
						<c:forEach var="list" items="${plist}">
							<option value="${list.procode}">${list.procode}&nbsp;${list.proname}</option>
						</c:forEach>
					</select>
				</td>
			<tr>
				<td>
					주문수량
				</td>
				<td>
					<input type="number" name="proamount" required="required">
				</td>
			</tr>
			<tr>
				<td>
					고객명
				</td>
				<td>
					<input type="text" name="customer" required="required">
				</td>
			</tr>
			<tr>
				<td>
					고객주소
				</td>
				<td>
					<input type="text" name="address" required="required">
					<input type="hidden" name="checks" value="0">
					<input type="hidden" name="deleted" value="0">
				</td>
			</tr>
		</table>
	</form>
	<button onclick="javascript:registOrder()">등록</button>
	</body>
</html>