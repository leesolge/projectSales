<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>
	<div class="w3-row ">
		<div class="w3-col w3-left" style="width:30%"><p></p></div>
		<div class="w3-col w3-right" style="width:30%"><p></p></div>
		<div class="w3-rest w3-container" align="center">
			<form method="post" action="ConfirmPWD_Member" enctype="multipart/form-data">
				<h4>Confirm PWD</h4>
				<table class="w3-table w3-bordered w3-border w3-centered">
					<tr>
						<td><input type="text" name="empno" placeholder="ID"></td>
					</tr>				
					<tr>
						<td><input type="text" name="name" placeholder="Name"></td>
					</tr>				
					<tr>
						<td><input type="email" name="email" placeholder="E-mail"></td>
					</tr>	
				</table>
				<input type="submit" name="confirm" value="확인">
				<input type="reset" name="reset" value="다시쓰기">
				<input type="button" value="취소" onclick="window.location='/erp/home'">
			</form>
		</div>
	</div>
</body>
</html>