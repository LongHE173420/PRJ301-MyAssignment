<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Student Attendance</title>
</head>
<body>
    <div>Student: ${requestScope.student.sname}</div>

    <table border="1px">
        <tr>
            <td></td>
            <c:forEach items="${requestScope.dates}" var="d">
                <td>
                    (<fmt:formatDate pattern="E" value="${d}" />)
                    ${d}
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
                                ${les.group.gname} - ${les.group.subject.subname}<br/>
                                <c:forEach items="${requestScope.attendance}" var="attendance">
                                    <c:if test="${attendance.lessonId eq les.leid}">
                                        <c:choose>
                                            <c:when test="${attendance.present}">
                                                Attended
                                            </c:when>
                                            <c:otherwise>
                                                Absent
                                            </c:otherwise>
                                        </c:choose>
                                    </c:if>
                                </c:forEach>
                                ${les.lecturer.lcode}
                            </c:if>
                        </c:forEach>
                    </td>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
