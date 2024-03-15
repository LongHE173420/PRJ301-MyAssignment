<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Table</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h2>Grade Table</h2>
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Student Name</th>
                <th>Subject Name</th>
                <th>Score</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="grade" items="${requestScope.grades}">
                <tr>
                    <td>${grade.stid.sid}</td>
                    <td>${grade.stid.sname}</td>
                    <td>${grade.eid.asid.subid.subname}</td>
                    <td>${grade.overall}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
