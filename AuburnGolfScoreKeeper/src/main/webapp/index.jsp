<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <title>AU Golf Score Keeper</title>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Montserrat">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>
    <body>
        <!-- Navbar -->
        <div class="w3-top">
        <jsp:include page="Header/Header.jsp"/>
        </div>
        <!-- Header -->
        <header class="w3-container w3-red w3-center" style="padding:128px 16px">
            <h1 class="w3-margin w3-jumbo" style="color: white">Auburn Golf Score Keeper</h1>
            <p class="w3-xlarge"></p>
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
        <div class="w3-row-padding w3-light-grey w3-padding-64 w3-container">
            <div class="w3-content">
                <div class="w3-twothird">
                    <h1>Course</h1>
                    <h5 class="w3-padding-32"> Add Your Course </h5>
                    <p class="w3-text-grey">Golfers can also add or update the courses that they have played in.</p>
                </div>
                <div class="w3-third w3-center">
                    <i class="fa-solid fa-signs-post"  style="font-size:200px;color:#ff5d00;"></i>
                </div>
            </div>
            </div>
        </div>
        <div class="w3-container w3-black w3-center w3-opacity w3-padding-64">
            <h1 class="w3-margin w3-xlarge">To some golfers, the greatest handicap is the ability to add correctly.</h1>
        </div>
    </body>
</html>