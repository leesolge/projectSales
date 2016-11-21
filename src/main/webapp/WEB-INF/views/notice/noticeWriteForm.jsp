<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<body>
	<div class="w3-container w3-center">
		<h2>공지사항</h2>
	</div>
	
	<div class="w3-row"> 
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-container">
			<form class="w3-container" action="/erp/notice/admin/noticeWrite" method="post" >
				<p>
					<label class="w3-wide">Name</label>
					<input
						class="w3-input w3-border w3-round-large"
						style="width: 20%; border-radius: 6px;" name="name"
						readonly value="${memberInfo.name}">
				</p>

				<p>
					<label class="w3-wide">Title</label> <input
						class="w3-input w3-border w3-round-large"
						style="width: 50%; border-radius: 6px;" type="text" name="title"
						placeholder=" 제목을 입력하세요." required>
				</p>

				<p>
					<label class="w3-wide">Content</label>
					<textarea class="w3-input w3-border w3-round-large"" name="content" placeholder=" 내용을 입력하세요."
						style="width: 100%; height: 300px; resize: none; border-radius: 6px;" required></textarea>
				</p>
				<div class="w3-row">
					<div class="w3-col w3-left" style="width:10%"><p></p></div>
					<div class="w3-col w3-right" style="width:10%"><button class="w3-btn w3-round-large"
							onclick="location='/erp/notice/noticeList'">목록으로</button></div>
					<div class="w3-rest w3-center">
						<input class="w3-btn w3-round-large" type="submit" value="쓰기" /> <input class="w3-btn w3-round-large" type="reset" value="취소" />
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>