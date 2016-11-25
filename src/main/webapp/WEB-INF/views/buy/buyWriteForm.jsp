<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<body>
	<form action="/erp/buy/buyWrite" method="post">
		<input type="hidden" name="empno" value="${memberInfo.empno}">
	<div class="w3-container w3-center">
		<h2>Product 충원요청</h2>
	</div>
	
	<br>
	
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 50%">

			<div class="w3-col w3-left" style="width: 30%">
				<input class="w3-input w3-border w3-padding" type="text"
					placeholder="Search for Code.." id="myInput"
					onkeyup="myFunction()">
			</div>
			<table class="w3-table w3-centered" id="myTable">
				<tr>
					
					<th>상품명</th>
					<th>재고</th>				
					<th>원가</th>					
					<th>내용</th>
				</tr>

				<c:forEach items="${list}" var="list">
					<tr>						
						<td>${list.proname}</td>
						<td>${list.proamount}</td>
						<td>${list.originprice}</td>						
						<td><input type="button" value="Content"
							class="w3-btn w3-round-large"							
							onclick="window.location='/erp/product/productInfo?procode=${list.procode}'"> <!-- 멤버콘텐츠 보는 경로 -->
						</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
		</div>
				
		<div class="w3-rest w3-container w3-row-padding">	
			<div class=" w3-row">	
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
			
			<div class=" w3-row" style="height:300px; overflow:auto;">				
				<table class="order_list w3-table w3-centered">
					<tr>
						<th style="width: 15%">상품명	</th>
						<th style="width: 15%">주문수량</th>
						<th style="width: 60%">주문사유</th>					
						<th style="width: 10%">취소</th>
					</tr>
				</table>
			</div>
			<input class="w3-btn w3-round-large" type="submit" value="등록" />
	</div>
	</form>
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

<script>
	function myFunction() {
		var input, filter, table, tr, td, i;
		input = document.getElementById("myInput");
		filter = input.value.toUpperCase();
		table = document.getElementById("myTable");
		tr = table.getElementsByTagName("tr");
		for (i = 0; i < tr.length; i++) {
			td = tr[i].getElementsByTagName("td")[0];
			if (td) {
				if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
					tr[i].style.display = "";
				} else {
					tr[i].style.display = "none";
				}
			}
		}
	}
</script>
</html>