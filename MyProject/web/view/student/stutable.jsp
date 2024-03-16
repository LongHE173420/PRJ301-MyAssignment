<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Student Timetable Input</title>
    </head>
   <body>
        <form action="stutimetable" method="POST">
            ID: <input type="text" value="${param.id}" name="id"/><br/>
            From: <input type="date" name="from" value="${requestScope.from}"/> To:
            <input type="date" name="to" value="${requestScope.to}"/><br/>
           
            <input type="submit" value="View"/>
        </form>
    </body>
</html>
