<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>Title</title>
</head>
<body><br>
<div class="w3-container">
	<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
		<!-- Title -->
		<div class="w3-row">
			<h3><i class="fa fa-money"></i> 월급조회</h3>
		</div>
		<form action = "/erp/salary/view" name="selection" method="post">
			<div class="w3-container w3-center">
				<table>
					<tr>
						<th>
						<select name="datevalue" class="w3-round-large">
							<c:forEach var="selection" items="${selectlist}">
								<c:if test="${datevalue==selection.datevalue}">
								<option value="${selection.datevalue}" selected="selected">${selection.viewdate}</option>
								</c:if>
								<c:if test="${datevalue!=selection.datevalue}">
								<option value="${selection.datevalue}">${selection.viewdate}</option>
								</c:if>
							</c:forEach>
						</select>
						</th>
						<th>
							<button type="submit" class="w3-round-large w3-indigo w3-border w3-border-indigo"><i class="fa fa-search"></i></button>
						</th>
					</tr>
				</table>
			</div>
		</form><br>
		${dateview}<c:if test="${equal=='1'}">&nbsp;예정&nbsp;</c:if>월급
			<table class="w3-table w3-small w3-hoverable w3-bordered">
				<tr class="w3-indigo">
					<td>지급액</td>
					<td>판매수당</td>
					<td>관리수당</td>
					<td>소득세</td>
					<td>주민세</td>
					<td>실지급액</td>
				</tr>
				<c:forEach var="slist" items="${slist}">
					<c:if test="${slist.salarydate==datevalue}">
						<tr>
							<td class="w3-text-blue"><fmt:formatNumber value="${slist.salary}" pattern="#,###" /></td>
							<td class="w3-text-blue"><fmt:formatNumber value="${slist.allowance}" pattern="#,###" /></td>
							<td class="w3-text-blue"><fmt:formatNumber value="${slist.manager}" pattern="#,###" /></td>
							<td class="w3-text-red"><fmt:formatNumber value="${slist.tax1}" pattern="#,###" /></td>
							<td class="w3-text-red"><fmt:formatNumber value="${slist.tax2}" pattern="#,###" /></td>
							<td><b>₩&nbsp;<fmt:formatNumber value="${slist.reals}" pattern="#,###" /></b></td>
						</tr>
					</c:if>
				</c:forEach>
			</table>
		<br>
			당월 개인 실적
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<tr class="w3-indigo">
						<td>판매일</td>
						<td>사번</td>
						<td>제품코드</td>
						<td>제품명</td>
						<td>판매수량</td>
						<td>판매수당</td>
						<td>고객명</td>
						<td>고객주소</td>
					</tr>
				</table>
				<div style="height:150px; overflow: auto;">
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<c:forEach var="mylist" items="${mylist}">
						<tr>
							<td><fmt:formatDate value="${mylist.regdate}" pattern="yy-MM-dd" /></td>
							<td>${mylist.empno}</td>
							<td>${mylist.procode}</td>
							<td>${mylist.proname}</td>
							<td>${mylist.proamount}</td>
							<td style="text-align: right;"><fmt:formatNumber pattern="#,###" value="${mylist.allowance}"/></td>
							<td>${mylist.customer}</td>
							<td><span title="${mylist.address}">${mylist.address}</span></td>
						</tr>
					</c:forEach>
				</table>
				</div>
				<s:authorize access="hasRole('ROLE_MANAGER')">
				<br>
				당월 팀 실적
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<tr class="w3-indigo">
						<td>사번</td>
						<td>판매일</td>
						<td>제품코드</td>
						<td>제품명</td>
						<td>판매수량</td>
						<td>관리수당</td>
						<td>고객명</td>
						<td>고객주소</td>
					</tr>
				</table>
				<div style="height:150px; overflow: auto;">
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<c:forEach var="teamlist" items="${teamlist}">
					<tr>
						<td>${teamlist.empno}</td>
						<td><fmt:formatDate value="${teamlist.regdate}" pattern="yy-MM-dd" /></td>
						<td>${teamlist.procode}</td>
						<td>${teamlist.proname}</td>
						<td>${teamlist.proamount}</td>
						<td>${teamlist.manager}</td>
						<td>${teamlist.customer}</td>
						<td><span title="${teamlist.address}">${teamlist.address}</span></td>
					</tr>
					</c:forEach>
				</table>
				</div>
				</s:authorize>
	</div>
	<br>
</div>
<br>
</body>
</html>