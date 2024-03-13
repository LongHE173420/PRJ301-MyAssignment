<%-- 
    Document   : searchLecturer
    Created on : Mar 13, 2024, 10:38:05 PM
    Author     : Admin
--%>

<%-- 
    Document   : lecturerDetail
    Created on : Mar 13, 2024, 10:38:05 PM
    Author     : Admin
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>User Information</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container {
                max-width: 600px;
                margin: 50px auto;
                background-color: #fff;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                display: flex;
                flex-direction: column;
            }

            label {
                margin-bottom: 8px;
                font-weight: bold;
            }

            div {
                display: flex;
                align-items: baseline;
                margin-bottom: 10px;
            }

            p {
                margin: 0;
                margin-left: 10px;
            }

            img {
                max-width: 100%;
                height: auto;
                border-radius: 4px;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>

        <div class="container">
            <h2>Lecturer Detail</h2>
            <form id="frmsearch" action="searchLecturer" method="post">
                Lecturer ID: <input type="text" name="lid" value="${param.lid}">
                <input type="submit" value="Search">
                <h2>${requestScope.mess}</h2>
            </form>

            

            <div>
                <label for="code">Code:</label>
                <p id="code"><c:out value="${lecturer.lcode}" /></p>
            </div>

            <div>
                <label for="fullName">Full Name:</label>
                <p id="fullName"><c:out value="${lecturer.lname}" /></p>
            </div>

            <div>
                <label for="email">Gender:</label>
                <c:if test="${lecturer.lgender == 'true'}">
                    <p id="gender">Male</p>
                </c:if>
                    
                <c:if test="${lecturer.lgender == 'false'}">
                    <p id="gender">Female</p>
                </c:if>
            </div>
            <div>
                <label for="mail">Email:</label>
                <p id="mail"><c:out value="${lecturer.lmail}" /></p>
            </div>
            <div>
                <label for="phone">Phone:</label>
                <p id="phone"><c:out value="${lecturer.lphone}" /></p>
            </div>
        </div>
            
                
    </body>
</html>


