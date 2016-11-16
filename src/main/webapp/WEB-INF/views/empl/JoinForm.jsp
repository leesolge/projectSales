<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>

<html>
<title>Join Form</title>
<!-- Bootstrap theme -->
<link href="./css/css/bootstrap.min.css" rel="stylesheet">
<link href="./css/css/bootstrap-theme.min.css" rel="stylesheet">
<link href="./css/css/boot1.css" rel="stylesheet" type="text/css">
<link href="./css/css.css" rel="stylesheet" type="text/css">

<body>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width:25%"><p></p></div>
		<div class="w3-col w3-right" style="width:25%"><p></p></div>
		
		<div class="w3-rest w3-container w3-light-grey w3-round-large" style="margin-bottom:10px; margin-top:20px;">
			<form action="JoinPro.do" method="post" name="JoinForm" onSubmit="return checkIt()">
				<div align=center style="margin-bottom:20px;">
					<h3 style="border-bottom:2px solid white;">J o i n</h3>
				</div>
				
				<!-- 이용약관 동의 -->
				<div class="w3-row w3-wide" align=center style="margin-bottom:20px;">
					<input type="checkbox" name="terms" required> 귀하는 해당사이트의 이용약관에 동의합니다.
				</div>

				<!-- ID 입력 -->
				<label class="w3-wide">I D</label>
				<div class="w3-row" style="margin-bottom:10px;">
					<input class="w3-input w3-left " style="width:25%; border-radius: 6px; margin-right:30px;" type="text" name="id"  placeholder="Enter your ID" required>
				
					<input class="w3-btn w3-grey center" type="button" name="confirm_id" value="ID 중복확인" onclick="openConfirmid(this.form)">
				</div>
				
				<!-- 이름 입력 -->
				<label class="w3-wide">Name</label>
				<div class="w3-row" style="margin-bottom:10px;">
					<input class="w3-input w3-left " style="width:25%; border-radius: 6px; margin-right:30px;" type="text" name="name"  placeholder="Enter your Name" required>
				</div>

				<!-- Password 입력 / Password Check -->
				<label class="w3-wide">Password</label>
				<div class="w3-row" style="margin-bottom:10px;">
					<input class="w3-input w3-left " style="width:25%; border-radius: 6px; margin-right:30px;" type="text" name="password" placeholder="Enter your PW" required>
				</div>

				<label class="w3-wide">Password Check</label>
				<div class="w3-row" style="margin-bottom:10px;">
					<input class="w3-input w3-left " style="width:25%; border-radius: 6px; margin-right:30px;" type="text" name="password2"  placeholder="Check your PW" required>
				</div>

				<!-- 전화번호 입력 -->
				<label class="w3-wide">Phone</label>
				<div class="w3-row" style="margin-bottom:10px;">
					<input class="w3-input w3-left " style="width:50%; border-radius: 6px; margin-right:30px;" type="text" name="phone"  placeholder="Enter your PhoneNumber" required>
				</div>
	
				<!-- Join Type 입력 -->
				<label class="w3-wide">Join Type</label>
				<div class="w3-row" style="margin-bottom:20px;">
					<input type="radio" name="jointype" value="1" checked="checked" style="border-radius: 6px; margin-left:40px;"> 기획자
					<input type="radio" name="jointype" value="2" style="border-radius: 6px; margin-left:50px;"> 투자자
				</div>
				
				<!-- Job Num 입력 -->
				<label class="w3-wide">Job Num</label>
				<div class="w3-row" style="margin-bottom:20px;">
					<input class="w3-input w3-left " style="width:50%; border-radius: 6px; margin-right:30px;" type="text" name="jobnum"  placeholder="Enter your Job Number" required>
				</div>
				
				<div style="margin-bottom:10px;" align=center>
					<input type="submit" name="confirm" value="Join" class="w3-btn w3-grey page_button2">
					<input type="reset" name="reset" value="Reset" class="w3-btn w3-grey page_button2">
					<input type="button" value="Main" onclick="javascript:window.location='main.do'" class="w3-btn w3-grey">
				</div>
			</form>
		</div>
	</div>
</body>

<script type="text/javascript">
	function checkIt() { //사용자가 입력폼에 입력한 상황을 체크
		var JoinForm = eval("document.JoinForm");
		if (!JoinForm.id.value) { //아이디를 입력하지 않으면...

			alert("ID필수 사항입니다.");
			JoinForm.id.focus();
			return false; //사용자가 서비스를 요청한 시점으로 돌아감
		}
		
		if (!JoinForm.name.value) { //이름을 입력하지 않으면 수행
			alert("사용자 이름을 입력하세요");
			return false;
		}

		if (!JoinForm.password.value) { //비밀번호를 입력하지 않으면 수행
			alert("비밀번호 넣으세요");
			return false;
		}
		if (JoinForm.password.value != JoinForm.password2.value) {//비밀번호와 재입력비밀번호가 같지 않으면 수행
			alert("비밀번호를 동일하게 입력하세요");
			return false;
		}		
	}
	// 아이디 중복 여부 판단 함수

	function openConfirmid(JoinForm) {
		if (!JoinForm.id.value) { //아이디를 입력했는지 검사
			alert("아이디 넣으세요");
			return;
		}
		//url과 사용자 입력 id를 조회합니다.

		url = "ConfirmId.do?id=" + JoinForm.id.value;
		winObject = window.open(url, "id", "width=600, height=100");
		winObject.document.all.id.value = document.all.id.value;
	}
</script>
</html>