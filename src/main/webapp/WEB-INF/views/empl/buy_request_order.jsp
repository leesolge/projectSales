<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<body>
	<div class="w3-container w3-center">
		<form action="/erp/employee/buy_request_manager" method="post">
			<h2>자재충원요청</h2>
			<table class="w3-table w3-centered">
				<tr>
					<th>등록자 사번</th>
					<td><input type="hidden" name="empno" value="${memberInfo.empno}"> ${memberInfo.empno}</td>
					<th>등록자 부서</th>
					<td>${memberInfo.team}</td>
				</tr>
			</table>
			
			
			<input class="w3-btn page_button"  type="button" id="btn_AddO" value="물품추가" >
			<table class="order_list w3-table w3-centered">
				<tr>
					<th>요청상품</th>
					<th>주문수량</th>
					<th>주문사유</th>					
					<th>취소</th>
				</tr>
			</table>
			<input class="w3-btn page_button"  type="submit" value="등록" >
		</form>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(
			function() {
				var num = 1;
				$('#btn_AddO')	.click(
						function() {
							var num_ref = num;
							$('<tr class="O' + num_ref + '"><td id="O' + num_ref + '"><select name="Ocode_'+num_ref+'" required="required">'+
									'<option value="" selected disabled>상품명</option>'+
									'<c:forEach var="list" items="${list}">'+
									'<option value="${list.procode}">${list.proname}</option>'+ 
									'</c:forEach></select></td></tr>'
							).appendTo('.order_list');
							
							$('<td id="O' + num_ref + '"><input type="number" name="Oamount_'+num_ref+'" required="required"></td>').appendTo('.O'+num_ref);
							$('<td id="O' + num_ref + '"><input type="text" name="Ocomment_' +num+ '" required="required"></td>').appendTo('.O'+num_ref);
							$('<td id="O' + num_ref + '"><input class="w3-btn page_button"  type="button" id="btn_DelO'+num_ref+'" value="물품삭제"></td>').appendTo('.O'+num_ref);
							
							$('#btn_DelO'+num_ref).click(function() {
								$('.O'+num_ref).remove();
								$('#O'+num_ref).remove();
								});
							
							num++;
							});				
				});
</script>
</html>