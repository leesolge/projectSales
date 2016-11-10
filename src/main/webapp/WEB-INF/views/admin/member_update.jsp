<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>

	<div class="w3-container w3-center">
		<h1>사원 정보 수정</h1>
		<hr>

		<form method="post" action="Admin_Update_Member"">
			<table class="w3-table w3-centered" style="border: 1px solid #ddd">
				<tr>
					<td rowspan="6"><img
						src="/erp/resources/portraits/${vo.portrait}" width="100%"></td>
					<th>EMPNO</th>
					<td><input type="hidden" name="empno" value="${vo.empno}">${vo.empno}</td>
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
					<td><select name="auth">
							<option class="w3-text-red" value="${vo.auth}"  selected>${vo.auth}</option>
							<option value="ROLE_ADMIN">ROLE_ADMIN</option>
							<option value="ROLE_MANAGER">ROLE_MANAGER</option>
							<option value="ROLE_EMPLOYEE">ROLE_EMPLOYEE</option>
							<option value="ROLE_EE">ROLE_EE</option>
					</select></td>
				</tr>
  
				<tr>
					<th>ACCOUNT</th>
					<td>${vo.account}</td>
					<th>TEAM</th>
					<td><select  name="team">
							<option class="w3-text-red"  value="${vo.team}" selected>${vo.team}</option>
							<option value="영업1팀">영업1팀</option>
							<option value="영업2팀">영업2팀</option>
							<option value="자재팀">자재팀</option>
					</select></td>


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
						<td><input type="submit" name="confirm"
							class="w3-btn w3-round-large" value="정보수정완료"></td>
						<td><input type="button" value="취소"
							class="w3-btn w3-round-large"
							onclick="window.location='/erp/admin/member_info?empno=${vo.empno}'">
						</td>
					</tr>
				</table>
			</div>
		</form>

	</div>


	<div>
		<p></p>
	</div>
</body>
</html>