<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Grade Input</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }
        
        h2 {
            margin-top: 20px;
            text-align: center;
        }

        form {
            background-color: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            margin: 20px auto;
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 3px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4caf50;
            color: white;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .error {
            color: red;
        }
    </style>
    <script>
        function validateForm() {
            var sid = document.getElementById("sid").value;
            var subid = document.getElementById("subid").value;

            if (sid.trim() == "" || subid.trim() == "") {
                document.getElementById("error-msg").innerHTML = "Please enter both Student ID and Subject ID.";
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <h2>Enter Student ID and Subject ID</h2>
    <form action="grade" method="post" onsubmit="return validateForm()">
        <label for="sid">Student ID:</label>
        <input type="text" id="sid" name="stId">
        
        <label for="subid">Subject ID:</label>
        <input type="text" id="subid" name="subId">
        
        <input type="submit" value="Submit">
        <p id="error-msg" class="error"></p>
    </form>
</body>
</html>
