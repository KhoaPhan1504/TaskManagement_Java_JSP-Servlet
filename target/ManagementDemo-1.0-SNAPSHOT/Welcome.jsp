<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 18/12/2023
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>WELCOME</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <h2>Welcome to website !</h2>

    <p>Hello, <%= request.getSession().getAttribute("fistName" + "lastName")%>! You have successfully sign in</p>

    <p><a href="LogoutServlet">Logout</a></p>
</body>
</html>
