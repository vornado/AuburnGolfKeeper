<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AU Golf Score Keeper</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<%--    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">--%>
    <link rel="stylesheet" href="indexStyle.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
<!-- Navbar -->
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="Login/login.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="Login/login.jsp" class="w3-bar-item w3-button w3-padding-large">Login</a>
        <a href="About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
    </div>
</div>
<!-- Header -->
<header class="w3-container w3-red w3-center" style="padding:128px 16px">
    <h1 class="w3-margin w3-jumbo">Auburn Golf Score Keeper</h1>
    <p class="w3-xlarge"></p>
    <a href="Login/login.jsp"><button class="w3-button w3-black w3-padding-large w3-large w3-margin-top">Log In</button></a>
</header>
<!-- First Grid -->
<div class="w3-row-padding w3-padding-64 w3-container">
    <div class="w3-content">
        <div class="w3-twothird">
            <h1>Score</h1>
            <h5 class="w3-padding-32">Score Your Game </h5>
            <p class="w3-text-grey">Our platform allows users to score their games with a golf handicap. Users can add or update their scores depending on the course</p>
        </div>
        <div class="w3-third w3-center">
            <i class="fa-solid fa-golf-ball-tee" style="font-size:200px;color:#ff5d00;"></i>
        </div>
    </div>
</div>
<!-- Second Grid -->
<div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
    <div class="w3-content">
        <div class="w3-third w3-center">
            <i class="fa-solid fa-signs-post" style="font-size:200px;color:#ff5d00;"></i>

<%--            <i class="fa fa-coffee w3-padding-64 w3-text-red w3-margin-right"></i>--%>
        </div>

        <div class="w3-twothird">
            <h1>Course</h1>
            <h5 class="w3-padding-32"> Add Your Course </h5>

            <p class="w3-text-grey">Golfers can also add or update the courses that they have played in.</p>
        </div>
    </div>
</div>
<div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
    <h1 class="w3-margin w3-xlarge">To some golfers, the greatest handicap is the ability to add correctly.</h1>
</div>
<%--<p>--%>
<%--    <span class="infoText">Before proceeding, this website stores your information, but we will never sell your information.</span>--%>
<%--    <span class="infoText">This information is private to you and we intend to keep it that way!</span>--%>
<%--    <span class="infoText">By clicking the button below. You are agreeing with out terms.</span>--%>
<%--    <a href="Login/login.jsp">Take me to the login page!</a>--%>
<%--</p>--%>
</body>
</html>