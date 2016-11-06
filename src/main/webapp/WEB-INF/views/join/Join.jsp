<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body>

	<div class="w3-row ">
		<div class="w3-col w3-left" style="width: 25%">
			<p></p>
		</div>
		<div class="w3-col w3-right" style="width: 25%">
			<p></p>
		</div>
		<div class="w3-rest w3-container w3-light-grey w3-round-large"
			align="center">
			<form method="post" action="JoinSMember">
				<h4>Join</h4>
				<table class="w3-table w3-striped w3-bordered w3-border w3-centered">
					<tr>
						<td>Name</td>
						<td><input type="text" name="name" placeholder="Enter your Name">

						</td>
					</tr>

					<tr>
						<td>Password</td>
						<td><input type="password" name="pwd"
							placeholder="Enter your PW"></td>
						<td></td>
					</tr>

					<tr>
						<td>Phone</td>
						<td><input type="text" name="phone"
							placeholder="Enter your PhoneNumber"></td>
						<td></td>
					</tr>
				</table>

				<input type="submit" name="confirm" value="Join"> <input
					type="reset" name="reset" value="Reset"> <input
					type="button" value="Main"
					onclick="redirect:home"><br>
			</form>
		</div>
	</div>
</body>
</html>