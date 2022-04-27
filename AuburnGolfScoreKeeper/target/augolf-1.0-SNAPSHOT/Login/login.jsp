<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Score Keeper</title>
    <link rel="stylesheet" href="loginStyle.css">
</head>
<body>
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
        <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Login</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
        <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-padding-large">Admin</a>
    </div>
</div>
<h2>Auburn Golf Keeper Login Form</h2>
<p>
<div>
    <form action="LoginServlet" method="POST">
        <div class="container">
            <label><b>Username</b></label>
            <input class="login-form-field" type="text" placeholder="Username" name="uname" required>
            <label><b>Password</b></label>
            <input type="password" placeholder="Password" name="psw" required class="login-form-field">
            <button type="submit" id="login-form-submit">Login</button>
        </div>

        <div class="container" >
            <button type="button" class="cancelbtn">Cancel</button>
            <span class="psw" >
                    <a href="../ForgotPassword/ForgotPassword.jsp" style="color:darkblue; text-decoration: none">Forgot password</a>
                    <br>
                    <a href="../SignUp/SignUp.jsp" style="color:darkblue; text-decoration: none">New Account/ Register User</a>
                    <br>
                    <a href="../Account/Wait.jsp" style="color:darkblue; text-decoration: none">Wait</a>
                    <a href="../Account/Deny.jsp" style="color:darkblue; text-decoration: none">Deny</a>
            </span>

        </div>
    </form>
</div>
</p>
</body>
</html>
