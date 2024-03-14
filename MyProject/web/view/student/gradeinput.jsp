<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Input</title>
</head>
<body>
    <h2>Enter Student ID and Subject ID</h2>
    <form action="grade" method="post">
        <label for="sid">Student ID:</label>
        <input type="text" id="sid" name="stId"><br><br>
        
        <label for="subid">Subject ID:</label>
        <input type="text" id="subid" name="subId"><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>
