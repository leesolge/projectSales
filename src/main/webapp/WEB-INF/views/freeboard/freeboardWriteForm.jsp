<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<script>
/* function writeFormSubmit(){
	if ( $.trim($("#name1").val()) == "") {
		alert("작성자를 입력해주세요.");
		$("#name1").focus();
		return;
	}
	if ($.trim($("#title1").val()) == "") {
		alert("글 제목을 입력해주세요.");
		$("#title1").focus();
		return;
	}
	if ($.trim($("#content1").val()) == "") {
		alert("글 내용을 입력해주세요.");
		$("#content1").focus();
		return;
	}
	$("#form1").submit();
} */
</script>
</head>
<body>
	<div class="w3-container w3-center">
		<h1>글쓰기</h1>
	</div>
	
	<div class="w3-row"> 
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-container">
			<form id="form1" class="w3-container" action="freeboardWrite" method="post" name="write">
				<p>
					<label class="w3-wide">Name</label>
					<input
						class="w3-input w3-border w3-round-large"
						style="width: 20%; border-radius: 6px;" id="name1" name="name"
						readonly value="${memberInfo.name}">
				</p>

				<p>
					<label class="w3-wide">Title</label> 
					<input
						class="w3-input w3-border w3-round-large"
						style="width: 50%; border-radius: 6px;" type="text" id="title1" name="title"
						placeholder="제목을 입력하세요." required>
				</p>

				<p>
					<label class="w3-wide">Content</label>
					<textarea class="w3-input w3-border w3-round-large" id="content1" name="content" placeholder="내용을 입력하세요."
						style="width: 100%; height: 300px; resize: none; border-radius: 6px;" required></textarea>
				</p>
				<div class="w3-row">
					<div class="w3-col w3-left" style="width:10%"><p></p></div>
					<div class="w3-col w3-right" style="width:10%">
						<button class="w3-btn w3-round-large"
							onclick="history.back()">목록으로</button>
					</div>
					<div class="w3-rest w3-center">
						<!-- <a href="#" onclick="writeFormSubmit()" class="w3-btn w3-round-large">쓰기</a> -->
						<input class="w3-btn w3-round-large" type="submit" value="쓰기" />
						<input class="w3-btn w3-round-large" type="reset" value="취소" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>