<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
    <link type='text/css' rel='stylesheet' href='ForgotPassword.css'/>

</head>
<body>
<jsp:include page="../Header/Header.jsp"/>
<br>
<%--PHP Login Form: Guide to Create a Login Form in PHP
https://www.simplilearn.com/tutorials/php-tutorial/php-login-form--%>
<form action="ForgotPasswordServlet" method="post">
    <div class="container">
        <h1>Forgot Password</h1>
        <div style="color: #FF0000;">${errorMessage}</div>
        <div style="color: #000000;">${newPassword}</div>
        <label><b>Username</b></label>
        <input type="text" placeholder="Username" name="uname" required>

        <label><b>Email</b></label>
        <input type="text" placeholder="Email" name="email" required>

        <label><b>First Name</b></label>
        <input type="text" placeholder="First Name" name="firstName" required>
        <button type="submit">Submit</button>
    </div>
</form>
<br>
</body>
</html>