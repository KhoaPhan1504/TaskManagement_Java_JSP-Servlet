<%--
  Created by IntelliJ IDEA.
  User: MSI LAPTOP
  Date: 09/01/2024
  Time: 09:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Kaopiz</title>
    <link rel="icon" href="assets/image/icon.png" type="image/icon type">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" >
    <link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" integrity="sha384-4LISF5TTJX/fLmGSxO53rV4miRxdg84mZsxmO8Rx5jGtp/LbrixFETvWa5a6sESd" crossorigin="anonymous">
    <link href="css/Admin.css" rel="stylesheet">
    <link href="css/Task.scss" rel="stylesheet">
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
                <i class='bx bx-layer nav_logo-icon'></i> <span class="nav_logo-name"><img class="nav_logo-img" src="assets/image/shintech.png"></span> </a>
                <div class="nav_list">
                    <a href="AdminDashboard.jsp" class="nav_link"> <i class='bx bx-grid-alt nav_icon'></i> <span class="nav_name">Dashboard</span> </a>
                    <a href="AccountManagement.jsp" class="nav_link"> <i class='bx bx-user nav_icon'></i> <span class="nav_name">Accounts</span> </a>
                    <a href="TaskManagement.jsp" class="nav_link active"> <i class='bx bx-message-square-detail nav_icon'></i> <span class="nav_name">Task</span> </a>
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
        <div class='app'>
            <main class='project'>
                <div class='project-info'>
                    <h1>Task Management!</h1>
                    <div class='project-participants'>
                        <span></span>
                        <span></span>
                        <span></span>
                        <button class='project-participants__add' onclick="location.href='CreateTask.jsp'">Add Participant</button>

                    </div>
                </div>
                <div class='project-tasks'>
                    <div class='project-column'>
                        <div class='project-column-heading'>
                            <h2 class='project-column-heading__title'>Task Ready</h2><button class='project-column-heading__options'><i class="fas fa-ellipsis-h"></i></button>
                        </div>
                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--copyright'>Copywriting</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Konsep hero title yang menarik</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>3</span>
                                <span><i class="fas fa-paperclip"></i>7</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--design'>UI Design</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Icon di section our services</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>2</span>
                                <span><i class="fas fa-paperclip"></i>5</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--copyright'>Copywriting</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Konsep hero title yang menarik</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>2</span>
                                <span><i class="fas fa-paperclip"></i>3</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>
                    </div>
                    <div class='project-column'><div class='project-column-heading'>
                        <h2 class='project-column-heading__title'>In Progress</h2><button class='project-column-heading__options'><i class="fas fa-ellipsis-h"></i></button>
                    </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--design'>UI Design</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Replace lorem ipsum text in the final designs</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>5</span>
                                <span><i class="fas fa-paperclip"></i>5</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--illustration'>Illustration</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Create and generate the custom SVG illustrations.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>8</span>
                                <span><i class="fas fa-paperclip"></i>7</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--copyright'>Copywriting</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Proof read the legal page and check for and loopholes</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>12</span>
                                <span><i class="fas fa-paperclip"></i>11</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--illustration'>Illustration</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Create the landing page graphics for the hero slider.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>4</span>
                                <span><i class="fas fa-paperclip"></i>8</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                    </div>
                    <div class='project-column'><div class='project-column-heading'>
                        <h2 class='project-column-heading__title'>Needs Review</h2><button class='project-column-heading__options'><i class="fas fa-ellipsis-h"></i></button>
                    </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--copyright'>Copywriting</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Check the company we copied doesn't think we copied them.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>4</span>
                                <span><i class="fas fa-paperclip"></i>0</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>
                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--design'>UI Design</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Design the about page.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>0</span>
                                <span><i class="fas fa-paperclip"></i>5</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>
                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--illustration'>Illustration</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Move that one image 5px down to make Phil Happy.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>2</span>
                                <span><i class="fas fa-paperclip"></i>2</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>
                    </div>
                    <div class='project-column'><div class='project-column-heading'>
                        <h2 class='project-column-heading__title'>Done</h2><button class='project-column-heading__options'><i class="fas fa-ellipsis-h"></i></button>
                    </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--illustration'>Illustration</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Send Advert illustrations over to production company.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>12</span>
                                <span><i class="fas fa-paperclip"></i>5</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--illustration'>Illustration</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Dawn wants to move the text 3px to the right.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>3</span>
                                <span><i class="fas fa-paperclip"></i>7</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                        <div class='task' draggable='true'>
                            <div class='task__tags'><span class='task__tag task__tag--copyright'>Copywriting</span><button class='task__options'><i class="fas fa-ellipsis-h"></i></button></div>
                            <p>Amend the contract details.</p>
                            <div class='task__stats'>
                                <span><time datetime="2021-11-24T20:00:00"><i class="fas fa-flag"></i>Nov 24</time></span>
                                <span><i class="fas fa-comment"></i>8</span>
                                <span><i class="fas fa-paperclip"></i>16</span>
                                <span class='task__owner'></span>
                            </div>
                        </div>

                    </div>

                </div>
            </main>
            <aside class='task-details'>
                <div class='tag-progress'>
                    <h2>Task Progress</h2>
                    <div class='tag-progress'>
                        <p>Copywriting <span>3/8</span></p>
                        <progress class="progress progress--copyright" max="8" value="3"> 3 </progress>
                    </div>
                    <div class='tag-progress'>
                        <p>Illustration <span>6/10</span></p>
                        <progress class="progress progress--illustration" max="10" value="6"> 6 </progress>
                    </div>
                    <div class='tag-progress'>
                        <p>UI Design <span>2/7</span></p>
                        <progress class="progress progress--design" max="7" value="2"> 2 </progress>
                    </div>
                </div>
                <div class='task-activity'>
                    <h2>Recent Activity</h2>
                    <ul>
                        <li>
                            <span class='task-icon task-icon--attachment'><i class="fas fa-paperclip"></i></span>
                            <b>Andrea </b>uploaded 3 documents
                            <time datetime="2021-11-24T20:00:00">Aug 10</time>
                        </li>
                        <li>
                            <span class='task-icon task-icon--comment'><i class="fas fa-comment"></i></span>
                            <b>Karen </b> left a comment
                            <time datetime="2021-11-24T20:00:00">Aug 10</time>
                        </li>
                        <li>
                            <span class='task-icon task-icon--edit'><i class="fas fa-pencil-alt"></i></span>
                            <b>Karen </b>uploaded 3 documents
                            <time datetime="2021-11-24T20:00:00">Aug 11</time>
                        </li>
                        <li>
                            <span class='task-icon task-icon--attachment'><i class="fas fa-paperclip"></i></span>
                            <b>Andrea </b>uploaded 3 documents
                            <time datetime="2021-11-24T20:00:00">Aug 11</time>
                        </li>
                        <li>
                            <span class='task-icon task-icon--comment'><i class="fas fa-comment"></i></span>
                            <b>Karen </b> left a comment
                            <time datetime="2021-11-24T20:00:00">Aug 12</time>
                        </li>
                    </ul>
                </div>
            </aside>
        </div>


    </div>
    <!--Container Main end-->

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js" ></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/js/all.min.js" ></script>
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
    <script>
        function validate()
        {
            var activity= document.myform.txt_activi;
            var description = document.myform.txt_descri;
            var date= document.myform.txt_date;

            if (activity.value == "")
            {
                window.alert("please enter activity ?");
                name.focus();
                return false;
            }
            if (date.value == "")
            {
                window.alert("please enter  date?");
                owner.focus();
                return false;
            }
        }
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', (event) => {

            var dragSrcEl = null;

            function handleDragStart(e) {
                this.style.opacity = '0.1';
                this.style.border = '3px dashed #c4cad3';

                dragSrcEl = this;

                e.dataTransfer.effectAllowed = 'move';
                e.dataTransfer.setData('text/html', this.innerHTML);
            }

            function handleDragOver(e) {
                if (e.preventDefault) {
                    e.preventDefault();
                }

                e.dataTransfer.dropEffect = 'move';

                return false;
            }

            function handleDragEnter(e) {
                this.classList.add('task-hover');
            }

            function handleDragLeave(e) {
                this.classList.remove('task-hover');
            }

            function handleDrop(e) {
                if (e.stopPropagation) {
                    e.stopPropagation(); // stops the browser from redirecting.
                }

                if (dragSrcEl != this) {
                    dragSrcEl.innerHTML = this.innerHTML;
                    this.innerHTML = e.dataTransfer.getData('text/html');
                }

                return false;
            }

            function handleDragEnd(e) {
                this.style.opacity = '1';
                this.style.border = 0;

                items.forEach(function (item) {
                    item.classList.remove('task-hover');
                });
            }


            let items = document.querySelectorAll('.task');
            items.forEach(function(item) {
                item.addEventListener('dragstart', handleDragStart, false);
                item.addEventListener('dragenter', handleDragEnter, false);
                item.addEventListener('dragover', handleDragOver, false);
                item.addEventListener('dragleave', handleDragLeave, false);
                item.addEventListener('drop', handleDrop, false);
                item.addEventListener('dragend', handleDragEnd, false);
            });
        });
    </script>
</body>
</html>
