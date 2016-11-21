<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>

<html>
<body>
	<div class="w3-container w3-center">
		<h2>공지사항</h2>
	</div>

	<div class="w3-row">
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-container ">
			<p>
				<label class="w3-wide">Name</label>
				<input
					class="w3-input w3-border w3-round-large"
					style="width: 20%; border-radius: 6px;" name="name" readonly
					value="${noticeVo.name}">
				<label class="w3-wide">Title</label>
				<input
					class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="title"
					readonly value="${noticeVo.title}">
				<label class="w3-wide">Date</label>
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="regDate"
					readonly
					value="<fmt:formatDate value="${noticeVo.regDate}" pattern="yy-MM-dd"/>">
			</p>

			<p>
				<label class="w3-wide">Content</label>
				<textarea class="w3-input w3-border w3-round-large" " name="content"
					style="width: 100%; height: 300px; resize: none; border-radius: 6px;"
					readonly>${noticeVo.content}</textarea>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 10%">
			<p></p>
		</div>
		<div class="w3-col w3-right" style="width: 10%">
			<p></p>
		</div>
		<div class="w3-rest w3-center">
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
				<input class="w3-btn w3-round-large" type="button" value="수정"
					onclick="location='/erp/notice/admin/noticeUpdateForm?num=${noticeVo.num}'" />
				<input class="w3-btn w3-round-large" type="button" value="삭제"
					onclick="location='/erp/notice/admin/noticeDelete?num=${noticeVo.num}'" />
			</sec:authorize>
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/notice/noticeList'">목록으로</button>
		</div>
	</div>

</body>

<script type="text/javascript">
	function comments_update(seq) {
		var update = document.reply;
		update.seq.value = seq;
		update.submit();
	}
	function comments_delete(seq) {
		var jumping = document.c_delete;
		jumping.seq.value = seq;
		jumping.submit();
	}
</script>
</html>