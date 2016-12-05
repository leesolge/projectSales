<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<title>Title</title>
</head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3-colors-food.css">

<body><br>
	<div class="w3-container">
		<div class="w3-row">
			<div class="w3-container w3-food-plum">
				<h4 class="w3-text-white"><i class="fa fa-pencil-square-o"></i>  판매 등록</h4>
			</div>
			<div class="w3-container w3-white w3-card-4">
			<form method="post" action="/erp/ledger/regist">
				<br>
				<input type="hidden" name="empno" value="${empno}">
				<input type="hidden" name="enable" value="1">
				<table class="w3-table">
					<tr>
						<td>
							<label class="w3-text-indigo"><b>구분</b></label>
							<select name="sort" class="w3-input w3-border w3-border-indigo w3-round" required>
								<option value="수입">수입</option>
								<option value="지출">지출</option>
							</select>
						</td>
						<td>
							<label class="w3-text-indigo"><b>금액</b></label>
							<input type="number" name="amount" required class="w3-input w3-border w3-border-indigo w3-round">
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label class="w3-text-indigo"><b>내용</b></label>
							<input type="text" name="content" class="w3-input w3-border w3-border-indigo w3-round" required>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<label class="w3-text-indigo"><b>비고</b></label>
							<input type="text" name="etc" class="w3-input w3-border w3-border-indigo w3-round">
						</td>
					</tr>
				</table><br>
				<div class="w3-center">
					<input class="w3-btn w3-food-plum w3-text-white" type="submit" value="등록">
					<input class="w3-btn w3-food-plum w3-text-white" type="reset" value="취소">
					<button class="w3-btn w3-food-plum w3-text-white" onclick="location.href='/erp/ledger/list'">목록</button>
				</div>
			</form>
			<br>
			</div>
		</div>
	</div>
		
	</body>
</html>