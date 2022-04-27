<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
    <link type='text/css' rel='stylesheet' href='Course.css'/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>

</head>
<body>
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../Home/home.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="../Login/Login.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
        <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../Home/home.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="../Login/Login.jsp" class="w3-bar-item w3-button w3-padding-large">Login</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
        <a href="../Admin/Admin.jsp" class="w3-bar-item w3-button w3-padding-large">Admin</a>
    </div>
</div>
<h2>Auburn GolfKeeper Course</h2>
<%--PHP Login Form: Guide to Create a Login Form in PHP
https://www.simplilearn.com/tutorials/php-tutorial/php-login-form--%>
<form action="CourseServlet" method="post">
    <div class="container">
        <h1>Course </h1>
        <div style="color: #27C46B;">${successMessage}</div>
        <div style="color: #FF0000;">${errorMessage}</div>
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