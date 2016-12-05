<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-colors-highway.css">
</head>
<body><br>
<div class="w3-container">
	<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
		<h3><i class="fa fa-inbox"></i>  상품 관리</h3>
		<div class="w3-container" style="height: 40px;">
			물품코드 : 
			<input class="w3-border-highway-green" type="text" placeholder="Search for Code.." id="myInput" onkeyup="myFunction()">
			<button class="w3-btn-floating w3-highway-green w3-border-highway-green w3-border w3-right" onclick="location='/erp/product/insert'">+</button>
		</div>
		<div class="w3-row"><br>
			<table class="w3-table w3-small w3-hoverable w3-bordered" id="myTable">
				<tr class="w3-highway-green">
				 	<th style="width: 100px;">코드</th>
					<th>품명</th>
					<th style="width: 80px;">개수</th>
					<th style="width: 100px;">판매가</th>
					<th style="width: 100px;">원가</th>
				</tr>
				<c:forEach items="${proList}" var="list">
				<tr onclick="window.location='/erp/product/productInfo?procode=${list.procode}'">
					<td>${list.procode}</td>
					<td>${list.proname}</td>
					<td>${list.proamount}</td>
					<td>${list.sellprice}</td>
					<td>${list.originprice}</td>
				</tr>
				</c:forEach>
			</table><br>
		</div>
	</div>
</div><br>
</body>
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