<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.0/themes/base/jquery-ui.css" />

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
					
					<td><input type="text" name="start_date" id="start_date"></td>
					<td><input type="text" name="end_date" id="end_date"></td>
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
				<td>${member.view_date}</td>
				<td>${member.deleted}</td>
			</tr>
		</c:forEach>
	</table>
</body>
<script>
	$(function() {
		$("#start_date").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, // 월변경가능
					changeYear : true, // 년변경가능
					showMonthAfterYear : true
				// 년 뒤에 월표시
				});
		$("#end_date").datepicker(
				{
					dateFormat : 'yy-mm-dd',
					monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
							'7월', '8월', '9월', '10월', '11월', '12월' ],
					dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
					changeMonth : true, // 월변경가능
					changeYear : true, // 년변경가능
					showMonthAfterYear : true
				// 년 뒤에 월표시
				});
	});
</script>
</html>