<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<body>
<div class="w3-container">
	<br>
	<div class="w3-row" style="width: 50%; min-width: 500px; margin: auto;">
		<div class="w3-container w3-deep-purple">
			<h4><i class="fa fa-user-circle"></i>  내 정보 수정</h4>
		</div>
		<div class="w3-container w3-white w3-card-4"><br>
		
			<form method="post" action="/erp/member/memberUpdateE" enctype="multipart/form-data">
				<table style="width: 100%;">
					<tr>
						<td style="width: 132px; height: 174px;" class="w3-topbar w3-bottombar w3-leftbar w3-rightbar w3-border-deep-purple">
							<div id="imagePreview"></div>
						</td>
						<td class="w3-padding">
							<input type="hidden" name="empno" value="${vo.empno}">
							<label class="w3-text-deep-purple"><b>이름</b></label>
								<input type="text" name="name" placeholder="Name" class="w3-input w3-border w3-border-deep-purple w3-round" value="${vo.name}"><br>
							<label class="w3-text-deep-purple"><b>비밀번호</b></label>
								<input type="text" name="pwd" placeholder="Pwd" class="w3-input w3-border w3-border-deep-purple w3-round" value="${vo.pwd}">
						</td>
					</tr>
					<tr>
						<td colspan="2" style="width: 150px;"><input id="image" type="file" name="file" onchange="InputImage();" required></td>
					</tr>
				</table>
				<table style="width: 100%;">
					<tr>
						<td><br>
							<label class="w3-text-deep-purple"><b>성별</b></label><br>
							&nbsp;&nbsp;&nbsp;&nbsp;${vo.gender}자
						</td>
						<td><br>
							<label class="w3-text-deep-purple"><b>생년월일</b></label>
							<br>&nbsp;&nbsp;&nbsp;&nbsp;<fmt:formatDate value="${vo.birth}" pattern="yyyy년 MM월 dd일"/>
						</td>
					</tr>
					<tr>
						<td colspan="2"><br>
						<a onclick="sample6_execDaumPostcode()" style="cursor: pointer;">
							<label class="w3-text-deep-purple"><b>주소&nbsp;<i class="fa fa-search"></i></b></label>
							<input type="text" id="sample6_address" name="address" placeholder="Address" class="w3-input w3-border w3-border-deep-purple w3-round" value="${vo.address}">
						</a>
						</td>
					</tr>
					<tr>
						<td colspan="2"><br>
							<label class="w3-text-deep-purple"><b>전화번호</b></label>
							<input type="text" name="phone" placeholder="Phone" class="w3-input w3-border w3-border-deep-purple w3-round" value="${vo.phone}">
						</td>
					</tr>
					<tr>
						<td colspan="2"><br>
							<label class="w3-text-deep-purple"><b>이메일</b></label>
							<input type="email" name="email" placeholder="E-mail" class="w3-input w3-border w3-border-deep-purple w3-round" value="${vo.email}">
						</td>
					</tr>
					<tr>
						<td colspan="2"><br>
							<label class="w3-text-deep-purple"><b>계좌번호</b></label>
							<input type="text" name="account" placeholder="Account" class="w3-input w3-border w3-border-deep-purple w3-round" value="${vo.account}">
						</td>
					</tr>
				</table><br>
				<div class="w3-center">
				<input type="submit" name="confirm" class="w3-btn w3-deep-purple w3-text-white" value="수정">
				<input type="button" value="취소" class="w3-btn w3-deep-purple w3-text-white" onclick="window.location='/erp/member/memberContent?empno=${vo.empno}'">
				</div>
			</form><br>
		</div>
	</div>
</div><br>
<script type="text/javascript">
	var InputImage = (function loadImageFile() {
		if (window.FileReader) {
			var ImagePre;
			var ImgReader = new window.FileReader();
			var fileType = /^(?:image\/bmp|image\/gif|image\/jpeg|image\/png|image\/x\-xwindowdump|image\/x\-portable\-bitmap)$/i;
			ImgReader.onload = function(Event) {
				if (!ImagePre) {
					var newPreview = document.getElementById("imagePreview");
					ImagePre = new Image();
					ImagePre.style.width = "118px";
					ImagePre.style.height = "158px";
					newPreview.appendChild(ImagePre);
				}
				ImagePre.src = Event.target.result;
			};

			return function() {
				var img = document.getElementById("image").files;
				if (!fileType.test(img[0].type)) {
					alert("이미지 파일을 업로드 하세요");
					return;
				}
				ImgReader.readAsDataURL(img[0]);
			}
		}
		document.getElementById("imagePreview").src = document
				.getElementById("image").value;
	})();
</script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address').focus();
            }
        }).open();
    }
</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
</body>
</html>