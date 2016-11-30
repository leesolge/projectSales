<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body><br>
<div class="w3-container">
<form action="/erp/product/update" method="post">
	<input type="hidden" value="${proList.procode}" name="procode">
	<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
		<h3><i class="fa fa-pencil-square-o"></i>  상품수정</h3>
		<div class="w3-row">
			<div class="w3-half">
				<img src="/erp/resources/proportraits/${proList.proimage}" width="100%">
			</div>
			<div class="w3-half">
				<table>
					<tr>
						<td>
							<input class="w3-input w3-xxlarge" type="text" value="${proList.proname}" name="proname">
						</td>
						<td>
							<div class="w3-border w3-border-indigo w3-small w3-center" style="width: 50px;">
								<span>${proList.procode}</span>
							</div>
						</td>
					</tr>
				</table>
				<br>
				<table>
					<tr>
						<td style="text-align: right; width: 70px;">
							<b>원가 : </b> 
						</td>
						<td style="text-align: left;">
							<input type="text" value="${proList.originprice}" name="originprice">
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							<b>판매가 : </b> 
						</td>
						<td style="text-align: left;">
							 <input type="text" value="${proList.sellprice}" name="sellprice">
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							<b>잔고 :  </b> 
						</td>
						<td style="text-align: left;">
							<input type="number" value="${proList.proamount}" name="proamount">
						</td>
					</tr>
					<tr>
						<td style="text-align: right; vertical-align: top;">
							<b>제품설명 :  </b> 
						</td>
						<td style="text-align: left;">
							<textarea class="w3-round-large" name="proexpla" style="width: 100%; height: 200px; resize: none;">${proList.proexpla}</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="w3-right">
				<input type="submit" name="confirm"
					class="w3-btn w3-round-large" value="수정">
				<input type="button" value="취소"
					class="w3-btn w3-round-large"
					onclick="window.location='/erp/product/list'">
			</div>
		</div>
	</div>
</form>
</div>
</body>
</html>