<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Score Keeper</title>
    <link rel="stylesheet" href="LoginStyle.css">
</head>
<body>
<div class="w3-top" id="basic_access_tabs">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="../SignUp/SignUpIndex.jsp"  class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/AboutIndex.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Login</a>
        <a href="../SignUp/SignUpIndex.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/AboutIndex.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
    </div>
</div>

<h2>Auburn Golf Keeper Login Form</h2>
<div>
    <form action="LoginServlet" method="POST">
        <div class="container">
            <h1>Login</h1>
            <label><b>Username</b></label>
            <input id="username" class="login-form-field" type="text" placeholder="Username" name="uname" required>
            <label><b>Password</b></label>
            <input type="password" placeholder="Password" name="psw" required class="login-form-field">
            <button type="submit" id="login-form-submit" onclick="AccessCheck()">Login</button>
            <a href="../ForgotPassword/ForgotPassword.jsp" style="color:darkblue; text-decoration: none">Forgot password</a>
            <br>
            <a href="../SignUp/SignUp.jsp" style="color:darkblue; text-decoration: none">New Account/ Register User</a>
            <br>

        </div>
    </form>
</div>
</body>
</html>
