<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body class="w3-dark-grey">
	<div class="w3-row-padding w3-margin-bottom" style="margin-top: 10%">
		<div class="w3-half">
			<div class="w3-white w3-round-large w3-centered" style="min-height: 400px;">
				<div class="w3-container w3-light-grey">
					<h4 class="w3-text-dark-grey"><i class="fa fa-lock"></i>  아이디 찾기</h4>
				</div>
			<form method="post" action="ConfirmID_Member" enctype="multipart/form-data" class="w3-container w3-white">
				<br>
				<label class="w3-text-dark-grey"><b>이름</b></label>
				<input class="w3-input w3-border w3-border-dark-grey w3-round" name="name" type="text" placeholder="Name">
				<br>
				<label class="w3-text-dark-grey"><b>이메일</b></label>
				<input class="w3-input w3-border w3-border-dark-grey w3-round" name="email" type="text" placeholder="Email">
				<br>
				<div class="w3-row w3-center">
					<input type="submit" class="w3-btn w3-dark-grey" name="confirm" value="찾기">
					<input type="button" class="w3-btn w3-dark-grey" value="취소" onclick="window.location='/erp/home'">
				</div>
				<br>
			</form>
			</div>
			<div class="w3-hide-medium w3-hide-large"><br></div>
		</div>
		
		<div class="w3-half">
			<div class="w3-white w3-round-large w3-centered" style="min-height: 400px;">
				<div class="w3-container w3-light-grey">
					<h4 class="w3-text-dark-grey"><i class="fa fa-lock"></i>  비밀번호 찾기</h4>
				</div>
			<form method="post" action="ConfirmPWD_Member" enctype="multipart/form-data" class="w3-container w3-white">
				<br>
				<label class="w3-text-dark-grey"><b>사번</b></label>
				<input class="w3-input w3-border w3-border-dark-grey w3-round" name="empno" type="text" placeholder="Empno">
				<br>
				<label class="w3-text-dark-grey"><b>이름</b></label>
				<input class="w3-input w3-border w3-border-dark-grey w3-round" name="name" type="text" placeholder="Name">
				<br>
				<label class="w3-text-dark-grey"><b>이메일</b></label>
				<input class="w3-input w3-border w3-border-dark-grey w3-round" name="email" type="text" placeholder="Email">
				<br>
				<div class="w3-row w3-center">
					<input type="submit" class="w3-btn w3-dark-grey" name="confirm" value="찾기">
					<input type="button" class="w3-btn w3-dark-grey" value="취소" onclick="window.location='/erp/home'">
				</div>
				<br>
			</form>
			</div>
		</div>
	</div>
</body>
</html>