<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<div class="w3-container">
	<br>
	<div class="w3-row" style="width: 100%; margin: auto;">
		<div class="w3-container w3-indigo w3-center">
			<h4><i class="fa fa-plus-square"></i>  상품 등록</h4>
		</div>
		<div class="w3-container w3-white w3-card-4"><br>
			<form action="/erp/product/insert" method="post" enctype="multipart/form-data">
				<table style="width: 100%;">
					<tr>
						<td style="width: 300px; height: 200px;" class="w3-topbar w3-bottombar w3-leftbar w3-rightbar w3-border-indigo">
							<div id="imagePreview"></div>
						</td>
						<td class="w3-padding">
							<label class="w3-text-indigo"><b>물품코드</b></label>
								<input type="text" name="procode" class="w3-input w3-border w3-border-indigo w3-round"><br>
							<label class="w3-text-indigo"><b>물품명</b></label>
								<input type="text" name="proname" class="w3-input w3-border w3-border-indigo w3-round"><br>
							<label class="w3-text-indigo"><b>물품설명</b></label>
								<input type="text" name="proexpla" class="w3-input w3-border w3-border-indigo w3-round">
						</td>
						<td class="w3-padding">
							<label class="w3-text-indigo"><b>수량</b></label>
								<input type="number" name="proamount" class="w3-input w3-border w3-border-indigo w3-round"><br>
							<label class="w3-text-indigo"><b>입고가</b></label>
								<input type="number" name="originprice" class="w3-input w3-border w3-border-indigo w3-round"><br>
							<label class="w3-text-indigo"><b>출고가</b></label>
								<input type="number" name="sellprice" class="w3-input w3-border w3-border-indigo w3-round">
						</td>
					</tr>
					<tr>
						<td colspan="3"><input id="image" type="file" name="file" onchange="InputImage();" required></td>
					</tr>
				</table>
				<div class="w3-center">
					<input class="w3-btn w3-indigo w3-text-white" type="submit" name="confirm" value="추가">
					<input class="w3-btn w3-indigo w3-text-white" type="button" value="취소" onclick="location.href='/erp/product/list'">  
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
					ImagePre.style.width = "300px";
					ImagePre.style.height = "150px";
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
</body>
</html>