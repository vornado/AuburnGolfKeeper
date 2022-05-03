<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Score Keeper</title>
</head>
<body>
<br>
<jsp:include page="../Header/Header.jsp" />
<form action="LoginServlet" method="POST">
    <div class="container">
        <h1>Login</h1>
        <label><b>Username</b></label>
        <div style="color: #FF0000;">${errorMessage}</div>
        <input id="username" class="login-form-field" type="text" placeholder="Username" name="uname" required>
        <label><b>Password</b></label>
        <input type="password" placeholder="Password" name="psw" required class="login-form-field">
        <button type="submit" id="login-form-submit">Login</button>
        <a href="../ForgotPassword/ForgotPassword.jsp" style="color:darkblue; text-decoration: none">Forgot password</a>
        <br>
        <a href="../SignUp/SignUp.jsp" style="color:darkblue; text-decoration: none">New Account/ Register User</a>
        <br>

    </div>
</form>
</body>
</html>