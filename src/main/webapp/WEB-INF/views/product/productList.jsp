<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
	<div class="w3-container w3-center">
		<h2>PRODUCT INFO</h2>
		<div class="w3-row ">
			<div class="w3-col w3-right" style="width: 20%">
				<button class="w3-btn w3-round-large"
					onclick="location='/erp/product/insert'">추가</button>
			</div>
			<div class="w3-col w3-left" style="width: 30%">
				<input class="w3-input w3-border w3-padding" type="text"
					placeholder="Search for Code.." id="myInput"
					onkeyup="myFunction()">
			</div>
			<table class="w3-table w3-centered" id="myTable">
				<tr>
					<th>CODE</th>
					<th>NAME</th>
					<th>AMOUNT</th>
					<th>SELLPRICE</th>
					<th>ORIGINPRICE</th>
					<th>EXPLA</th>
					<th>CONTENT</th>
				</tr>

				<c:forEach items="${proList}" var="list">
					<tr>
						<td>${list.procode}</td>
						<td>${list.proname}</td>
						<td>${list.proamount}</td>
						<td>${list.sellprice}</td>
						<td>${list.originprice}</td>
						<td>${list.proexpla}</td>
						<td><input type="button" value="Content"
							class="w3-btn w3-round-large"
							
							onclick="window.location='/erp/product/productInfo?procode=${list.procode}'"> <!-- 멤버콘텐츠 보는 경로 -->
						</td>
					</tr>
				</c:forEach>
			</table>
			<hr>
		</div>
		</div>
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