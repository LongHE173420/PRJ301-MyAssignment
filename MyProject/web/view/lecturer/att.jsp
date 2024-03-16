<%-- 
    Document   : att
    Created on : Mar 1, 2024, 1:54:23 PM
    Author     : sonnt
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Attendance Form</title>
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
            width: 100%; /* Form chiếm toàn bộ chiều rộng của màn hình */
            font-size: 14px; /* Kích thước chữ */
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

        input[type="radio"] {
            margin-right: 5px;
        }

        input[type="text"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-top: 20px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        span.absent {
            color: red;
        }

        span.attended {
            color: green;
        }
    </style>
</head>
<body>
<form action="att" method="POST">
    <input type="hidden" name="id" value="${requestScope.lession.leid}" />

    <table>
        <tr>
            <th>Id</th>
            <th>Name</th>
            <th>Presented</th>
            <th>Note</th>
            <th>Time</th>
        </tr>
        <c:forEach items="${requestScope.atts}" var="a">
            <tr>
                <td>${a.student.sid}</td>
                <td>${a.student.sname}</td>
                <td>
                    <input type="radio" id="absent${a.student.sid}" name="present${a.student.sid}" value="no" ${!a.present ? "checked" : ""}/>
                    <label for="absent${a.student.sid}" class="absent">Absent</label>
                    <input type="radio" id="attended${a.student.sid}" name="present${a.student.sid}" value="yes" ${a.present ? "checked" : ""}/>
                    <label for="attended${a.student.sid}" class="attended">Attended</label>
                </td>
                <td>
                    <input type="text" name="description${a.student.sid}" value="${a.description}"/>
                </td>
                <td>${a.captureTime}</td>
            </tr>    
        </c:forEach>
    </table>
    <input type="submit" value="Save"/>
</form>
</body>
</html>
