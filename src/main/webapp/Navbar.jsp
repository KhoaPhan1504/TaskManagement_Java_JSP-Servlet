<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 04/01/2024
  Time: 14:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <title>Title</title>
    <link href="css/Nav.css" rel="stylesheet">
</head>
<body>
<div id="sidenav" class="sidenavbar">
    <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
    <a href="#">Home</a>
    <a href="#">Accounts</a>
    <a href="#">Task Management</a>
    <a href="#">Help</a>
    <a href="#">Settings</a>
</div>

<span onclick="openNav()">open</span>

<%--<div id="main">--%>
<%--    <%@include file="AdminDashboard.jsp"%>--%>
<%--</div>--%>


<%--<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>--%>
<script>
    function openNav() {
        document.getElementById("sidenav").style.display = "block";
    }

    function closeNav() {
        document.getElementById("sidenav").style.display = "none";
    }
</script>
</body>
</html>
