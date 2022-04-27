<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
    <link type='text/css' rel='stylesheet' href='Wait.css'/>
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Open Sans"/>
    <div>
        <h1>Wait</h1>
        <h2 >Please wait for an admin to approve of your account</h2>
    </div>

    <div class="loading">Waiting for "load" event...</div>
    <div class="earth">
        <img src="https://cssanimation.rocks/images/random/earth.png">
    </div>
    <div class="moon">
        <img src="https://cssanimation.rocks/images/random/moon.png">
    </div>
</head>
<script>



    document.body.classList.add('js-loading');

    window.addEventListener("load", showPage, false);

    function showPage() {
        document.body.classList.remove('js-loading');
    }


</script>
</html>