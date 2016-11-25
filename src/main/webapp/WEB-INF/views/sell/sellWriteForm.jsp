<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<body>
	<div class="w3-container w3-center">
		<h2>Product 충원요청</h2>
	</div>
	
	<br>

	<form name="SellWrite" action="/erp/sell/sellWrite" method="post">
		<table>
			<tr>
				<td><input type="hidden" name="empno" value="${memberInfo.empno }"> 등록자 사번</td>
				<td>${memberInfo.empno }</td>
			</tr>
			<tr>
				<td>수주상품</td>
				<td>
					<select class="w3-select w3-border w3-round-large"  name="procode">
						<option value="" selected disabled>상품명</option>
						 <c:forEach 	var="list" items="${list}">
							<option value="${list.procode}">${list.proname}</option> 
						</c:forEach>
					</select>
				</td>
			</tr>

			</td>
			<tr>
				<td>수주수량</td>
				<td><input type="number" name="proamount" required="required">
				</td>
			</tr>
			<tr>
				<td>고객명</td>
				<td><input type="text" name="customer" required="required">
				</td>
			</tr>
			<tr>
				<td>고객주소</td>
				<td><input type="text" name="address" required="required"></td>
			</tr>
		</table>
		<input class="w3-btn w3-round-large" type="submit" value="등록" />
	</form>
</body>
</html>