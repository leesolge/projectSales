<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>


<html>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<body><br>
	<sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
	<div>
		<a href="#" onclick="Update('UpdateFormA')" class="w3-right"><i class="fa fa-cogs"></i>  권한수정　</a>
	</div><br>
	</sec:authorize>
	<form action="/erp/member/memberUpdateFormE" name="UpdateFormE"	method="post">
	</form>
	<form action="/erp/admin/memberUpdateFormA" name="UpdateFormA"	method="post">
		<input type="hidden" name="empno" value="${vo.empno}">
	</form>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<div class="w3-row">
				<c:if test="${memberInfo.empno==vo.empno}">
					<h3><i class="fa fa-user-circle-o"></i> 내 정보</h3>
				</c:if>
				<c:if test="${memberInfo.empno!=vo.empno}">
					<h3><i class="fa fa-user-circle-o"></i> 회원 정보</h3>
				</c:if>
			</div>
			<div class="w3-row">
				<div class="w3-third w3-center">
					<img src="/erp/resources/portraits/${vo.portrait}" class="w3-image w3-topbar w3-bottombar w3-leftbar w3-rightbar w3-border-deep-purple" style="
					width: 3.85cm; height: 4.95cm;">
				</div>
				<div class="w3-third w3-padding">
					<label class="w3-text-deep-purple"><b>성별</b></label>
						<input type="text" class="w3-input" value="${vo.gender}" readonly><br>
					<label class="w3-text-deep-purple"><b>이름</b></label>
						<input type="text" class="w3-input" value="${vo.name}" readonly><br>
					<label class="w3-text-deep-purple"><b>주소</b></label>
						<input type="text" class="w3-input" value="${vo.address}" readonly><br>
					<label class="w3-text-deep-purple"><b>이메일</b></label>
						<input type="text" class="w3-input" value="${vo.email}" readonly><br>
					<label class="w3-text-deep-purple"><b>생년월일</b></label>
						<input type="text" class="w3-input" value="<fmt:formatDate value="${vo.birth}" pattern="yyyy년 MM월 dd일"/>" readonly><br>
					<label class="w3-text-deep-purple"><b>전화번호</b></label>
						<input type="text" class="w3-input" value="${vo.phone}" readonly><br>
				</div>
				<div class="w3-third w3-padding">
					<label class="w3-text-deep-purple"><b>사번</b></label>
						<input type="text" class="w3-input" value="${vo.empno}" readonly><br>
					<label class="w3-text-deep-purple"><b>소속</b></label>
						<input type="text" class="w3-input" value="${vo.team}" readonly><br>
					<label class="w3-text-deep-purple"><b>직급</b></label>
						<c:if test="${vo.auth == 'ROLE_ADMIN'}">
							<input type="text" class="w3-input" value="관리자" readonly><br>
						</c:if>
						<c:if test="${vo.auth == 'ROLE_EMPLOYEE'}">
							<input type="text" class="w3-input" value="사원" readonly><br>
						</c:if>
						<c:if test="${vo.auth == 'ROLE_MANAGER'}">
							<input type="text" class="w3-input" value="팀장" readonly><br>
						</c:if>
						<c:if test="${vo.auth == 'ROLE_BUDGET'}">
							<input type="text" class="w3-input" value="사원" readonly><br>
						</c:if>
						<c:if test="${vo.auth == 'ROLE_EE'}">
							<input type="text" class="w3-input" value="-" readonly><br>
						</c:if>
					<label class="w3-text-deep-purple"><b>입사일</b></label>
						<input type="text" class="w3-input" value="<fmt:formatDate value="${vo.join}" pattern="yyyy년 MM월 dd일"/>" readonly><br>
					<label class="w3-text-deep-purple"><b>계좌번호</b></label>
						<input type="text" class="w3-input" value="${vo.account}" readonly><br>
				</div>
			</div>
			<c:if test="${memberInfo.empno==vo.empno}">
				<div class="w3-row w3-center">
					<input type="button" value="수정" onclick="Update('UpdateFormE')" class="w3-round-large w3-deep-purple w3-border w3-border-deep-purple"/>
				</div>
			</c:if>
		</div>
	</div><br>
</body>
<script type="text/javascript">
	function Update(formname) {
		var name=formname;
		document.forms[name].submit();
	}
</script>
</html>