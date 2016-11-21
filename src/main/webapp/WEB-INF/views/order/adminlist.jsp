<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<script type="text/javascript">
	function morders(pn){
		var jumping = document.mord;
		jumping.orderid.value=pn;
		jumping.submit();
	}
	function details(pn, pa){
		var jumping = document.detail;
		jumping.orderid.value=pn;
		jumping.checks.value=pa;
		jumping.submit();
	}
	function dorders(pn){
		if (confirm("해당 수주를 정말 취소하시겠습니까?") == true){
			var jumping = document.dord;
			jumping.orderid.value=pn;
			jumping.submit();
		}else{
		    return;
		}
	}
	function corders(pn){
		if (confirm("해당 판매 요청을 정말 확정하시겠습니까?") == true){
			var jumping = document.cord;
			jumping.orderid.value=pn;
			jumping.submit();
		}else{
		    return;
		}
	}
	function worders(){
		var jumping = document.write;
		jumping.submit();
	}
	</script>
	<head>
		<title>Title</title>
	</head>
	
	<body>
	<form name="detail" action="/erp/order/detail" method="post">
		<input name="orderid" type="hidden" value="0">
		<input name="authpage" type="hidden" value="${authpage}">
		<input name="checks" type="hidden" value="0">
	</form>
	<form name="mord" action="/erp/order/modifyForm" method="post">
		<input name="orderid" type="hidden" value="0">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	
	<form name="dord" action="/erp/order/delete" method="post">
		<input name="orderid" type="hidden" value="0">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	
	<form name="cord" action="/erp/order/cancle" method="post">
		<input name="orderid" type="hidden" value="0">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	<form name="write" action="/erp/order/registForm" method="post">
		<input name="authpage" type="hidden" value="${authpage}">
	</form>
	
		<form action="/erp/order/list" method="post">
			<input name="authpage" type="hidden" value="${authpage}">
			<input name="firstdate" type="date">&nbsp;
			<input name="seconddate" type="date">&nbsp;
			<select name="product">
				<option value="" disabled selected>제품선택</option>
				<c:forEach var="plist" items="${plist}">
					<option value="${plist.procode}">${plist.procode}&nbsp;${plist.proname}</option>
				</c:forEach>
			</select>
			&nbsp;
			<c:if test="${mlist!=null}">
			<select name="emp">
				<option value="" disabled selected>팀/사원 선택</option>
				<c:forEach var="mlist" items="${mlist}">
					<option value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
				</c:forEach>
			</select>
			</c:if>
			&nbsp;
			<select name="checks">
				<c:if test="${checks==0}">
					<option value="0" selected="selected">승인 대기</option>
				</c:if>
				<c:if test="${checks!=0}">
					<option value="0">승인 대기</option>
				</c:if>
				<c:if test="${checks==1}">
					<option value="1" selected="selected">승인 목록</option>
				</c:if>
				<c:if test="${checks!=1}">
					<option value="1">승인 목록</option>
				</c:if>
			</select>
			&nbsp;
			<input type="submit" value="열람">
		</form>
		
		<table border="1">
			<tr>
				<td>사번</td>
				<td>이름</td>
				<td>등록날짜</td>
				<td>제품코드</td>
				<td>제품명</td>
				<td>수량</td>
				<td>수익</td>
				<td>판매 수당</td>
				<td>매니저 수당</td>
			</tr>
			<c:forEach var="alist" items="${alist}">
				<tr onclick="javascript:details('${alist.id}', '${alist.checks}')">
					<td>${alist.empno}</td>
					<td>${alist.name}</td>
					<td>${alist.changes}</td>
					<td>${alist.procode}</td>
					<td>${alist.proname}</td>
					<td>${alist.proamount}</td>
					<td>${alist.profit}원</td>
					<td>${alist.allowance}원</td>
					<td><c:if test="${alist.manage!=null||alist.manage!='0'}">${alist.manage}원</c:if></td>
				</tr>
			</c:forEach>
		</table>
		<button onclick="javascript:worders()">등록</button>
	</body>
</html>