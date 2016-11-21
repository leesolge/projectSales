<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
ul {
	list-style-type: none;
}

body {
	font-family: Verdana, sans-serif;
}

.noschedule {
    float: left;
    width: 593px;
    height: 465px;
    background: url(/erp/resources/image/bg_noschedule.png) no-repeat center 160px;
}

/* Month header */
.month {
	padding: 30px 20px;
	width: 100%;
	background: #004d66;
}

/* Month list */
.month ul {
	margin: 0;
	padding: 0;
}

.month ul li {
	color: white;
	font-size: 20px;
	text-transform: uppercase;
	letter-spacing: 3px;
}

/* Previous button inside month header */
.month .prev {
	float: left;
	padding-top: 10px;
}

/* Next button */
.month .next {
	float: right;
	padding-top: 10px;
}

/* Weekdays (Mon-Sun) */
.weekdays {
	margin: 0;
	width: 100%; padding : 10px 0;
	background-color: #ddd;
	padding: 10px 0;
}

.weekdays li {
	display: inline-block;
	width: 13.6%;
	color: #666;
	text-align: center;
}

/* Days (1-31) */
.days {
	padding: 10px 0;
	background: #eee;
	margin: 0;
}

.days li {
	list-style-type: none;
	display: inline-block;
	width: 13.6%;
	text-align: center;
	margin-bottom: 5px;
	font-size: 12px;
	color: #777;
}

/* Highlight the "current" day */
.days li .active {
	padding: 5px;
	background: #1abc9c;
	color: white !important
}

select {
	width: 30%;
	padding: 16px 20px;
	border: none;
	border-radius: 4px;
	background-color: #f1f1f1;
}

input[type=submit] {
	background-color: #4CAF50;
	border: none;
	color: white;
	padding: 16px 20px;
	text-decoration: none;
	border-radius: 4px;
	margin: 4px 2px;
	cursor: pointer;
}

input[type=text] {
	width: 65%;
	padding: 16px 20px;
	border: none;
	border-radius: 4px;
	background-color: #f1f1f1;
}

</style>
</head>
<body>
	<div style="float: left; width: 50%">
		<div class="month">
			<ul>
				<li><span style="font-size: 18px">${currentYear}</span></li>
			</ul>
			<HR>
			<form method=post action="/erp/schedule/insert">

				<select name="year">
					<option class="w3-text-red" value="${currentYear}" selected>${currentYear}</option>
					<c:forEach var="year" begin="2016" end="2030">
						<option value="${year}">${year}</option>
					</c:forEach>
				</select> <select name="month">
					<option class="w3-text-red" value="${currentMonth+1}" selected>${currentMonth+1}</option>
					<c:forEach var="month" begin="0" end="11">
						<option value="${month+1}">${month+1}</option>
					</c:forEach>
				</select> <select name="day">
					<option class="w3-text-red" value="${currentDate}" selected>${currentDate}</option>
					<c:forEach var="day" begin="1" end="31">
						<option value="${day}">${day}</option>
					</c:forEach>
				</select> <br> <br> <br> <input type="text" name="contents"
					placeholder="CONTENTS"> <input type=hidden name=empno
					value="${empno}"> <input type=submit value="ADD">
			</form>

		</div>

		<table class="weekdays">
			<tr>
				<td align="center" width="100"><a style="font-size: 18px"
					href="/erp/schedule/calendarForm?year=${year-1}&month=${month}"><b>&lt;
					</b></a> <font color="#004d66" size="3"><b>${year}년</b></font><a
					href="/erp/schedule/calendarForm?year=${year+1}&month=${month}"><b>
							&gt;</b></a></td>
				<td align=center width=100><a
					href="/erp/schedule/calendarForm?year=${year}&month=${month-1}"><b>&lt;
					</b></a> <font color="#004d66" size="3"><b>${month+1}월</b></font><a
					href="/erp/schedule/calendarForm?year=${year}&month=${month+1}"><b>
							&gt;</b></a></td>
			</tr>
		</table>
		<table class="weekdays" style="border-collapse: collapse;"
			class="table-condensed table-bordered table-striped">
			<!-- 달력 부분 -->
			<tr class="weekdays">
				<th style="color: #cc3300; text-align: center;">일</th>
				<th style="text-align: center;">월</th>
				<th style="text-align: center;">화</th>
				<th style="text-align: center;">수</th>
				<th style="text-align: center;">목</th>
				<th style="text-align: center;">금</th>
				<th style="color: #004d99; text-align: center;">토</th>

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
				<td style="vertical-align: top;"><c:if
						test="${br==6 || br==13 || br==20 || br==27 || br==34}">
						<b><a
							href="/erp/schedule/chooseday?year=${year}&month=${month}&day=${a}"><font
								color="#004d66" size="3">${a}</font></a></b>
					</c:if> <c:if
						test="${br==0 || br==7 || br==14 || br==21 || br==28 || br==35}">
						<b><a
							href="/erp/schedule/chooseday?year=${year}&month=${month}&day=${a}"><font
								style="color: #cc3300">${a}</font></a></b>
					</c:if> <c:if
						test="${br!=0 && br!=7 && br!=14 && br!=21 && br!=28 && br!=35 && br!=6 && br!=13 && br!=20 && br!=27 && br!=34}">
						<b><a
							href="/erp/schedule/chooseday?year=${year}&month=${month}&day=${a}"><font
								style="color: black">${a}</font></a></b>
					</c:if> <c:set var="br" value="${br+1}" /></td>
			</c:forEach>

		</table>
	</div>

	<div style="float: left; width: 50%">
		<hr>
		<br> 
	<c:if test="${fn:length(vo)==0}">
		<div class="noschedule">
		<font color="#435e9b"><b>해당일자의 일정이</b></font>
		<b>등록되어 있지 않습니다.</b>
		</div>
	</c:if> 
	<c:if test="${vo != null}"> 
		<c:forEach var="vo" items="${vo}">
			<c:out value="${vo.contents}"></c:out>
			<form action="/erp/schedule/delete" method="post">
				<div class="tooltip-demo">
					<input type="hidden" name="contents" value="${vo.contents}">
					<input type="hidden" name="day" value="${vo.day}"> 
					<input type="hidden" name="year" value="${vo.year}"> 
					<input type="hidden" name="month" value="${vo.month}"> 
					<input type="hidden" name="empno" value="${vo.empno}"> 
					<input type="hidden" name="num" value="${vo.num}"> 
					<button type="submit" style="height: 20px" data-toggle="tooltip"
						data-placement="left" title="삭제하려면 클릭하시오.">삭제</button>
				</div>
			</form>
		</c:forEach>
	</c:if>
	</div>

	<br>
	<br>
	<br>

	<script>
		// tooltip demo
		$('.tooltip-demo').tooltip({
			selector : "[data-toggle=tooltip]",
			container : "body"
		})
		// popover demo
		$("[data-toggle=popover]").popover()
	</script>

</body>
</html>