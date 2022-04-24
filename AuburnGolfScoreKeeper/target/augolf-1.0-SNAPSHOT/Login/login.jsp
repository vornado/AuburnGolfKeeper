<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Score Keeper - Login</title>
    <link rel="stylesheet" href="loginStyle.css">
</head>
<body>
<h1>Temp Login</h1>
<p>
    <div>
        <form action="LoginServlet" method="post">
            <div style="color: #FF0000;">${errorMessage}</div>
            <span class="">Enter Username: <input type="text" name="username" required></span>
            <span class="">Enter Password: <input type="password" name="password" required></span>
            <span class=""><input type="submit" value="Login"> </span>
            <span class=""><a href="../Account/registration.jsp">New User</a> | <a href="">Forgot Password</a></span>
        </form>
    </div>
</p>
</body>
</html>
