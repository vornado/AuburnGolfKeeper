<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Auburn Golf Keeper</title>
        <link type='text/css' rel='stylesheet' href='About.css'/>
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>

    </head>
    <body onload="AccessCheck()">
        <div class="w3-top" id="basic_access_tabs">
            <div class="w3-bar w3-red w3-card w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                <a class="w3-bar-item w3-button w3-padding-large w3-white" href="../Home/home.jsp">Home</a>
                <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
            </div>

            <!-- Navbar on small screens -->
            <div id="navDemo0" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
                <a href="../Home/home.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
                <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-padding-large">About</a>
            </div>
        </div>
        <div class="w3-top" id="normal_access_tabs">
            <div class="w3-bar w3-red w3-card w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
                <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
                <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
                <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
            </div>

            <!-- Navbar on small screens -->
            <div id="navDemo1" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
                <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
                <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-padding-large">About</a>
                <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
                <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
            </div>
        </div>
        <div class="w3-top" id="moderator_access_tabs">
            <div class="w3-bar w3-red w3-card w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
                <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
                <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
                <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
                <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
            </div>

            <!-- Navbar on small screens -->
            <div id="navDemo2" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
                <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
                <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-padding-large">About</a>
                <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
                <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
                <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-padding-large">Admin</a>
            </div>
        </div>
        <div class="w3-top" id="admin_access_tabs">
            <div class="w3-bar w3-red w3-card w3-left-align w3-large">
                <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
                <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
                <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
                <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
                <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
                <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
            </div>

            <!-- Navbar on small screens -->
            <div id="navDemo3" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
                <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
                <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
                <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
                <a href="#" class="w3-bar-item w3-button w3-padding-large">About</a>
                <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
                <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
                <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-padding-large">Admin</a>
            </div>
        </div>
        <br>
        <form action="AdminServlet" method="get">
<%--            <div class="container" >--%>
<%--                <input type="submit" style=" background-color: #051160; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none;display: inline-block; font-size: 16px; width: 55%; height: 55%;" value="Get Users Info" >--%>
<%--            </div>--%>
        </form>
        <div class="container" >
            <h1>About Us </h1>
            <p style="display: block; text-align: justify-all; margin-left: 25%; margin-right: 25%;" > Our organization is a platform for golfers by golfers. We wanted to create a platform that allows golfers to keep track of all their scores at any course they have played. We included golf handicaps in the scoring too. We created this platform to help make life easier for the golfers to keep track of their scores and have fun doing it. </p>
            <br>
        </div>
        <script>
            function AccessCheck() {
                var userId = requestScope.users;
                var user = userId.value;
                var roleId = "";
                var statusId = "";

                <c:forEach items="${requestScope.users}" var="item" varStatus="status">
                <c:if test="${user == item.getUserName()}">
                <c:choose>
                <c:when test="${item.getAccountStatusId() == 3}">
                <c:out value = "Admin"/>
                roleId = "Admin";
                </c:when>
                <c:when test="${item.getAccountStatusId() == 2}">
                <c:out value = "Moderator"/>
                roleId = "Moderator";
                </c:when>
                <c:otherwise>
                <c:out value = "Basic"/>
                roleId = "Basic";
                </c:otherwise>
                </c:choose>
                <c:choose>
                <c:when test="${item.getAccountStatusId() == 3}">
                <c:out value = "Approved"/>
                statusId = "Approved";
                </c:when>
                <c:when test="${item.getAccountStatusId() == 2}">
                <c:out value = "Denied"/>
                statusId = "Denied";
                </c:when>
                <c:otherwise>
                <c:out value = "Pending"/>
                statusId = "Pending";
                </c:otherwise>
                </c:choose>
                </c:if>
                </c:forEach>
                var w = document.getElementById("basic_access_tabs");
                var x = document.getElementById("normal_access_tabs");
                var y = document.getElementById("moderator_access_tabs");
                var z = document.getElementById("admin_access_tabs");

                if(roleId == "Admin" && statusId == "Approved"){
                    //Create different div for each tab
                    //create a global variable accessible tp everyone.
                    myAdmin();
                }
                else if(roleId == "Moderator" && statusId == "Approved"){
                    //Create different div for each tab
                    //create a global variable accessible tp everyone.
                    myModerator();

                }
                else if(roleId == "Basic" && statusId == "Approved"){
                    myNorm();
                }
                else{
                    myBasic();
                }
                function myBasic() {
                    //display the basic tabs
                    w.style.display = "block";
                    x.style.display = "none";
                    y.style.display = "none";
                    z.style.display = "none";
                    document.getElementById("../Admin/Admin.jsp").onclick = function () {
                        location.href = "../Account/Deny.jsp";
                    }
                }
                function myNorm() {
                    //display the basic tabs
                    w.style.display = "none";
                    x.style.display = "block";
                    y.style.display = "none";
                    z.style.display = "none";
                    document.getElementById("../Admin/Admin.jsp").onclick = function () {
                        location.href = "../Account/Deny.jsp";
                    }
                }
                function myModerator() {
                    w.style.display = "none";
                    x.style.display = "none";
                    y.style.display = "block";
                    z.style.display = "none";

                }
                function myAdmin() {
                    w.style.display = "none";
                    x.style.display = "none";
                    y.style.display = "none";
                    z.style.display = "block";
                }
            }
        </script>
    </body>
</html>