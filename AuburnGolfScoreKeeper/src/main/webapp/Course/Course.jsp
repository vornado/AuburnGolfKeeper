<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
    <link type='text/css' rel='stylesheet' href='ForgotPassword.css'/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>

</head>
<body>
<h2>Auburn GolfKeeper Course</h2>
<%--PHP Login Form: Guide to Create a Login Form in PHP
https://www.simplilearn.com/tutorials/php-tutorial/php-login-form--%>
<form action="Course/CourseServlet" method="post">

    <div class="container">
        <label><b>Club Name</b></label>
        <input type="text" placeholder="Club Name" name="cname" required>

        <label><b>Club Course Name</b></label>
        <input type="text" placeholder="Club Course Name" name="ccname" required>

        <label><b>Par</b></label>
        <input type="text" placeholder="Par" name="parname" required>

        <label><b>Location City</b></label>
        <input type="text" placeholder="Location City" name="LCname" required>

        <label><b>Location State</b></label>
        <input type="text" placeholder="Location State" name="LSname" required>

        <button type="submit">Submit</button>
    </div>
</form>
<br>
</body>
</html>