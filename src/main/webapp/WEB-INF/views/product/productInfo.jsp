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
		<div align="right">
			<table class="w3-table w3-centered " style="width: 20%;">
				<tr>
					<td><input type="button" value="정보수정"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/product/updateForm?procode=${proList.procode}'">
					</td>
			
					<td><input type="button" value="정보삭제"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/product/delete?procode=${proList.procode}'">
					</td>
				</tr>
			</table>
		</div>

	<div>
		<p></p>
	</div>
</body>
</html>