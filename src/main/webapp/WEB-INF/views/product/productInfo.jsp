<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body><br>
<div class="w3-container">
	<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
		<h3><i class="fa fa-info"></i>  상품세부정보</h3>
		<div class="w3-row">
			<div class="w3-half">
				<img src="/erp/resources/proportraits/${proList.proimage}" width="100%">
			</div>
			<div class="w3-half">
				<table>
					<tr>
						<td>
							<b class="w3-xxlarge">${proList.proname}</b>&nbsp;&nbsp;
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
							${proList.originprice}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							<b>판매가 : </b> 
						</td>
						<td style="text-align: left;">
							 ${proList.sellprice}
						</td>
					</tr>
					<tr>
						<td style="text-align: right;">
							<b>잔고 :  </b> 
						</td>
						<td style="text-align: left;">
							 ${proList.proamount}
						</td>
					</tr>
					<tr>
						<td style="text-align: right; vertical-align: top;">
							<b>제품설명 :  </b> 
						</td>
						<td style="text-align: left;">
							<textarea class="w3-round-large" style="width: 100%; height: 200px; resize: none;" readonly>${proList.proexpla}</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div class="w3-right">
				<input type="button" value="정보수정"
				class="w3-btn w3-round-large"
				onclick="window.location='/erp/product/updateForm?procode=${proList.procode}'">
				<input type="button" value="정보삭제"
				class="w3-btn w3-round-large"
				onclick="window.location='/erp/product/delete?procode=${proList.procode}'">
			</div>
		</div>
	</div>
</div>
</body>
</html>