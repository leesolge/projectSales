<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<form action="/erp/admin/order" method="get">
			<input name="firstdate" type="date">&nbsp;
			<input name="seconddate" type="date">&nbsp;
			<select name="product">
				<option value="" disabled selected>제품선택</option>
				<c:forEach var="plist" items="${plist}">
					<option value="${plist.procode}">${plist.procode}&nbsp;${plist.proname}</option>
				</c:forEach>
			</select>
			&nbsp;
			<select name="emp">
				<option value="" disabled selected>팀/사원 선택</option>
				<c:forEach var="mlist" items="${mlist}">
					<option value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
				</c:forEach>
			</select>
			<input type="submit" value="열람">
		</form>
		
		<table border="1">
			<tr>
				<td>구분</td>
				<td>사번</td>
				<td>등록날짜</td>
				<td>이름</td>
				<td>소속</td>
				<td>직급</td>
				<td>제품코드</td>
				<td>제품명</td>
				<td>수량</td>
				<td>수익</td>
				<td>직원 수당</td>
				<td>고객명</td>
				<td>고객 주소</td>
			</tr>
			<c:forEach var="alist" items="${alist}">
				<tr>
					<td>${alist.id}</td>
					<td>${alist.empno}</td>
					<td>${alist.changes}</td>
					<td>${alist.name}</td>
					<td>${alist.team}</td>
					<td>${alist.auth}</td>
					<td>${alist.procode}</td>
					<td>${alist.proname}</td>
					<td>${alist.proamount}</td>
					<td>${alist.profit}</td>
					<td>${alist.allowance}</td>
					<td>${alist.customer}</td>
					<td>${alist.address}</td>
				</tr>
			</c:forEach>
		</table>
	</body>
</html>