<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
		<div class="w3-container w3-center">
		<form action="/erp/transact/transactlist" method="post">
			<h2>거래내역</h2>
			<table class="w3-table w3-centered">
				<tr>
					<th>구매/판매</th>
					<th>팀</th>
					<th>물품코드</th>
					<th colspan="2">검색기간(시작/종료)</th>
				</tr>
				<tr>
					<td><select class="w3-select" name="category">
							<option value="" disabled selected>Choose your option</option>
							<option value="구매">구매</option>
							<option value="판매">판매</option>
							<option value="취소">취소</option>
					</select></td>

					<td><select class="w3-select" name="team">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${team_list}" var="team_list">
								<option value="${team_list}">${team_list}</option>
							</c:forEach>
					</select></td>

					<td><select class="w3-select" name="procode">
							<option value="" disabled selected>Choose your option</option>
							<c:forEach items="${procode_list}" var="procode_list">
								<option value="${procode_list}">${procode_list}</option>
							</c:forEach>
					</select></td>
					
					<td><input type="date" name="start_date"></td>
					<td><input type="date" name="end_date"></td>
					<td rowspan="2"><input type="submit" class="w3-btn" value="조회"></td>
				</tr>
			</table>
		</form>
	</div>

	<!-- List -->
	<table class="w3-table w3-centered">

		<tr>
			<th>EMPNO</th>
			<th>TITLE</th>
			<th>CATEGORY</th>
			<th>PRICE</th>
			<th>ASSETS</th>
			<th>TRANSDATE</th>
			<th>DELETED</th>
		</tr>
		<c:forEach items="${list}" var="member">
			<tr>
				<td>${member.empno}</td>
				<td>${member.title}</td>
				<td>${member.category}</td>
				<td>${member.price}</td>
				<td>${member.assets}</td>
				<td>${member.transdate}</td>
				<td>${member.deleted}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>