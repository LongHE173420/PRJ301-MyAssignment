<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Timetable</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 20px auto;
        }

        form input[type="text"],
        form input[type="date"],
        form input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        form input[type="submit"] {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        form input[type="submit"]:hover {
            background-color: #45a049;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .date-column {
            color: blue;
            background-color: white;
        }
    </style>
</head>
<body>
<form action="timetable" method="POST">
    <label for="id">ID:</label>
    <input type="text" value="${param.id}" name="id" id="id"/><br/>
    
    <label for="from">From:</label>
    <input type="date" name="from" value="${requestScope.from}" id="from"/>
    
    <label for="to">To:</label>
    <input type="date" name="to" value="${requestScope.to}" id="to"/><br/>
    
    <input type="submit" value="View">
</form>
<div>Lecturer: ${requestScope.lecturer.lname}</div>
<table>
    <tr>
        <th></th>
        <c:forEach items="${requestScope.dates}" var="d">
            <th class="date-column">
                <fmt:formatDate pattern="EEE, dd/MM/yyyy" value="${d}" />
            </th>
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
