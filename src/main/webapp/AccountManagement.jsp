<%@ page import="java.security.spec.ECField" %>
<%@ page import="java.io.*, java.util.*, java.sql.*" %>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ page import="com.khoadev.ManagementDemo.controller.AccountServlet" %>
<%@ page import="com.khoadev.ManagementDemo.model.User" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="com.khoadev.ManagementDemo.controller.AccountServlet" %>
<%@ page import="com.khoadev.ManagementDemo.model.User" %>
<%@ page import="com.khoadev.ManagementDemo.dao.UserDAO" %>
<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 20/12/2023
  Time: 09:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin ShinTech</title>
    <link rel="icon" href="assets/image/icon.png" type="image/icon type">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">
    <link href="css/Admin.css" rel="stylesheet">
    <style>
        #account-table {
            cursor: pointer;
        }

        #account-table tr {
            transition: 0.25s;
            vertical-align: middle;
            text-align: center;
        }

        #account-table td {
            text-align: center;
        }

        #account-table th {
            white-space: nowrap;
        }

        #account-table-wrapper {
            min-height: 128px;
            max-width: fit-content;
            max-height: 500px;
            overflow-y: scroll;
        }

        .selected {
            color: white;
            background-color: #7bed9f;
        }
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

    <%--  SIDEBAR  --%>
    <div class="l-navbar" id="nav-bar">
        <nav class="nav">
            <div> <a href="#" class="nav_logo">
                <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name"><img class="nav_logo-img" src="assets/image/shintech.png"></span> </a>
                <div class="nav_list">
                    <a href="AdminDashboard.jsp" class="nav_link"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span> </a>
                    <a href="AccountManagement.jsp" class="nav_link active"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">Accounts</span> </a>
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
    <div class="height-100 bg-light h-full overflow-y-auto  max-w-full  pt-4" id="main">
        <h1>Account Management</h1>
        <div class="container">
            <div class="row">
                <div class="col-6 mb-3">
                    <label for="role" class="form-label">Role</label>
                    <select class="form-select form-select-sm" name="role" id="role">
                        <option value="LEADER">LEADER</option>
                        <option value="SUB_LEADER">SUB_LEADER</option>
                        <option value="USER">USER</option>
                    </select>
                </div>
                <div class="col-3 mb-3">
                    <label for="min-id" class="form-label">ID từ: </label>
                    <input type="number" min="1" class="form-control form-control-sm" name="min-id" id="min-id"
                           placeholder="VD: 10">
                </div>
                <div class="col-3 mb-3">
                    <label for="max-id" class="form-label">ID đến: </label>
                    <input type="number" min="1" class="form-control form-control-sm" name="max-id" id="max-id"
                           placeholder="VD: 100">
                </div>
            </div>
            <div class="row mt-3">
                <div class="col-6 d-flex">
                    <input id="search" class="form-control form-control-sm me-2" type="search"
                           placeholder="Tìm kiếm tài khoản" aria-label="Search">
                    <button id="btn-search" class="col-auto btn btn-sm btn-outline-success" type="submit">
                        <i class="bi bi-search"></i>
                        Search
                    </button>
                </div>
                <div class="col-6 d-flex justify-content-end">
                    <button id="btn-refresh" type="button" class="btn btn-sm btn-primary" onclick="loadRefresh()">
                        <i class="bi bi-arrow-clockwise"></i>
                        Refresh
                    </button>
                    <button id="btn-add" type="button" class="btn btn-sm btn-success ms-2" data-bs-toggle="modal"
                            onclick="location.href='form-model-account.jsp'">
                        <i class="bi bi-plus-lg"></i>
                        Add
                    </button>
                    <button id="btn-edit" type="button" class="btn btn-sm btn-warning ms-2" data-bs-toggle="modal"
                            data-bs-target="#form-modal" onclick="location.href=''">
                        <i class="bi bi-pencil-square"></i>
                        Edit
                    </button>
                    <button id="btn-delete" type="button" class="btn btn-sm btn-danger ms-2" data-bs-toggle="modal"
                            data-bs-target="#delete-modal">
                        <i class="bi bi-trash-fill"></i>
                        Delete
                    </button>
                </div>
            </div>
            <div class="position-relative">
                <div id="account-table-wrapper" class="row my-4">
                    <table id="account-table" class="table">
                        <thead id="account-thead">
                            <tr class="text-primary sticky-top bg-light">
                                <th scope="col" class="px-3" key="id">
                                    # <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                                <th scope="col" class="px-4" key="lastName">
                                    Last Name
                                    <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                                <th scope="col" class="px-4" key="firstName">
                                    First Name
                                    <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                                <th scope="col" class="px-4" key="email">
                                    Email
                                    <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                                <th scope="col" class="px-4" key="password">
                                    Password
                                    <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                                <th scope="col" class="px-4" key="role">
                                    Role
                                    <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                                <th scope="col" class="px-4" key="phone_number">
                                    Phone Number
                                    <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                                <th scope="col" class="px-4" key="address">
                                    Address
                                    <i class="fa-solid fa-sort fa-xs ms-2"></i>
                                </th>
                            </tr>
                        </thead>
                        <% UserDAO userDAO = new UserDAO();
                            List<User> uses = userDAO.getAllUser();
                            for(User user : uses) { %>
                        <tbody id="account-tbody">
                            <tr>
                                <td><%= user.getId()%></td>
                                <td><%= user.getLastName() %></td>
                                <td><%= user.getFirstName() %></td>
                                <td><%= user.getEmail() %></td>
                                <td><%= user.getPassword() %></td>
                                <td><%= user.getRole() %></td>
                                <td><%= user.getPhoneNumber()  %></td>
                                <td><%= user.getAddress() %></td>
                            </tr>
                        </tbody>
                        <% } %>
                    </table>
                </div>
            </div>
            <div class="row">
                <p id="page-info" class="text-start col-auto"></p>
                <div class="col-auto">
                    <select class="form-select form-select-sm" id="page-size">
                        <option value="10" selected>10</option>
                        <option value="25">25</option>
                        <option value="50">50</option>
                    </select>
                </div>
                <p class="text-start col-auto">rows per page</p>
                <nav class="col-auto ms-auto">
                    <ul class="pagination pagination-sm">
                        <li class="page-item">
                            <a onclick="changePageNumberBy(-1)" id="previous" class="page-link" href="#">Previous</a>
                        </li>
                        <li class="page-item">
                            <input id="page-number" min="1" class="form-control form-control-sm" type="number" value="1">
                        </li>
                        <li class="page-item">
                            <a onclick="changePageNumberBy(1)" id="next" class="page-link" href="#">Next</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

        <div id="form-modal-container"></div>
        <div id="delete-modal-container"></div>
    </div>
<!--Container Main end-->



    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
    <%-- NAV  --%>
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

        function loadRefresh() {
            location.reload();
        }
    </script>

</body>
</html>
