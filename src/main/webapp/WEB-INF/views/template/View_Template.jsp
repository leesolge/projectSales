<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="tiles"  uri="http://tiles.apache.org/tags-tiles"%>
  
<!DOCTYPE HTML>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title><tiles:getAsString name="title" /></title>
    </head>
    <body>

    <table border=1 cellpadding=0 cellspacing=1 width="100%">
        <tr height=100 valign="middle" >
            <td colspan=2>
            <tiles:insertAttribute name="header"/></td>
        </tr>
        <tr height="670" >
            <td width="15%" valign="top">
            <tiles:insertAttribute name="menu"/></td>
            <td width="85%" align="center">
            <tiles:insertAttribute name="body"/></td>
        </tr>
        <tr>
            <td colspan=2>
            <tiles:insertAttribute name="footer"/></td>
        </tr>
    </table>
    </body>
</html>