<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
    <link type='text/css' rel='stylesheet' href='../ForgotPassword/ForgotPassword.css'/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>

</head>
<body>
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="../Login/Login.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/AboutIndex.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="../Login/Login.jsp" class="w3-bar-item w3-button w3-padding-large">Login</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/AboutIndex.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
    </div>
</div>
<h2>Auburn Golfkeeper Forgot Password Page</h2>
<%--PHP Login Form: Guide to Create a Login Form in PHP
https://www.simplilearn.com/tutorials/php-tutorial/php-login-form--%>
<form action="RegisterServlet" method="POST">

    <div class="container">
        <h1>Registration</h1>
        <div style="color: #FF0000;">${errorMessage}</div>
        <label><b>Email</b></label>
        <input type="text" placeholder="Email" name="email" maxlength="45" required>
        <br>
        <label><b>Username</b></label>
        <input type="text" placeholder="Username" name="uname" required>

        <label><b>Password</b></label>
        <input type="password" id="password" placeholder="Password" name="psw" required>

        <label><b>Confirm Password</b></label>
        <input type="password" id="confirmPassword"  placeholder="Confirm Password" name="psw" required>
        <label><b>Gender</b></label>
        <br>
        <select id="genderId" name="regGender">
            <option value="-1" selected>Prefer not to say.</option>
            <option value="0">Male</option>
            <option value="1">Female</option>
        </select>
        <br>
        <label><b>First Name</b></label>
        <input type="text" placeholder="First Name" name="regFirstName" required>
        <br>
        <label><b>Last Name</b></label>
        <input type="text" placeholder="Last Name" name="regLastName" required>
        <br>
        <button type="submit">Registration</button>
    </div>
</form>
<br>
</body>
</html>

<script>
    const password = document.getElementById("Password")
    const password = document.getElementById("Password")
        , confirm_password = document.getElementById("confirmPassword");
    function validatePassword(){
        if(password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }
    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>