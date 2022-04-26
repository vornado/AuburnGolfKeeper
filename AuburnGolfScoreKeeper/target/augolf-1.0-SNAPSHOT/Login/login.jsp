<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Score Keeper</title>
    <link rel="stylesheet" href="loginStyle.css">
</head>
<body>
<h2>Auburn Golfkeeper Login Form</h2>
<p>
    <div>
        <form action="LoginServlet" method="POST">
            <div class="container">
                <label><b>Username</b></label>
                <input class="login-form-field" type="text" placeholder="Username" name="uname" required>

                <label><b>Password</b></label>
                <input type="password" placeholder="Password" name="psw" required class="login-form-field">

                <button type="submit" id="login-form-submit">Login</button>

                <label><input type="checkbox"  name="remember"> Remember me</label>
            </div>

            <div class="container" >
                <button type="button" class="cancelbtn">Cancel</button>
                <span class="psw" >
                    <a href="ForgotPassword.jsp" style="color:darkblue; text-decoration: none">Forgot password</a>
                    <br>
                    <a href="SignUp.jsp" style="color:darkblue; text-decoration: none">New Account/ Register User</a>
                </span>

            </div>
        </form>
    </div>
</p>
</body>
</html>
