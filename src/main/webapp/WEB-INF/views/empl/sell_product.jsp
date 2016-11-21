<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<body>
	<form name="list" action="/erp/order/list" method="post">
	</form>
	
	<form name="regist" action="/erp/order/regist" method="post">
		<table>
			<tr>
				<td>
					<input type="hidden" name="id" value="0">
					등록자 사번
				</td>
				<td>
					<select name="empno" required="required">
						<c:forEach var="mlist" items="${mlist}">
							<option value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					출고 예정일
				</td>
				<td>
					<input type="number" name="releasedate" required="required">
				</td>
			</tr>
			<tr>
				<td>
					만기일
				</td>
				<td>
					<input type="number" name="expiredate" required="required">
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
					수주수량
				</td>
				<td>
					<input type="number" name="proamount" required="required">
				</td>
			</tr>
			<tr>
				<td>
					수주단가
				</td>
				<td>
					<input type="number" name="originprice" required="required">
				</td>`
			</tr>
			<tr>
				<td>
					공급금액
				</td>
				<td>
					<input type="number" name="sellprice" required="required">
				</td>
			</tr>
				<tr>
				<td>
					품목합계
				</td>
				<td>
					<input type="number" name="totalprice" required="required">
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
				<tr>
				<td>
					고객전화번호
				</td>
				<td>
					<input type="text" name="tel" required="required">
				</td>
			</tr>
		</table>
	</form>
	<button onclick="javascript:registOrder()">등록</button><br>
	<button onclick="javascript:toList()">목록</button>
	</body>
</html>