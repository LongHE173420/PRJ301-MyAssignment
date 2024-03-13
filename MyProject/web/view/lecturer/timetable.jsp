<%-- 
    Document   : timetable
    Created on : Mar 2, 2024, 9:06:10 PM
    Author     : Admin
--%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <form action="timetable" method="POST">
            ID: <input type="text" value="${param.id}" name="id"/><br/>
            From: <input type="date" name="from" value="${requestScope.from}"/> To:
            <input type="date" name="to" value="${requestScope.to}"/><br/>          
            <input type="submit" value="View"/>
        </form>
    </body>
</html>
