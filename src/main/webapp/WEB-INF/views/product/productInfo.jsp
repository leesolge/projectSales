<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
		<div class="w3-container w3-center">
		<h1>상품 세부 정보</h1>
		<hr>
        
		<table class="w3-table w3-centered" style="border: 1px solid #ddd">
			<tr>
				<td rowspan="6">
 				<img src="/erp/resources/proportraits/${proList.proimage}" width="100%"></td>

 				
 				<th>PROCODE</th>
				<td>${proList.procode}</td>
				<th>PRONAME</th>
				<td>${proList.proname}</td>
			</tr>


			<tr>
				<th>ORIGIN PRICE</th>
				<td>${proList.originprice}</td>
				<th>SELL PRICE</th>
				<td>${proList.sellprice}</td>
			</tr>

			<tr>
				<th>PROAMOUNT</th>
				<td>${proList.proamount}</td>
				<th>PROEXPLA</th>
				<td>${proList.proexpla}</td>
			</tr>

		</table>
		<div>
			<p></p>
		</div>

	</div>


	<div>
		<p></p>
	</div>
</body>
</html>