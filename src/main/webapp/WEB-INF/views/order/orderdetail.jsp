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
		if (confirm("해당 판매 요청을 정말 승인하시겠습니까?") == true){
			var jumping = document.cord;
			jumping.orderid.value=pn;
			jumping.submit();
		}else{
		    return;
		}
	}
	function jump(pc){
		var j = document.lists;
		j.checks.value=pc
		j.submit();
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
	<form name="lists" action="/erp/order/list" method="post">
		<input name="authpage" type="hidden" value="${authpage}">
		<input name="checks" type="hidden" value="0">
	</form>
	<table border="1">
		<tr>
			<td>판매등록자 정보</td>
		</tr>
		<tr>
			<td>${ovo.id}&nbsp;${ovo.name}&nbsp;${ovo.team}&nbsp;${ovo.auth}</td>
		</tr>
		<tr>
			<td>판매 제품 정보</td>
		</tr>
		<tr>
			<td>${ovo.procode}&nbsp;${ovo.proname}&nbsp;${ovo.proamount}개</td>
		</tr>
		<tr>
			<td>가격 정보</td>
		</tr>
		<tr>
			<td>수익 : ${ovo.profit}&nbsp;판매 수당 : ${ovo.allowance}</td>
		</tr>
		<tr>
			<td>구매자 정보</td>
		</tr>
		<tr>
			<td>고객명 : ${ovo.customer}&nbsp;고객 주소 : ${ovo.address}</td>
		</tr>
	</table>
			<c:if test="${ovo.checks!='1'&&(ovo.empno==memberInfo.empno||authpage!='ROLE_EMPLOYEE')}"><button onclick="javascript:morders('${ovo.id}')">수정</button></c:if>
			<c:if test="${ovo.checks!='1'&&(ovo.empno==memberInfo.empno||authpage!='ROLE_EMPLOYEE')}"><button onclick="javascript:dorders('${ovo.id}')">취소</button></c:if>
			<c:if test="${ovo.checks!='1'&&authpage!='ROLE_EMPLOYEE'}"><button onclick="javascript:corders('${ovo.id}')">판매승인</button></c:if>
			<button onclick="javascript:jump('${ovo.checks}')">목록</button>
	</body>
</html>