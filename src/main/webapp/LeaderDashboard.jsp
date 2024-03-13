<%@ page import="com.khoadev.ManagementDemo.model.User" %><%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 21/12/2023
  Time: 13:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Leader Dashboard</title>
</head>
<body>
<%--<h1>Welcome, <%= ((User)session.getAttribute("user")).getEmail() %> (Leader)</h1>--%>
<h1>Welcome, (Leader)</h1>

<ul>
    <li><a href="ManageTasks.jsp">Manage Tasks</a></li>
    <li><a href="ViewTasks.jsp">View Tasks</a></li>
</ul>

<p><a href="LogoutServlet">Logout</a></p>
</body>
</html>
