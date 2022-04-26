<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
    <link type='text/css' rel='stylesheet' href='ForgotPassword.css'/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>

</head>
<body>
<h2>Auburn Golfkeeper Forgot Password Page</h2>
<%--PHP Login Form: Guide to Create a Login Form in PHP
https://www.simplilearn.com/tutorials/php-tutorial/php-login-form--%>
<form action="ForgotPassword/ForgotPasswordServlet" method="post">

    <div class="container">
        <label><b>Username</b></label>
        <input type="text" placeholder="Username" name="uname" required>

        <label><b>Password</b></label>
        <input type="password" placeholder="Password" name="psw" required>

        <label><b>Confirm Password</b></label>
        <input type="password" placeholder="Confirm Password" name="psw" required>
        <button type="submit">Submit</button>
    </div>
</form>
<br>
</body>
</html>