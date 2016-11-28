<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<% String cp = request.getContextPath(); %>

<html>
<head>
<script src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	function Update(replynum, child){
		var replyUpdate = document.replyUpdate;
		replyUpdate.replynum.value = replynum;
		replyUpdate.child.value = child;
		replyUpdate.submit();
	}

	function Delete(replynum, child){
		var replyDelete = document.replyDelete;
		replyDelete.replynum.value = replynum;
		replyDelete.child.value = child;
		replyDelete.submit();
	}
	
	function ReReply(replynum){
		var reReply = document.reReplyWrite;
		reReplyWrite.replynum.value = replynum;
		reReplyWrite.submit();
	}
	
	<%-- $(document).ready(function(){
	    $('#cmt').click(function(){
	        $.post('<%=cp%>/freeboard/freeboardContent',
	        {
	          name: "Donald Duck",
	          city: "Duckburg"
	        },
	        function(data,status){
	            alert("Data: " + data + "\nStatus: " + status);
	        });
	    });
	});
 	function doCreateCmt() {
	      // 한줄댓글 내용이 필수이므로 검사
	      if($('#cmt').val() == '') {
	            alert("한줄 댓글의 내용은 필수 입력입니다.");
	            $('#cmt').focus(); return;
	      }
	      // 버튼 중복 클릭 방지
	      $('#createbt').attr('disabled', 'disabled');
	      $.post('<%=cp%>/freeboard/freeboardContent',
	                  {cwriter:$('#cwriter').val(),
	                   cmt:$('#cmt').val()},
	                  function(data){
	                         $('#cmt').val(''); // 내용 비우기
	                         // 다시 클릭이 가능하게끔
	                         $('#createbt').attr("disabled", false);
	                         // 입력이 완료가 됐으므로 다시 리스트 불러오기
	                         cmtList();
	                  });
	}
	
	function cmtList() {
	      $('#cmtTarget').load("<%=cp%>/freeboard/freeboardContent?num=${freeboardVO.num}");
	}
	
	$(function(){
	      // id가 cmt인 텍스트에서 엔터를 쳤을 경우
	      // 바로 데이터 입력이 되도록 작성
	      $('#cmt').keyup(function(e){
	            if(e.keyCode == 13) doCreateCmt();
	      });
	      // 처음 읽기 화면 들어왔을때 바로 리스트를 가져와서 보여줌
	      cmtList();
	}); --%>
</script>
</head>
<body>
	<div class="w3-container w3-center">
		<h2>글 읽기</h2>
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
					value="${freeboardVO.name}">
				<label class="w3-wide">Title</label> 
				<input 
					class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="title"
					readonly value="${freeboardVO.title}">
				<label class="w3-wide">Date</label> 
				<input class="w3-input w3-border w3-round-large"
					style="width: 50%; border-radius: 6px;" type="text" name="regDate"
					readonly 
					value='<fmt:formatDate value="${freeboardVO.regDate}" pattern="yy-MM-dd_hh:mm:ss"/>'>
			</p>

			<p>
				<label class="w3-wide">Content</label>
				<textarea class="w3-input w3-border w3-round-large" name="content"
					style="width: 100%; height: 300px; resize: none; border-radius: 6px;"
					readonly>${freeboardVO.content}</textarea>
			</p>
		</div>
	</div>
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 15%"><p></p></div>		
		<div class="w3-col w3-right" style="width: 15%"><p></p></div>		
		<div class="w3-rest w3-center">
			<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
				<input class="w3-btn w3-round-large"  type="button" value="수정" 
					onclick="location='/erp/freeboard/freeboardUpdateForm?num=${freeboardVO.num}'"/>
				<input class="w3-btn w3-round-large"  type="button" value="삭제" 
					onclick="location='/erp/freeboard/freeboardDelete?num=${freeboardVO.num}'"/>
			</sec:authorize>
			<button class="w3-btn w3-round-large"
				onclick="location='/erp/freeboard/freeboardList'">목록으로</button>
		</div>
	</div>

	<br>

	<!-- 댓글 작성 부분 -->
	<div class="w3-row">
		<div class="w3-col w3-left" style="width: 15%"><p></p></div>
		<div class="w3-col w3-right" style="width: 15%"><p></p>	</div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/freeboard/replyWrite" method="post">
			
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="empno" value="${memberInfo.empno}">
				
				<div class="w3-col s2 w3-center">
					<label>작성자</label> 
					<input class="w3-input w3-border w3-round-large"
						readonly value="${memberInfo.name}">
				</div>
				
				<div class="w3-col s8 w3-center">
					<label class="w3-wide">댓글</label>
					<input class="w3-input w3-border w3-round-large" type="text" name="reply">
				</div>
				<div class="w3-col s1 w3-center"><p></p></div>
				<div class="w3-col s1 w3-center">
					<label>&nbsp;</label>
					<input class="w3-btn w3-input page_button w3-round-large w3-right"
						type="submit" value="등록">
				</div>
			</form>
		</div>
	</div>
			
	<!-- 달려있는 댓글 보기 -->
	<div class="w3-row">
		<div class="w3-col w3-left" style="width:15%"><p></p></div>
		<div class="w3-col w3-right" style="width:15%"><p></p></div>
		<div class="w3-rest w3-row-padding">
			<form action="/erp/freeboard/replyDelete" name="replyDelete" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="child" value="${freeboardReplyVO.child}">
				<input type="hidden" name="replynum" value="${freeboardReplyVO.replynum}">
			</form>
			<form action="/erp/freeboard/replyUpdateForm" name="replyUpdate" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="child" value="${freeboardReplyVO.child}">
				<input type="hidden" name="replynum" value="0">
			</form>
			<form action="/erp/freeboard/reReplyWriteForm" name="reReplyWrite" method="post">
				<input type="hidden" name="num" value="${freeboardVO.num}"> 
				<input type="hidden" name="replynum" value="${freeboardReplyVO.replynum}">
				<input type="hidden" name="empno" value="${memberInfo.empno}">
			</form>
			
			<table class="w3-table w3-striped w3-border w3-centered">
				<tr>
					<th style="width: 10%">작성자</th>
					<th style="width: 55%">내용</th>
					<th style="width: 20%">작성일</th>
					<th style="width: 5%">수정</th>
					<th style="width: 5%">삭제</th>
					<th style="width: 5%">댓글</th>
				</tr>
				<c:forEach var="replyList" items="${replyList}">
					<tr>
						<c:if test="${replyList.child=='0'}">
							<td>${replyList.name}</td>
							<td style="text-align: left;">${replyList.reply}</td>
							<td>
								<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd_hh:mm:ss"/>
							</td>
							<c:if test="${memberInfo.empno==replyList.empno}">
								<td><input type="button" value="수정"
									onclick="Update('${replyList.replynum}', '${replyList.child}')" /></td>
								<td><input type="button" value="삭제"
									onclick="Delete('${replyList.replynum}', '${replyList.child}')" /></td>
							</c:if>
							<td>
								<input type="button" value="댓글"
									onclick="ReReply('${replyList.replynum}')"/>	
							</td>
						</c:if>
						<c:if test="${replyList.child!='0'}">
							<td>${replyList.name}</td>
							<td style="text-align: left;"><i class="fa fa-hand-o-right"></i>${replyList.reply}</td>
							<td>
								<fmt:formatDate value="${replyList.regDate}" pattern="yy.MM.dd_hh:mm:ss"/>
							</td>
							<c:if test="${memberInfo.empno==replyList.empno}">
								<td><input type="button" value="수정"
									onclick="Update('${replyList.replynum}', '${replyList.child}')" /></td>
								<td><input type="button" value="삭제"
									onclick="Delete('${replyList.replynum}', '${replyList.child}')" /></td>
							</c:if>
							<%-- <td>
								<input type="button" value="댓글"
									onclick="ReReply('${replyList.replynum}')"/>	
							</td> --%>
						</c:if>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>
</html>