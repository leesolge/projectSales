<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
	
		<form action = "/erp/salary/view" name="selection" method="post">
			<select name="datevalue">
				<c:forEach var="selection" items="${selectlist}">
					<c:if test="${datevalue==selection.datevalue}">
					<option value="${selection.datevalue}" selected="selected">${selection.viewdate}</option>
					</c:if>
					<c:if test="${datevalue!=selection.datevalue}">
					<option value="${selection.datevalue}">${selection.viewdate}</option>
					</c:if>
				</c:forEach>
			</select>
			<input type="submit" value="조회">
		</form>
		
		<c:out value="${dateview}" /><c:if test="${equal=='1'}">&nbsp;예정 월급</c:if>
		<c:if test="${equal=='0'}">&nbsp;월급</c:if>
		<table>
			<tr>
				<td>사번</td>
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
				<td>${slist.empno}</td>
				<td>${slist.salary}</td>
				<td>${slist.allowance}</td>
				<td>${slist.manager}</td>
				<td>${slist.tax1}</td>
				<td>${slist.tax2}</td>
				<td>${slist.reals}</td>
				</tr>
			</c:if>
			</c:forEach>
		</table>
		<br>
		당월 개인 실적
		<table>
			<tr>
				<td>사번</td>
				<td>판매일</td>
				<td>제품코드</td>
				<td>제품명</td>
				<td>판매수량</td>
				<td>판매수당</td>
				<td>고객명</td>
				<td>고객주소</td>
			</tr>
			<c:forEach var="mylist" items="${mylist}">
			<tr>
				<td>${mylist.empno}</td>
				<td>${mylist.changes}</td>
				<td>${mylist.procode}</td>
				<td>${mylist.proname}</td>
				<td>${mylist.proamount}</td>
				<td>${mylist.allowance}</td>
				<td>${mylist.customer}</td>
				<td>${mylist.address}</td>
			</tr>
			</c:forEach>
		</table>
		
		<s:authorize access="hasRole('ROLE_MANAGER')">
		<br>
		당월 팀 실적
		<table>
			<tr>
				<td>사번</td>
				<td>판매일</td>
				<td>제품코드</td>
				<td>제품명</td>
				<td>판매수량</td>
				<td>판매수당</td>
				<td>고객명</td>
				<td>고객주소</td>
			</tr>
			<c:forEach var="teamlist" items="${teamlist}">
			<tr>
				<td>${teamlist.empno}</td>
				<td>${teamlist.changes}</td>
				<td>${teamlist.procode}</td>
				<td>${teamlist.proname}</td>
				<td>${teamlist.proamount}</td>
				<td>${teamlist.allowance}</td>
				<td>${teamlist.customer}</td>
				<td>${teamlist.address}</td>
			</tr>
			</c:forEach>
		</table>
		</s:authorize>
	</body>
</html>