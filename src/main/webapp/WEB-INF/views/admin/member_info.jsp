<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>


<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>

	<div class="w3-container w3-center">
		<h1>사원 정보</h1>
		<hr>

		<table class="w3-table w3-centered" style="border: 1px solid #ddd">
			<tr>
				<td rowspan="6">
				<img src="/erp/resources/portraits/${vo.portrait}" width="100%"></td>
				<th> EMPNO</th>
				<td>${vo.empno}</td>
				<th>NAME</th>
				<td>${vo.name}</td>
			</tr>


			<tr>
				<th>PASSWORD</th>
				<td>${vo.pwd}</td>
				<th>GENDER</th>
				<td>${vo.gender}</td>
			</tr>

			<tr>
				<th>ADDRESS</th>
				<td>${vo.address}</td>
				<th>PHONE</th>
				<td>${vo.phone}</td>
			</tr>

			<tr>
				<th>EMAIL</th>
				<td>${vo.email}</td>
				<th>AUTH</th>
				<td>${vo.auth}</td>
			</tr>

			<tr>
				<th>ACCOUNT</th>
				<td>${vo.account}</td>
				<th>TEAM</th>
				<td>${vo.team}</td>
			</tr>

			<tr>
				<th>BIRTH</th>
				<td>${vo.birth}</td>
				<th>JOINDATE</th>
				<td>${vo.join}</td>
			</tr>
		</table>
		<div>
			<p></p>
		</div>

		<div align="center">
			<table class="w3-table w3-centered " style="width: 20%;">
				<tr>
					<td><input type="button" value="정보수정"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/admin/member_update?empno=${vo.empno}'">
					</td>
					<td><input type="button" value="퇴사"
						class="w3-btn w3-round-large"
						onclick="window.location='/erp/admin/Cancel?empno=${vo.empno}'">
					</td>
				</tr>
			</table>
		</div>

	</div>


	<div>
		<p></p>
	</div>
</body>
</html>