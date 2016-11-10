<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
	</head>
	
	<body>
		<div style="margin: auto;">
			<form action="/erp/note/replys" method="post">
				<input type="hidden" name="pageCheck" value="${pageCheck}">
				<input type="hidden" name="notenum" value="${notenum}">
				<input type="hidden" name="pageNum" value="${pageNum}">
				<input type="hidden" name="field" value="${field}">
				<input type="hidden" name="keyword" value="${keyword}">
				<table>
					<tr>
						<td>발신인 : ${svo.name}<input type="hidden" name="sender" value="${svo.empno}"></td>
						<td>수신인 : ${rvo.name}<input type="hidden" name="receiver" value="${rvo.empno}"></td>
					</tr>
					<tr>
						<td colspan="2">제목&nbsp;<input type="text" name="title" size="30" required="required"></td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2"><textarea cols="35" rows="6" name="content" required="required"></textarea></td>
					</tr>
					<tr>
						<td><input type="submit" value="전송"></td>
						<td><input
						 type="reset" value="리셋"></td>
					</tr>
				</table>
			</form>
		</div>
		
		
	</body>
</html>