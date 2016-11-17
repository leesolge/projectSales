<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<h2>${checks}월급 및 실적</h2>
		
		<form action="/erp/salary/view" method="post">
			<select name="datevalue">
				<c:forEach var="selectlist" items="${calist}">
					<c:if test="${datevalue==selectlist.datevalue}">
					<option value="${selectlist.datevalue}" selected="selected">${selectlist.viewdate}</option>
					</c:if>
					<c:if test="${datevalue!=selectlist.datevalue}">
					<option value="${selectlist.datevalue}">${selectlist.viewdate}</option>
					</c:if>
				</c:forEach>
			</select>&nbsp;
			<input type="submit" value="열람">
		</form>
		
		<table border="1">
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>소속</td>
				<td>직급</td>
				<td>월급</td>
			</tr>
			<tr>
				<td>${memberInfo.empno}</td>
				<td>${memberInfo.name}</td>
				<td>${memberInfo.team}</td>
				<td>
					<c:if test="${memberInfo=='ROLE_MANAGER'}">팀장</c:if>
					<c:if test="${memberInfo=='ROLE_EMPLOYEE'}">사원</c:if>
				</td>
				<td>${payment}</td>
			</tr>
		</table>
		
		<table border="1">
			<tr>
				<td>구분</td>
				<td>사번</td>
				<td>등록날짜</td>
				<td>이름</td>
				<td>제품코드</td>
				<td>제품명</td>
				<td>수량</td>
				<td>직원 수당</td>
			</tr>
			<c:forEach var="alist" items="${perlist}">
				<tr>
					<td>${alist.id}</td>
					<td>${alist.empno}</td>
					<td>${alist.changes}</td>
					<td>${alist.name}</td>
					<td>${alist.procode}</td>
					<td>${alist.proname}</td>
					<td>${alist.proamount}</td>
					<td>${alist.allowance}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>