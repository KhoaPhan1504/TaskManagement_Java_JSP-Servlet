<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 10/01/2024
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Forgot Password</title>
</head>
<body>
    <h1>Forgot Password</h1>
    <form >
        <table border="0" width="35%" align="center">
            <caption><h2>Enter details</h2></caption>
            <tr>
                <td width="50%">Enter new password </td>
                <td><input type="text" name="recipient" size="50"/></td>
            </tr>
            <tr>
                <td>Re-confirm new password </td>
                <td><input type="text" name="subject" size="50"/></td>
            </tr>

            <tr>
                <td colspan="2" align="center"><input type="submit" value="Send"/></td>
            </tr>
        </table>

    </form>
</body>
</html>
