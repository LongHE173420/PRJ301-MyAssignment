<%-- 
    Document   : searchStudent
    Created on : Mar 14, 2024, 10:09:33 AM
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
            <h2>Student Detail</h2>
            <form id="frmsearch" action="searchStudent" method="post">
                Student Code: <input type="text" name="scode" value="${param.scode}">
                <input type="submit" value="Search">
                <h2>${requestScope.mess}</h2>
            </form>

            

            <div>
                <label for="name">Full Name: </label>
                <p id="name"><c:out value="${student.sname}" /></p>
            </div>

            <div>
                <label for="DOB">DOB: </label>
                <p id="DOB"><c:out value="${student.sdob}" /></p>
            </div>

            <div>
                <label for="gender">Gender: </label>
                <c:if test="${student.sgender == 'true'}">
                    <p id="gender">Male</p>
                </c:if>
                    
                <c:if test="${student.sgender == 'false'}">
                    <p id="gender">Female</p>
                </c:if>
            </div>
            <div>
                <label for="mail">Email: </label>
                <p id="mail"><c:out value="${student.smail}" /></p>
            </div>
            <div>
                <label for="phone">Phone: </label>
                <p id="phone"><c:out value="${student.sphone}" /></p>
            </div>
             <div>
                <label for="address">Address: </label>
                <p id="address"><c:out value="${student.saddress}" /></p>
            </div>
        </div>
            
                
    </body>
</html>
