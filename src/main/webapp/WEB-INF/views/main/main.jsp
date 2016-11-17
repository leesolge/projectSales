<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<html>
<style type="text/css">
	.shortLine {
		margin-top: 2px;
		border: solid 1px #D3D3D3;
		width: 70%;
	}
</style>
<body>
<div class="w3-container">
	<div class="w3-row borderBox" style="height: 200px;">사내 정보, 배너가 들어갈 공간</div>
	<br><hr>
	<div class="w3-row">
		<div class="w3-col m6">
			<div align="left">
				<h5>
					<i class="fa fa-bullhorn" aria-hidden="true"></i> 공지사항<br>
				</h5>
			</div>
			<table class="w3-table w3-bordered w3-small" style="width: 90%;">
				<tr>
					<th style="width: 80%;">제목</th>
					<th style="width: 20%;">날짜</th>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='#'">
					<td style="width: 80%;">제목</td>
					<td style="width: 20%;">날짜</td>
				</tr>
			</table>
		</div>
		<div class="w3-col m6">
			<div align="left">
				<h5>
					<i class="fa fa-envelope-o" aria-hidden="true"></i> 새로온 쪽지<br>
				</h5>
			</div>
			<table class="w3-table w3-bordered w3-small" style="width: 90%;">
				<tr>
					<th style="width: 80%;">제목</th>
					<th style="width: 20%;">날짜</th>
				</tr>
				<tr style="cursor:pointer;" onclick="location.href='#'">
					<td style="width: 80%;">제목</td>
					<td style="width: 20%;">날짜</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>