<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
	<head>
		<title>Title</title>
		<script>
		function jumpPage(pn){
			var jumping = document.viewList;
			jumping.pageNum.value=pn;
			jumping.submit();
		}
		
		function modify(pn){
			var modione = document.modifyOne;
			modione.id.value=pn;
			modione.submit();
		}
		
		function deletes(pn){
			var delone = document.deleteOne;
			delone.id.value=pn;
			if(confirm("해당 내역을 정말 지우시겠습니까?")==true){
				delone.submit();
			}else{
				return;
			}
		}
		</script>
	</head>
	<body><br>
		<form name="deleteOne" action="/erp/ledger/delete" method="post">
			<input name="id" type="hidden" value="0">
		</form>
		<form name="modifyOne" action="/erp/ledger/modifyForm" method="post">
			<input name="id" type="hidden" value="0">
		</form>
		<div class="w3-container">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
				<!-- Title -->
				<div class="w3-row">
					<h3><i class="fa fa-book" aria-hidden="true"></i> 회계장부</h3>
				</div>
				<form name="viewList" action="/erp/ledger/list" method="post">
					<input name="pageNum" type="hidden" value="1">
					<div class="w3-container w3-center">
						<table>
							<tr>
								<th style="width: 130px">
								분류 : 
								<select name="sort" class="w3-round-large">
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
								</select>
								</th>
								<th>
									기간 : 
									<input class="w3-round-large" type="date" id="start" name="startdate" value=${paging.start_date }> ~ 
									<input class="w3-round-large" type="date" id="end" name="enddate"  value=${paging.end_date } >
								</th>
								<th>
									<button type="submit" class="w3-round-large w3-indigo w3-border w3-border-indigo"><i class="fa fa-search"></i></button>
								</th>
							</tr>
						</table>
					</div>
				</form><br>
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<tr class="w3-indigo">
						<th style="width: 80px;">등록일</th>
						<th style="width: 130px;">등록자</th>
						<th style="width: 130px;">내용</th>
						<th style="width: 100px;">수입</th>
						<th style="width: 100px;">지출</th>
						<th style="width: 150px;">누계</th>
						<th colspan="2">비고</th>
					</tr>
					<c:forEach var="list" items="${list}">
					<tr>
						<td><fmt:formatDate value="${list.regdate}" pattern="yy-MM-dd"/></td>
						<td class="w3-left"><span title="${list.name}(${list.empno})">${list.name}(${list.empno})</span></td>
						<td style="text-align: left;">${list.content}</td>
						<td class="w3-text-blue" style="text-align: right;">
							<c:if test="${list.sort=='수입'}"><fmt:formatNumber value="${list.amount}" pattern="#,###" /></c:if>
							<c:if test="${list.sort!='수입'}">-</c:if>
						</td>
						<td class="w3-text-red" style="text-align: right;">
							<c:if test="${list.sort=='지출'}"><fmt:formatNumber value="${list.amount}" pattern="#,###" /></c:if>
							<c:if test="${list.sort!='지출'}">-</c:if>
						</td>
						<td style="text-align: right;"><b>₩&nbsp;<fmt:formatNumber value="${list.money}" pattern="#,###" /></b></td>
						<td style="text-align: left;"><span title="${list.etc}">${list.etc}</span></td>
						<td style="text-align: right;">
						<c:if test="${(list.enable=='1'&&empno==list.empno)||(list.enable=='1'&&memberInfo.auth=='ROLE_ADMIN')}"><a onclick="modify('${list.id}')"><i class="fa fa-pencil-square w3-hover-blue w3-large"></i></a></c:if>
						&nbsp;&nbsp;&nbsp;
						<c:if test="${(list.enable=='1'&&empno==list.empno)||(list.enable=='1'&&memberInfo.auth=='ROLE_ADMIN')}"><a onclick="deletes('${list.id}')"><i class="fa fa-window-close w3-hover-red w3-large"></i></a></c:if>
						</td>
					</tr>
					</c:forEach>
				</table><br>
				<button class="w3-btn w3-border w3-text-indigo w3-border-indigo w3-round-large w3-small w3-white w3-right" onclick="location.href='/erp/ledger/registForm'">등록</button>
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
						<tr>
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
	<br>
</body>
</html>