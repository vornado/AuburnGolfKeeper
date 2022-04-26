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
<form action="RegisterServlet" method="post">

    <div class="container">
        <label><b>Username</b></label>
        <input type="text" placeholder="Username" name="uname" required>

        <label><b>Password</b></label>
        <input type="password" placeholder="Password" name="psw" required>

        <label><b>Confirm Password</b></label>
        <input type="password" placeholder="Confirm Password" name="psw" required>
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
        <label><b>Email</b></label>
        <input type="email" placeholder="Enter your email" id="regEmail" maxlength="45" name="regEmail" required>
        <br>
        <button type="submit">Registration</button>
    </div>
</form>
<br>
</body>
</html>