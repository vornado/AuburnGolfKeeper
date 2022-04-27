<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Score Keeper</title>
    <link rel="stylesheet" href="LoginStyle.css">
</head>
<body>
<div class="w3-top" id="access_tabs">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large" id="accesstabs">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Login</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
    </div>
</div>
<h2>Auburn Golf Keeper Login Form</h2>
<p>
<div>
    <form action="LoginServlet" method="POST">
        <div class="container">
            <h1>Login</h1>
            <label><b>Username</b></label>
            <input id="username" class="login-form-field" type="text" placeholder="Username" name="uname" required>
            <label><b>Password</b></label>
            <input type="password" placeholder="Password" name="psw" required class="login-form-field">
            <button type="submit" id="login-form-submit" onclick="AccessCheck()">Login</button>
        </div>

        <div class="container" >
            <span class="psw" >
                    <a href="../ForgotPassword/ForgotPassword.jsp" style="color:darkblue; text-decoration: none">Forgot password</a>
                    <br>
                    <a href="../SignUp/SignUp.jsp" style="color:darkblue; text-decoration: none">New Account/ Register User</a>
                    <br>
            </span>

        </div>
    </form>
</div>
</p>
<script>

    function AccessCheck() {
        var userId = document.getElementById("username");
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

        if(roleId == "Admin" && statusId == "Approved"){
            //Create different div for each tab
            //create a global variable accessible tp everyone.
        }
        else if(roleId == "Moderator" && statusId == "Approved"){
            //Create different div for each tab
            //create a global variable accessible tp everyone.

        }
        else if(roleId == "Basic" && statusId == "Approved"){
            //Create different div for each tab
            //create a global variable accessible tp everyone.

        }
        else{

        }
        function myModerator() {
            var x = document.getElementById("access_tabs");
            var y = document.getElementById("accesstabs");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
        function myBasic() {
            var x = document.getElementById("access_tabs");
            if (x.style.display === "none") {
                x.style.display = "block";
            } else {
                x.style.display = "none";
            }
        }
    }
</script>
</body>
</html>
