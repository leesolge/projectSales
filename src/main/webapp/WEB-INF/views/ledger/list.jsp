<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<form name="viewList" action="/erp/ledger/list" method="post">
			<input name="startdate" type="date">&nbsp;
			<input name="enddate" type="date">&nbsp;
			<select name="sort">
				<option value="">전체</option>
				<c:if test="${sort=='수입'}">
					<option value="수입" selected="selected">수입</option>
				</c:if>
				<c:if test="${sort!='수입'}">
					<option value="수입">수입</option>
				</c:if>
				<c:if test="${sort=='지출'}">
					<option value="지출" selected="selected">지출</option>
				</c:if>
				<c:if test="${sort!='지출'}">
					<option value="지출">지출</option>
				</c:if>
			</select>&nbsp;
			<input type="submit" value="조회">
		</form>
		
		<table>
			<tr>
				<td>고유번호</td>
				<td>사번</td>
				<td>이름</td>
				<td>등록일</td>
				<td>내용</td>
				<td>수입</td>
				<td>지출</td>
				<td>누계</td>
				<td>비고</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			
			<c:forEach var="list" items="${list}">
				<tr>
					<td>${list.id}</td>
					<td>${list.empno}</td>
					<td>${list.name}</td>
					<td>${list.change}</td>
					<td>${list.content}</td>
					<td><c:if test="${list.sort=='수입'}">${list.amount}</c:if><c:if test="${list.sort!='수입'}">0</c:if></td>
					<td><c:if test="${list.sort=='지출'}">${list.amount}</c:if><c:if test="${list.sort!='지출'}">0</c:if></td>
					<td>${list.money}</td>
					<td>${list.etc}</td>
					<td><c:if test="${list.enable=='1'}"><button onclick="">수정</button></c:if></td>
					<td><c:if test="${list.enable=='1'}"><button onclick="">삭제</button></c:if></td>
				</tr>
			</c:forEach>
			
		</table>
		<button onclick="location.href='/erp/ledger/registForm'">등록</button>
		
	</body>
</html>