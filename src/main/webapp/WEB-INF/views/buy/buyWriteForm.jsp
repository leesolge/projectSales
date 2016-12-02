<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

<body><br>
<form action="/erp/buy/buyWrite" method="post">
	<input type="hidden" name="empno" value="${memberInfo.empno}">
	<div class="w3-row-padding">
		<div class="w3-half" style="min-height: 500px;">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
				<h3><i class="fa fa-inbox"></i>  상품정보</h3>
				<div class="w3-container" style="height: 40px;">
					물품명 : 
					<input class="w3-border w3-border-light-blue" type="text" placeholder="검색어" id="myInput" onkeyup="myFunction()">
				</div>
				<br>
				<div class=" w3-row" style="height: 450px; overflow: auto;">
					<table class="w3-table w3-small w3-hoverable w3-bordered"
						id="myTable">
						<tr class="w3-light-blue">
							<th>상품명</th>
							<th style="width: 50px;">재고</th>
							<th>원가</th>
						</tr>

						<c:forEach items="${list}" var="list">
							<tr
								onclick="location.href='/erp/product/productInfo?procode=${list.procode}'"
								style="cursor: pointer;">
								<td>${list.proname}</td>
								<td>${list.proamount}</td>
								<td>${list.originprice}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div class="w3-hide-large w3-hide-medium"><br></div>
		</div>
		<div class="w3-half" style="min-height: 500px;">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" >
				<h3><i class="fa fa-share-square-o"></i>  구매요청</h3>
				<div class="w3-container" style="height: 40px;">
					<input class="w3-btn w3-border w3-text-light-blue w3-border-light-blue w3-round-large w3-small w3-white" type="submit" value="요청" />
					<input class="w3-btn-floating w3-light-blue w3-border-light-blue w3-border w3-right" type="button" id="btn_AddO" value="+">
				</div>
				<br>
				<div class=" w3-row" style="height: 450px; overflow: auto;">
					<table class="order_list w3-table w3-small w3-hoverable w3-bordered">
						<tr class="w3-light-blue">
							<th style="width: 100px">상품명</th>
							<th style="width: 70px">수량</th>
							<th>사유</th>
							<th style="width: 40px"></th>
						</tr>
						<tr>
							<td>
								<select class="w3-select w3-border w3-round-large" name="Ocode_0" required="required">
									<option value="" selected disabled>상품명</option>
									<c:forEach var="alist" items="${list}">
										<option value="${alist.procode}">${alist.proname}</option>
									</c:forEach>
								</select>
							</td>
							<td><input class="w3-input w3-border w3-round-large" type="number" name="Oamount_0" required="required"></td>
							<td><input class="w3-input w3-border w3-round-large" type="text" name="Ocomment_0" required="required"></td>
							<td></td>
						</tr>
			
					</table>
				</div>
			</div>
		</div>
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
						$('<td id="O' + num_ref + '"><a id="btn_DelO'+num_ref+'" class="w3-hover-text-red"><i class="fa fa-trash-o w3-xlarge"></i></a></td>').appendTo('.O'+num_ref);
				
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