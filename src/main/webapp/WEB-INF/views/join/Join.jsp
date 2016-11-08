<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	<div class="w3-row ">
		<div class="w3-col w3-left" style="width:30%"><p></p></div>
		<div class="w3-col w3-right" style="width:30%"><p></p></div>
		<div class="w3-rest w3-container" align="center">
			<form method="post" action="JoinSMember">
				<h4>Join</h4>
				<table class="w3-table w3-bordered w3-border w3-centered">
					<tr>
						<td><input type="text" name="name" placeholder="Name"></td>
					</tr>					
					<tr>
						<td><input type="password" name="pwd" placeholder="Pwd"></td>
					</tr>
					<tr>
						<td>
						<input type="radio" name="gender" value="남">남자
						<input type="radio" name="gender" value="여">여자
						</td>
					</tr>
					<tr>
						<td>
						<select name="year">
							<c:forEach var="year" begin="1950" end="2000">
								<option value="${year }">${year}</option>
							</c:forEach>
						</select>
						<select name="month">
							<c:forEach var="month" begin="1" end="12">
								<option value="${month}">${month}</option>
							</c:forEach>
						</select>
						<select name="day">
							<c:forEach var="day" begin="1" end="31">
								<option value="${day}">${day}</option>
							</c:forEach>
						</select>
						</td>
					</tr>
					<tr>
						<td><input type="text" name="address" placeholder="Address"></td>
					</tr>
					<tr>
						<td><input type="text" name="phone" placeholder="Phone"></td>
					</tr>
					<tr>
						<td><input type="email" name="email" placeholder="E-mail"></td>
					</tr>
					<tr>
						<td><input type="text" name="account" placeholder="Account"></td>
					</tr>
					<tr>
						<td>
						<select name="team">
							<option value="영업1팀">영업1팀</option>
							<option value="영업2팀">영업2팀</option>
							<option value="자재팀">자재팀</option>
						</select>
						</td>
					</tr>
				</table>
				<input type="submit" name="confirm" value="회원가입">
				<input type="reset" name="reset" value="다시쓰기">
				<input type="button" value="취소" onclick="redirect:home"> 
			</form>
		</div>
	</div>
</body>
</html>