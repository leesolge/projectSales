<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
	<title>Title</title>
</head>
<body><br>
	<div class="w3-container">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
				<!-- Title -->
				<div class="w3-row">
					<h3><i class="fa fa-money"></i> 월급조회</h3>
				</div>
				<form method="post" action="/erp/admin/salary">
					<input name="pageNum" type="hidden" value="1">
					<div class="w3-container w3-center">
						<table>
							<tr>
								<th>
								<select name="datevalue" class="w3-round-large">
									<c:forEach var="selection" items="${selectlist}">
										<c:if test="${datevalue==selection.datevalue}">
										<option value="${selection.datevalue}" selected="selected">${selection.viewdate}</option>
										</c:if>
										<c:if test="${datevalue!=selection.datevalue}">
										<option value="${selection.datevalue}">${selection.viewdate}</option>
										</c:if>
									</c:forEach>
								</select>
								</th>
								<th>
									<select name="emp" class="w3-round-large">
										<option value="">팀/사원 전체</option>
										<c:forEach var="mlist" items="${mlist}">
										<c:if test="${emp==mlist.empno}">
											<option selected="selected" value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
										</c:if>
										<c:if test="${emp!=mlist.empno}">
											<option value="${mlist.empno}">${mlist.empno}&nbsp;${mlist.name}&nbsp;${mlist.auth}&nbsp;${mlist.team}&nbsp;</option>
										</c:if>
										</c:forEach>
									</select>
								</th>
								<th>
									<button type="submit" class="w3-round-large w3-indigo w3-border w3-border-indigo"><i class="fa fa-search"></i></button>
								</th>
							</tr>
						</table>
					</div>
				</form><br>
				${dateview}<c:if test="${equal=='1'}">&nbsp;예정&nbsp;</c:if>월급
				<table class="w3-table w3-small w3-hoverable w3-bordered">
					<tr class="w3-indigo">
						<td style="width: 70px;">사번</td>
						<td style="width: 100px;">이름</td>
						<td>팀</td>
						<td>직급</td>
						<td>지급액</td>
						<td>판매수당</td>
						<td>관리수당</td>
						<td>소득세</td>
						<td>주민세</td>
						<td>실지급액</td>
					</tr>
				</table>
				<div style="height:280px; overflow: auto;">
					<table class="w3-table w3-small w3-hoverable w3-bordered">
						<c:forEach var="slist" items="${salarylist}">
							<tr>
							<td style="width: 70px;">${slist.empno}</td>
							<td style="text-align: left; width: 100px;"><span title="${slist.name}">${slist.name}</span></td>
							<td>${slist.team}</td>
							<td>${slist.auth}</td>
							<c:if test="${slist.salary != 0}">
								<td style="text-align: right;" class="w3-text-blue"><fmt:formatNumber value="${slist.salary}" pattern="#,###" /></td>
							</c:if>
							<c:if test="${slist.salary == 0}">
								<td style="text-align: right;">-</td>
							</c:if>
							<c:if test="${slist.allowance != 0}">
								<td style="text-align: right;" class="w3-text-blue"><fmt:formatNumber value="${slist.allowance}" pattern="#,###" /></td>
							</c:if>
							<c:if test="${slist.allowance == 0}">
								<td style="text-align: right;">-</td>
							</c:if>
							<c:if test="${slist.manager != 0}">
								<td style="text-align: right;" class="w3-text-blue"><fmt:formatNumber value="${slist.manager}" pattern="#,###" /></td>
							</c:if>
							<c:if test="${slist.manager == 0}">
								<td style="text-align: right;">-</td>
							</c:if>
							<c:if test="${slist.tax1 != 0}">
								<td style="text-align: right;" class="w3-text-red"><fmt:formatNumber value="${slist.tax1}" pattern="#,###" /></td>
							</c:if>
							<c:if test="${slist.tax1 == 0}">
								<td style="text-align: right;">-</td>
							</c:if>
							<c:if test="${slist.tax2 != 0}">
								<td style="text-align: right;" class="w3-text-red"><fmt:formatNumber value="${slist.tax2}" pattern="#,###" /></td>
							</c:if>
							<c:if test="${slist.tax2 == 0}">
								<td style="text-align: right;">-</td>
							</c:if>
								<td style="text-align: right;"><b>₩&nbsp;<fmt:formatNumber value="${slist.reals}" pattern="#,###" /></b></td>
							</tr>
						</c:forEach>
					</table>
				</div><br>
				<c:if test="${budget!='1'}">
					당월 실적
					<div style="height:200px; overflow: auto;">
						<table class="w3-table w3-small w3-hoverable w3-bordered">
							<tr class="w3-indigo">
								<td>사번</td>
								<td>이름</td>
								<td>소속</td>
								<td>판매일</td>
								<td>제품코드</td>
								<td>제품명</td>
								<td>판매수량</td>
								<td>판매수당</td>
								<td>관리수당</td>
								<td>고객명</td>
							</tr>
						</table>
						<table class="w3-table w3-small w3-hoverable w3-bordered">
							<c:forEach var="mylist" items="${mylist}">
							<tr>
								<td>${mylist.empno}</td>
								<td>${mylist.name}</td>
								<td>${mylist.team}</td>
								<td><fmt:formatDate value="${mylist.regdate}" pattern="yy-MM-dd" /></td>
								<td>${mylist.procode}</td>
								<td>${mylist.proname}</td>
								<td>${mylist.proamount}</td>
								<td><fmt:formatNumber value="${mylist.allowance}" pattern="#,###" /></td>
								<td><fmt:formatNumber value="${mylist.manager}" pattern="#,###" /></td>
								<td>${mylist.customer}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</c:if><br>
			</div>
		</div>
		<br>
	</body>
</html>