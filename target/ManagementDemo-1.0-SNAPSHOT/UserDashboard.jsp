<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 20/12/2023
  Time: 10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Client</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>
    <h1>Welcome, ${sessionScope.lastName} (Client)</h1>

    <p>Your task:</p>

    <ul>
        <li>Task 1</li>
        <li>Task 2</li>
    </ul>

    <p>Task Actions:</p>

    <p><a href="LogoutServlet">Logout</a></p>
</body>
</html>
