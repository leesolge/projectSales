<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<body>
	<!-- <form action="/erp/employee/requestRefill" method="post"> -->
	<form action="/erp/employee/buy_request_manager" method="post">
		<input type="hidden" name="empno" value="${memberInfo.empno}">
	
	<div class="w3-container w3-center">
		<h2>자재충원요청</h2>
	</div>
	
	<br>
	
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 10%"><p></p></div>
		<div class="w3-col w3-right" style="width: 10%"><p></p></div>
		<div class="w3-rest w3-container w3-row-padding">	
			<div class="w3-third">
				<label class="w3-wide">Name</label> <input
					class="w3-input w3-border w3-round-large"
					style="width: 60%; border-radius: 6px;" readonly
					value="${memberInfo.name}">
			</div>
			<div class="w3-third">
				<label class="w3-wide">Team</label> <input
					class="w3-input w3-border w3-round-large"
					style="width: 60%; border-radius: 6px;" readonly
					value="${memberInfo.team}">
			</div>

			<div class="w3-third">
				<label class="w3-wide"><p></p></label> <input
					class="w3-btn w3-input page_button w3-round-large w3-right"
					style="width: 40%;" type="button" id="btn_AddO"
					value="물품추가">
			</div>
		</div>
	</div>

	<br>
	
	<div class="w3-row"> 
		<div class="w3-col w3-left" style="width: 10%"><p></p></div>
		<div class="w3-col w3-right" style="width: 10%"><p></p></div>
		<div class="w3-rest w3-container w3-center">
			<table class="order_list w3-table w3-centered">
				<tr>
					<th style="width: 15%">요청상품</th>
					<th style="width: 15%">주문수량</th>
					<th style="width: 60%">주문사유</th>					
					<th style="width: 10%">취소</th>
				</tr>
			</table>
			<input type="submit" value="등록" class="w3-btn w3-round-large">	
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
						$('<tr class="O' + num_ref + '"><td id="O' + num_ref + '"><select class="w3-select w3-border w3-round-large" name="Ocode_'+num_ref+'" required="required">'+
								'<option value="" selected disabled>상품명</option>'+
								'<c:forEach var="list" items="${list}">'+
								'<option value="${list.procode}">${list.proname}</option>'+ 
								'</c:forEach></select></td></tr>'
						).appendTo('.order_list');
						
						$('<td id="O' + num_ref + '"><input class="w3-input w3-border w3-round-large" type="number" name="Oamount_'+num_ref+'" required="required"></td>').appendTo('.O'+num_ref);
						$('<td id="O' + num_ref + '"><input class="w3-input w3-border w3-round-large" type="text" name="Ocomment_' +num+ '" required="required"></td>').appendTo('.O'+num_ref);
						$('<td id="O' + num_ref + '"><input class="w3-btn page_button w3-round-large"  type="button" id="btn_DelO'+num_ref+'" value="물품삭제"></td>').appendTo('.O'+num_ref);
						
						$('#btn_DelO'+num_ref).click(function() {
							$('.O'+num_ref).remove();
							$('#O'+num_ref).remove();
							});
						
						num++;
						});				
			});
</script>
</html>