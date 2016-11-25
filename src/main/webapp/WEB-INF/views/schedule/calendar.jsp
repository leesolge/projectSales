<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>

</head>
<body><br>
<div class="w3-container">
	<!-- Input Form -->
	<div class="w3-container w3-margin-bottom">
		<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding">
			<form method=post action="/erp/schedule/insert">
				<select name="year">
					<option class="w3-text-red" value="${currentYear}" selected>${currentYear}</option>
					<c:forEach var="year" begin="2016" end="2030">
					<option value="${year}">${year}</option>
					</c:forEach>
				</select>
				<select name="month">
					<option class="w3-text-red" value="${currentMonth+1}" selected>${currentMonth+1}</option>
					<c:forEach var="month" begin="0" end="11">
					<option value="${month+1}">${month+1}</option>
					</c:forEach>
				</select>
				<select name="day">
					<option class="w3-text-red" value="${currentDate}" selected>${currentDate}</option>
					<c:forEach var="day" begin="1" end="31">
					<option value="${day}">${day}</option>
					</c:forEach>
				</select>
				<input type="text" size="10" name="title" placeholder="TIME">
				<br>
				<input type="text" size="27" name="contents" placeholder="CONTENTS"> 
				<input type=hidden name=empno value="${empno}"> 
				<input type=submit value="ADD">
			</form>
		</div>
	</div>
	
	<div class="w3-row-padding w3-margin-bottom">
		<!-- Calendar -->
		<div class="w3-half">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" style="min-height: 300px;">
				<table class="w3-table w3-centered">
					<tr>
						<td align="center">
							<a href="/erp/schedule/calendarForm?year=${year-1}&month=${month}">
								<i class="fa fa-caret-square-o-left"></i>
							</a>
							<b>${year}년</b>
							<a href="/erp/schedule/calendarForm?year=${year+1}&month=${month}">
								<i class="fa fa-caret-square-o-right"></i>
							</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="/erp/schedule/calendarForm?year=${year}&month=${month-1}">
								<i class="fa fa-caret-square-o-left"></i>
							</a> 
							<b>${month+1}월</b>
							<a href="/erp/schedule/calendarForm?year=${year}&month=${month+1}">
								<i class="fa fa-caret-square-o-right"></i>
							</a>
						</td>
					</tr>
				</table>
				<table class="w3-table">
					<tr>
						<th class="w3-text-red">일</th>
						<th>월</th>
						<th>화</th>
						<th>수</th>
						<th>목</th>
						<th>금</th>
						<th class="w3-text-blue">토</th>
					</tr>
					<c:set var="br" value="0" />
					<c:if test="${startDay <=7 }">
						<c:forEach var="i" begin="1" end="${startDay-1}">
							<td height=40>&nbsp;</td>
							<c:set var="br" value="${br+1}" />
						</c:forEach>
					</c:if>
					<c:forEach var="a" begin="1" end="${end}">
						<c:if test="${(br%7) == 0}">
							<tr height=40>
						</c:if>
						<td>
							<c:if test="${br==6 || br==13 || br==20 || br==27 || br==34}">
								<a href="/erp/schedule/chooseday?year=${year}&month=${month}&day=${a}">
								<font color="#004d66" size="3">${a}</font></a>
							</c:if> 
							<c:if test="${br==0 || br==7 || br==14 || br==21 || br==28 || br==35}">
								<a href="/erp/schedule/chooseday?year=${year}&month=${month}&day=${a}">
								<font style="color: #cc3300">${a}</font></a>
							</c:if> 
							<c:if test="${br!=0 && br!=7 && br!=14 && br!=21 && br!=28 && br!=35 && br!=6 && br!=13 && br!=20 && br!=27 && br!=34}">
								<a href="/erp/schedule/chooseday?year=${year}&month=${month}&day=${a}">
								<font style="color: black">${a}</font></a>
							</c:if> 
							<c:set var="br" value="${br+1}" />
						</td>
					</c:forEach>
				</table>
			</div>
			<div class="w3-hide-large w3-hide-medium"><br></div>
		</div>
		
		<!-- Schedule -->		
		<div class="w3-half">
			<div class="w3-card-2 w3-white w3-round-large w3-centered w3-padding" style="min-height: 300px;">
				<h3 align="center"><b>${month1} . ${day}</b></h3>
				<c:if test="${fn:length(vo) == 0}">
					<div class="w3-center w3-margin-top">
						<font color="#435e9b"><b>해당일자의 일정</b></font>
						<b>이 등록되어 있지 않습니다.</b><br><br>
						<img src="/erp/resources/image/noschedule.png">
					</div>
					
				</c:if> 
				<c:if test="${fn:length(vo) != 0}"> 
					<h2 align="left"><b>${count} Schedule</b></h2>				
					<c:forEach var="vo" items="${vo}">
						<c:out value="${vo.title}"/>
						<c:out value="${vo.contents}  "/>
						<b>작성한 날짜 : <fmt:formatDate value="${vo.regDate}" pattern="yyyy-MM-dd" /></b>
						<form action="/erp/schedule/delete" method="post">
							<div class="tooltip-demo">
								<input type="hidden" name="contents" value="${vo.contents}">
								<input type="hidden" name="day" value="${vo.day}"> 
								<input type="hidden" name="year" value="${vo.year}"> 
								<input type="hidden" name="month" value="${vo.month}"> 
								<input type="hidden" name="empno" value="${vo.empno}"> 
								<input type="hidden" name="num" value="${vo.num}"> 
								<button type="submit" style="height: 20px" data-toggle="tooltip" data-placement="left" title="삭제하려면 클릭하시오.">삭제</button>
							</div>
						</form>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</div>
</body>
</html>