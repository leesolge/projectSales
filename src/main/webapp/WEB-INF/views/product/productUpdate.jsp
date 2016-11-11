<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	<form action="/erp/product/update" method="post">
		<input type="hidden" value="${proList.procode}" name="procode">
		<div class="w3-container w3-center">
			<h1>상품 세부 정보</h1>
			<hr>
			<table class="w3-table w3-centered" style="border: 1px solid #ddd">
				<tr>
					<td rowspan="6"><img
						src="/erp/resources/proportraits/${proList.proimage}" width="100%"></td>

					<th>PROCODE</th>
					<td>${proList.procode}</td>
					<th>PRONAME</th>
					<td><input type="text" value="${proList.proname}" name="proname"></td>
				</tr>

				<tr>
					<th>ORIGIN PRICE</th>
					<td><input type="text" value="${proList.originprice}" name="originprice"></td>
					<th>SELL PRICE</th>
					<td><input type="text" value="${proList.sellprice}" name="sellprice"></td>
				</tr>

				<tr>
					<th>PROAMOUNT</th>
					<td><input type="text" value="${proList.proamount}" name="proamount"></td>
					<th>PROEXPLA</th>
					<td><input type="text" value="${proList.proexpla}" name="proexpla"></td>
				</tr>
			</table>

			<div>
				<p></p>
			</div>
		</div>
		<div align="center">
			<table class="w3-table w3-centered " style="width: 20%;">
				<tr>
					<td><input type="submit" name="confirm"
						class="w3-btn w3-round-large" value="정보수정완료"></td>
					<td><input type="button" value="취소"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/admin/product/productInfo?procode=${proList.procode}'">
					</td>
				</tr>
			</table>

		</div>

		<div>
			<p></p>
		</div>
	</form>
</body>
</html>