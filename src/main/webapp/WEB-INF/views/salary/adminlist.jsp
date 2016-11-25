<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<form method="post" action="/erp/admin/salary">
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
			<select name="emp">
				<option value="" disabled selected>팀/사원 선택</option>
				<c:forEach var="mlist" items="${mlist}">
				<option value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
				</c:forEach>
			</select>
			<input type="submit" value="조회">
		</form>
		
		${dateview}<c:if test="${equal=='1'}">&nbsp;예정&nbsp;</c:if>월급
		<table>
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>팀</td>
				<td>직급</td>
				<td>지급액</td>
				<td>판매수당</td>
				<td>관리수당</td>
				<td>소득세</td>
				<td>주민세</td>
				<td>실지급액</td>
			</tr>
			<c:forEach var="slist" items="${salarylist}">
				<tr>
				<td>${slist.empno}</td>
				<td>${slist.name}</td>
				<td>${slist.team}</td>
				<td>${slist.auth}</td>
				<td>${slist.salary}</td>
				<td>${slist.allowance}</td>
				<td>${slist.manager}</td>
				<td>${slist.tax1}</td>
				<td>${slist.tax2}</td>
				<td>${slist.reals}</td>
				</tr>
			</c:forEach>
		</table>
		
		<br>
		<c:if test="${budget!='1'}">
		당월 실적
		<table>
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>소속</td>
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
				<td>${mylist.name}</td>
				<td>${mylist.team}</td>
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
		</c:if>
	</body>
</html>