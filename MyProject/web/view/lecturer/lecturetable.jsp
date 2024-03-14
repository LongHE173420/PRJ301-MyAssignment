
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .date-column {
                color: blue; 
                background-color: white; 
            }
        </style>
    </head>
    <body>
        <form action="timetable" method="POST">
            ID: <input type="text" value="${param.id}" name="id"/><br/>
            From: <input type="date" name="from" value="${requestScope.from}"/> To:
            <input type="date" name="to" value="${requestScope.to}"/><br/>          
            <input type="submit" value="View"/>
        </form>
        <div>Lecturer: ${requestScope.lecturer.lname}</div>
        <table border="1px">
            <tr>
                <td></td>
                <c:forEach items="${requestScope.dates}" var="d">
                    <td class="date-column">
                        <fmt:formatDate pattern="EEE, dd/MM/yyyy" value="${d}" />
                    </td>
                </c:forEach>
            </tr>

            <c:forEach items="${requestScope.slots}" var="slot">
                <tr>
                    <td>${slot.name}</td>
                    <c:forEach items="${requestScope.dates}" var="d">
                        <td>
                            <c:forEach items="${requestScope.lessions}" var="les">
                                <c:if test="${les.date eq d and les.timeSlot.id eq slot.id}">
                                    ${les.group.gname} - ${les.group.subject.subname}
                                    <a href="att?id=${les.leid}">
                                        <c:if test="${les.isAttended}">Edit</c:if>
                                        <c:if test="${!les.isAttended}">Take</c:if>
                                    </a>
                                </c:if>
                            </c:forEach>
                        </td>
                    </c:forEach>
                </tr>
            </c:forEach>
        </table> 
    </body>
</html>
