<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 09/01/2024
  Time: 15:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="icon" href="assets/image/icon.png" type="image/icon type">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">
    <link href="css/Admin.css" rel="stylesheet">
    <style>
        .l-navbar {
            background-color: #454141;
        }
    </style>
</head>
<body id="body-pd">
<header class="header" id="header">
    <div class="header_toggle"> <i class='bx bx-menu' id="header-toggle"></i> </div>
    <div class="header_img"> <img src="assets/image/z4547572505033_f6d80a3e427b862177429dd0f3c352ca.jpg" alt=""> </div>
</header>
<div class="l-navbar" id="nav-bar">
    <nav class="nav">
        <div> <a href="#" class="nav_logo">
            <i class='bx bx-layer nav_logo-icon'></i>
            <span class="nav_logo-name"><img class="nav_logo-img" src="assets/image/shintech.png"></span> </a>
            <div class="nav_list">
                <a href="" class="nav_link active"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span> </a>
                <a href="AccountManagement.jsp" class="nav_link"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">Accounts</span> </a>
                <a href="TaskManagement.jsp" class="nav_link"> <i class='bx bx-message-square-detail nav_icon'></i> <span class="nav_name">Task</span> </a>
                <a href="#" class="nav_link"> <i class='bi bi-book nav_icon'></i> <span class="nav_name">Information</span> </a>
                <a href="#" class="nav_link"> <i class="bi bi-info-circle nav_icon"></i> <span class="nav_name">Help</span> </a>
                <a href="#" class="nav_link"> <i class="bi bi-gear-wide nav_icon"></i> <span class="nav_name">Settings</span> </a>
            </div>
        </div>
        <a href="LogoutServlet" class="nav_link"> <i class='bx bx-log-out nav_icon'></i> <span class="nav_name">LogOut</span> </a>
    </nav>
</div>
<!--Container Main start-->
<div class="height-100 bg-light h-full overflow-y-auto  max-w-full  pt-4 " id="main">
    <%--  FORM  --%>
    <div class="row">
        <div class="col-lg-12 content-custom">
            <form class="row g-3" action="CreateAccountServlet" method="post" autocomplete="off">
                <h1>Create an Account</h1>
<%--                <div class="col-md-6">--%>
<%--                    <label for="inputID" class="form-label">ID</label>--%>
<%--                    <input type="text" class="form-control" id="inputID" name="id" disabled>--%>
<%--                </div>--%>
                <div class="col-md-6">
                    <label for="inputFirstName" class="form-label">First name</label>
                    <input type="text" class="form-control" id="inputFirstName" name="firstName">
                </div>
                <div class="col-md-6">
                    <label for="inputLastName" class="form-label">Last name</label>
                    <input type="text" class="form-control" id="inputLastName" name="lastName">
                </div>
                <div class="col-md-6">
                    <label for="inputEmail4" class="form-label">Email</label>
                    <input type="email" class="form-control" id="inputEmail4" name="email" autocomplete="off">
                </div>
                <div class="col-md-6">
                    <label for="inputRole" class="form-label">Role</label>
                    <select id="inputRole" class="form-select" name="role">
                        <option value="ADMIN">ADMIN</option>
                        <option value="LEADER">LEADER</option>
                        <option value="SUB_LEADER">SUB_LEADER</option>
                        <option value="USER">USER</option>
                    </select>
                </div>
                <div class="col-md-6">
                    <label for="inputPassword4" class="form-label">Password</label>
                    <input type="password" class="form-control" id="inputPassword4" name="password" autocomplete="off">
                </div>
                <div class="col-md-6">
                    <label for="inputConfirmPassword" class="form-label">Confirm password</label>
                    <input type="password" class="form-control" id="inputConfirmPassword" name="confirmpassword">
                </div>

                <div class="col-md-6">
                    <label for="inputPhoneNumber" class="form-label">Phone number</label>
                    <input type="text" class="form-control" id="inputPhoneNumber" name="phoneNumber" placeholder="">
                </div>
                <div class="col-md-6">
                    <label for="inputAddress" class="form-label">Address</label>
                    <input type="text" class="form-control" id="inputAddress" name="address" placeholder="">
                </div>
                <div class="col-md-6">
                    <button type="submit" class="btn btn-primary">  Add Account </button>
                </div>
            </form>
            <div class="col-md-6">
                <button class="btn btn-primary" onclick="location.href='AccountManagement.jsp'"> <i class="bi bi-arrow-bar-left"></i> Back</button>
            </div>
        </div>
    </div>
</div>



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
    <script>
        document.addEventListener("DOMContentLoaded", function(event) {

            const showNavbar = (toggleId, navId, bodyId, headerId) =>{
                const toggle = document.getElementById(toggleId),
                    nav = document.getElementById(navId),
                    bodypd = document.getElementById(bodyId),
                    headerpd = document.getElementById(headerId)

                // Validate that all variables exist
                if(toggle && nav && bodypd && headerpd){
                    toggle.addEventListener('click', ()=>{
                        // show navbar
                        nav.classList.toggle('show')
                        // change icon
                        toggle.classList.toggle('bx-x')
                        // add padding to body
                        bodypd.classList.toggle('body-pd')
                        // add padding to header
                        headerpd.classList.toggle('body-pd')
                    })
                }
            }

            showNavbar('header-toggle','nav-bar','body-pd','header')

            /*===== LINK ACTIVE =====*/
            const linkColor = document.querySelectorAll('.nav_link')

            function colorLink(){
                if(linkColor){
                    linkColor.forEach(l=> l.classList.remove('active'))
                    this.classList.add('active')
                }
            }
            linkColor.forEach(l=> l.addEventListener('click', colorLink))

            // Your code to run since DOM is loaded and ready
        });
    </script>
</body>
</html>
