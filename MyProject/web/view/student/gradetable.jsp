<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Table</title>
    <style>
        table {
            border-collapse: collapse;
            width: 80px;
        }
        th, td {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }
        th {
            background-color: #f2f2f2;
        }
        th {
            background-color: #6B90DA; 
        }
    </style>
</head>
<body>
    <h2>Grade Table</h2>
    <table>
        <thead>
            <tr style="color: white">
                <th>Grade Item</th>
                <th>Weight</th>
                <th>Score</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="grade" items="${requestScope.grades}">
                <tr>
                    <td>${grade.eid.asid.name}</td>
                    <c:set var="percentage" value="${(grade.eid.asid.weight * 100)}" />
                    <td><c:out value="${fn:substringBefore(percentage, '.')}" />%</td>
                    <td>${grade.score}</td>
                </tr>
            </c:forEach>
            <tr>
                <td>AVERAGE</td>
                <td>${requestScope.over}</td>
                <td>
                    <c:choose>
                        <c:when test="${requestScope.over >= 5}">
                            <span style="color: green;">Passed</span>
                        </c:when>
                        <c:otherwise>
                            <span style="color: red;">Not Pass</span>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>
