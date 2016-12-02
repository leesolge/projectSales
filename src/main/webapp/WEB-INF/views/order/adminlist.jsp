<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
	function jumpPage(pages){
		var paging = document.search;
		paging.pageNum.value = pages;
		paging.submit();
	}
	</script>
<head>
	<title>Title</title>
</head>
	
<body><br>
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
		<div class="w3-container">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
				<div class="w3-row">
					<h3><i class="fa fa-bullhorn" aria-hidden="true"></i> 판매목록</h3>
				</div>
				<div class="w3-container w3-center">
				<form action="/erp/order/list" name="search" method="get">
					<input name="pageNum" type="hidden" value="1">
					<input name="authpage" type="hidden" value="${authpage}">
					<table>
						<tr>
							<th>
							<c:if test="${mlist!=null}">
								<select class="w3-round-large" name="emp">
									<option value="" disabled selected>팀/사원 선택</option>
									<c:forEach var="mlist" items="${mlist}">
										<option value="${mlist.empno}">${mlist.team}${mlist.auth} - ${mlist.name}(${mlist.empno})</option>
									</c:forEach>
								</select>
							</c:if>
								<select class="w3-round-large" name="product">				
									<option value="" disabled selected>제품선택</option>
									<c:forEach var="plist" items="${plist}">
										<option value="${plist.procode}">${plist.procode}&nbsp;${plist.proname}</option>
									</c:forEach>
								</select>
								<select class="w3-round-large" name="checks">				
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
							</th>
						</tr>
						<tr>
							<th style="text-align: left;"><br>
								기간 : 
								<input class="w3-round-large" type="date" id="start" name="firstdate" value=${paging.start_date }> ~ 
								<input class="w3-round-large" type="date" id="end" name="seconddate"  value=${paging.end_date } >
								<button type="submit" class="w3-round-large w3-indigo w3-border w3-border-indigo"><i class="fa fa-search"></i></button>
							</th>
						</tr>
					</table><br>
				</form>
				</div>
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<tr class="w3-indigo">
						<th style="width: 80px;">날짜</th>
						<th style="width: 130px;">판매자</th>
						<th>판매물품</th>
						<th style="width: 100px;">수익</th>
						<th style="width: 100px;">판매 수당</th>
						<th style="width: 100px;">팀장 수당</th>
					</tr>
					<c:forEach var="alist" items="${alist}">
						<tr onclick="javascript:details('${alist.id}', '${alist.checks}')">
							<td><fmt:formatDate value="${alist.regdate}" pattern="yy-MM-dd" /></td>
							<td>${alist.name}(${alist.empno})</td>
							<td>${alist.proname}(${alist.procode}) x ${alist.proamount}</td>
							<td><fmt:formatNumber value="${alist.profit}" pattern="#,###" /></td>
							<td><fmt:formatNumber value="${alist.allowance}" pattern="#,###" /></td>
							<td><c:if test="${alist.manager!=null||alist.manager!='0'}"><fmt:formatNumber value="${alist.manager}" pattern="#,###" /></c:if></td>
						</tr>
					</c:forEach>
				</table><br>
				<button class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white w3-right" onclick="javascript:worders()">등록</button>
				<div class="w3-centered">
					<table class="w3-table w3-small">
						<tr>
							<td class="w3-centered">
								<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">　&laquo;</a>　</c:if>
								<c:if test="${pageNum>=3}"><a href="javascript:jumpPage('${pageNum-2}')">　${pageNum-2}</a>　</c:if>
								<c:if test="${pageNum>=2}"><a href="javascript:jumpPage('${pageNum-1}')">　${pageNum-1}</a>　</c:if>
								<font color="red">　<b>${pageNum}</b>　</font>
								<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">　${pageNum+1}</a>　</c:if>
								<c:if test="${max>=pageNum+2}"><a href="javascript:jumpPage('${pageNum+2}')">　${pageNum+2}</a>　</c:if>
								<c:if test="${max>=pageNum+1}"><a href="javascript:jumpPage('${pageNum+1}')">　&raquo;</a>　</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<script src="/erp/resources/js/moment-min.js"></script>
		<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
		<script>
			$(function() {
				var s_date = moment("${sdate}").format("YYYY-MM-DD");
				var e_date = moment("${edate}").format("YYYY-MM-DD");
				$("#start").val(s_date);
				$("#end").val(e_date);
			}); 
		</script>
	</body>
</html>