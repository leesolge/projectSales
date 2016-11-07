<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import ="java.util.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결과창</title>
</head>
<body>
 
<table>
     <tr>
         <td width="50px" align="center">id</td>
         <td align="center">email</td>
         <td align="center">phone</td>
     </tr>

     <!-- result는 contoller의 addObject로 부터 가져온다. -->
     <c:forEach items="${result}" var="member">
         <tr>
             <td>${member.empno}</td>
             <td>${member.name}</td>
             <td>${member.gender}</td>    
         </tr>
     </c:forEach>
 </table>
 
 </body>
</html>