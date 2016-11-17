<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
		<div align="center">
		<H2>SCHEDULE</H2>
		<HR>
	   <form method=post action="/erp/schedule/insert">
			<input type=text name=year size=2 value="${currentYear}">년
			<input type=text name=month size=2 value="${currentMonth+1}">월
			<input type=text name=day size=2 value="${currentDate}">일
			내용 : <input type="text" name="contents"> 
			<input type=hidden name=empno value="${empno}">
			<input type=submit value="추가">
		</form> 
	</div>
	<br>
	   <br>
	   <br>
	   <div align="center">
      	<table>
	         <tr>
	            <td align="left" width="200">
	              <a href="/erp/schedule/calendarForm?year=${year-1}&month=${month}">◀</a>
	               ${year}년 <a href="/erp/schedule/calendarForm?year=${year+1}&month=${month}">▶</a>
	            </td>
	            <td align=center width=300>
	               <a href="/erp/schedule/calendarForm?year=${year}&month=${month-1}">◀</a>
	               ${month+1}월 <a href="/erp/schedule/calendarForm?year=${year}&month=${month+1}">▶</a>
	            </td>
	            <td align=right width=200>오늘▶${currentYear}-${currentMonth+1}-${currentDate}◀</td>
	         </tr>
      	</table>
      	<table border=1 style="border-collapse: collapse;" class="table-condensed table-bordered table-striped">
         <!-- 달력 부분 --> 
         <tr style="text-align: center;">
         
               <th width=100 style="color:red; text-align: center;">일</th>
               <!-- 일=1 -->
               <th width=100 style="text-align: center;">월</th>
               <!-- 월=2 -->
               <th width=100 style="text-align: center;">화</th>
               <!-- 화=3 -->
               <th width=100 style="text-align: center;">수</th>
               <!-- 수=4 -->
               <th width=100 style="text-align: center;">목</th>
               <!-- 목=5 -->
               <th width=100 style="text-align: center;">금</th>
               <!-- 금=6 -->
               <th width=100 style="color:blue; text-align: center;">토</th>
               <!-- 토=7 -->
         </tr>
         
         <tr height=80>
	            <c:set var="br" value="0" />
	      
	            <c:forEach var="i" begin="1" end="${startDay-1}">
	               <td>&nbsp;</td>
	               <c:set var="br" value="${br+1}" />
	               <c:if test="${br == 7}">
	                  <br>
	               </c:if>
	            </c:forEach>
        
           
            	<c:forEach var="a" begin="1" end="${end}">
            	  <c:if test="${(br%7) == 0 && a != end }">
            		<tr height=80>
               	   </c:if>
               		<td style="vertical-align: top;">
			              <c:if test="${br==6 || br==13 || br==20 || br==27 || br==34}">
			               		<font style="color:blue">${a}</font>
			              </c:if>
		                  <c:if test="${br==0 || br==7 || br==14 || br==21 || br==28 || br==35}">
		                  		<font style="color:red">${a}</font>
		                  </c:if>
		                  <c:if test="${br!=0 && br!=7 && br!=14 && br!=21 && br!=28 && br!=35 && br!=6 && br!=13 && br!=20 && br!=27 && br!=34}">
		                  		<font style="color:black">${a}</font>
		                  </c:if>
		                  
			   			
			                 <form action="/erp/schedule/delete" method="post">
			                 <c:forEach var="vo" items="${vo}">
			                     <c:if test="${year == vo.year && (month+1) == vo.month && a == vo.day}">
			                    	
			                        <c:out value="${vo.contents}"></c:out>
			                        	<br>
			                              <div class="tooltip-demo">
			                              <input type="hidden" name="contents" value="${vo.contents}">
			                              <input type="hidden" name="day" value="${vo.day}">
			                              <input type="hidden" name="year" value="${vo.year}">
			                              <input type="hidden" name="month" value="${vo.month}">
			                              <input type="hidden" name="empno" value="${vo.empno}">
			                              <button type="submit" style="height: 20px" class="btn btn-default" data-toggle="tooltip"  data-placement="left" title="삭제하려면 클릭하시오." >삭제</button>
			                              </div>
			                  		
			                     </c:if>
			                     </c:forEach>
			                  </form>
		
               		 <c:set var="br" value="${br+1}" />
                 </td>  
             </c:forEach>
            </tr>
      
      </table>
      <br>
      <br>      
      <br>
  </div>
    <script>
    // tooltip demo
    $('.tooltip-demo').tooltip({
        selector: "[data-toggle=tooltip]",
        container: "body"
    })
    // popover demo
    $("[data-toggle=popover]")
        .popover()
    </script>
  
</body>
</html>