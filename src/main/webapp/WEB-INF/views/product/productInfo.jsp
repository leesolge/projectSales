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
			<div class="w3-row">
				<h3><i class="fa fa-info"></i>  상품세부정보</h3>
			</div>
			<div class="w3-row">
				<div class="w3-half w3-center">
					<img src="/erp/resources/proportraits/${proList.proimage}" class="w3-image w3-topbar w3-bottombar w3-leftbar w3-rightbar w3-border-indigo" 
					style="width: 10cm; height: 9cm;">
				</div>
				<table>
					<tr>
						<td>
							<b class="w3-xxlarge">${proList.proname}</b>
						</td>
						<td>
							<div class="w3-border w3-border-indigo w3-small w3-center w3-text-indigo" style="width: 50px;">
								 <span>${proList.procode}</span>
							</div>
						</td>
					</tr>
				</table><br>
				<div class="w3-half w3-padding">
					<label class="w3-text-indigo"><b>재고</b></label>
						<input type="text" class="w3-input" value=" ${proList.proamount}" readonly><br>
					<label class="w3-text-indigo"><b>원가</b></label>
						<input type="text" class="w3-input" value="${proList.originprice}" readonly><br>
					<label class="w3-text-indigo"><b>판매가</b></label>
						<input type="text" class="w3-input" value="${proList.sellprice}" readonly><br>
					<label class="w3-text-indigo"><b>상품설명</b></label>
						<textarea class="w3-input" style="width: 100%; resize: none;" readonly>${proList.proexpla}</textarea>
				</div>
				<div class="w3-right">
				<input type="button" value="수정"
				class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white"
				onclick="window.location='/erp/product/updateForm?procode=${proList.procode}'">
				<input type="button" value="삭제"
				class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white"
				onclick="window.location='/erp/product/delete?procode=${proList.procode}'">
				<input type="button" value="목록"
				class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white"
				onclick="window.location='/erp/product/list'">
			</div>
			</div>
		</div>
	</div><br>
</body>
</html>