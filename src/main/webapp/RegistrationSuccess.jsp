<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 19/12/2023
  Time: 14:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register Successfull</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <style>
        body {
            font-family: "Arial", sans-serif;
            /*background-color: coral;*/
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        .container {
            justify-content: center;
            background-color: bisque;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,1);
            overflow: hidden;
            width: 400px;
            max-width: 100%;
            padding: 20px;
        }
        h1 {
            text-align: center;
            color: crimson;
        }
        p {
            text-align: center;
            margin-top: 15px;
        }

        a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Registration Successfully!</h1>
        <p>Your account has been successfully registered.</p>
        <p style="font-weight: bold"><a href="Signin.jsp">Login</a></p>
    </div>
</body>
</html>
