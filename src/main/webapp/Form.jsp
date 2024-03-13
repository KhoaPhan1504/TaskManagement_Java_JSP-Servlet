<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 16/01/2024
  Time: 16:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
    <h1 align="center">FORGOT PASSWORD </h1>
    <br>
    <form  action="EmailSendingServlet" method ="post">
        <table>
            <td>Enter your email id:<input type="email" name="recipient" size="50" required="required"></td>
            <td>
                <input  type="submit" value="Send"></td>
        </table>
    </form>
</body>
</html>
