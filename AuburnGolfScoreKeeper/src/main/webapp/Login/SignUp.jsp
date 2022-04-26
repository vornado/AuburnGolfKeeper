<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
    <link type='text/css' rel='stylesheet' href='SignUp.css'/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>

</head>
<body>
<h2>Auburn Golfkeeper Registration Page</h2>
<%--PHP Login Form: Guide to Create a Login Form in PHP
https://www.simplilearn.com/tutorials/php-tutorial/php-login-form--%>
<form action="SignUp/SignUpServlet" method="post">

    <div class="container">
        <label><b>Username</b></label>
        <input type="text" placeholder="Username" name="uname" required>

        <label><b>Password</b></label>
        <input type="password" placeholder="Password" name="psw" required>

        <label><b>Confirm Password</b></label>
        <input type="password" placeholder="Confirm Password" name="psw" required>
        <label><b>Gender</b></label>
        <br>
        <label><input type="checkbox"  name="female"> Female</label>
        <br>
        <label><input type="checkbox"  name="male"> Male</label>
        <br>
        <label><input type="checkbox"  name="rathernotsay"> Rather Not Say</label>
        <br>
        <button type="submit">Registration</button>
    </div>
</form>
<br>
</body>
</html>