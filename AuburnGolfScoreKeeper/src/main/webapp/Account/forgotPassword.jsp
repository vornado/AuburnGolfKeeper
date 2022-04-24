<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 4/23/2022
  Time: 5:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Auburn Golf Score Keeper - Forgot Password</title>
</head>
<body>
<div>
    <form action="" method="post">
        <div style="color: #FF0000;">${errorMessage}</div>
        <div>${newPassword}</div>
        <span class="fpText">Please enter your email: <input type="email" maxlength="45" required> </span>
        <span class="fpText">Please enter your username: <input type="text" maxlength="45" required> </span>
        <span class="fpText">Please enter your first name: <input type="text" min="1" maxlength="45" required> </span>
        <input type="submit">
    </form>
</div>
</body>
</html>
