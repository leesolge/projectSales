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
		<div class="w3-container w3-indigo">
			<h4><i class="fa fa-expeditedssl"></i>  권한 수정</h4>
		</div>
		<div class="w3-container w3-white w3-card-4"><br>
			<form method="post" action="/erp/admin/memberUpdateA">
				<table style="width: 100%;">
					<tr>
						<td style="width: 4cm;">
							<img src="/erp/resources/portraits/${vo.portrait}" class="w3-image w3-topbar w3-bottombar w3-leftbar w3-rightbar w3-border-indigo" style="
							width: 3.85cm; height: 4.95cm;">
						</td>
						<td class="w3-padding">
							<input type="hidden" name="empno" value="${vo.empno}">
							<label class="w3-text-indigo"><b>이름</b></label>
								<input type="text" name="name" placeholder="Name" class="w3-input" value="${vo.name}" readonly><br>
							<label class="w3-text-indigo"><b>직급</b></label>
							<select name="auth" class="w3-input w3-border w3-border-indigo w3-round">
								<option class="w3-text-red" value="${vo.auth}" selected>
									<c:if test="${vo.auth == 'ROLE_ADMIN'}">
										관리자
									</c:if>
									<c:if test="${vo.auth == 'ROLE_EMPLOYEE'}">
										영업사원
									</c:if>
									<c:if test="${vo.auth == 'ROLE_MANAGER'}">
										영업팀장
									</c:if>
									<c:if test="${vo.auth == 'ROLE_BUDGET'}">
										자재팀사원
									</c:if>
									<c:if test="${vo.auth == 'ROLE_EE'}">
										승인대기자
									</c:if>
								</option>
								<option value="ROLE_ADMIN">관리자</option>
								<option value="ROLE_BUDGET">자재팀사원</option>
								<option value="ROLE_MANAGER">영업팀장</option>
								<option value="ROLE_EMPLOYEE">영업사원</option>
								<option value="ROLE_EE">승인대기자</option>
							</select><br>
							<label class="w3-text-indigo"><b>소속</b></label>
							<select  name="team" class="w3-input w3-border w3-border-indigo w3-round">
								<option class="w3-text-red"  value="${vo.team}" selected>${vo.team}</option>
								<option value="관리팀">관리팀</option>
								<option value="영업1팀">영업1팀</option>
								<option value="영업2팀">영업2팀</option>
								<option value="영업3팀">영업3팀</option>
								<option value="자재팀">자재팀</option>
							</select>
						</td>
					</tr>
				</table><br>
				<div class="w3-center">
				<input type="submit" name="confirm" class="w3-btn w3-indigo w3-text-white" value="수정">
				<input type="button" value="취소" class="w3-btn w3-indigo w3-text-white" onclick="window.location='/erp/member/memberContent?empno=${vo.empno}'">
				</div>
			</form><br>
		</div>
	</div>
</div><br>
</body>
</html>