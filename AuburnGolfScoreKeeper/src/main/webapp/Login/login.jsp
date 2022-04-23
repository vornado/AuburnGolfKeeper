<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 4/23/2022
  Time: 4:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Temp Login</h1>
<p>
<div>
  <form action="LoginServlet" method="POST">
    <div style="color: #FF0000;">${errorMessage}</div>
    <span class="">Enter Username: <input type="text" name="username" required></span>
    <span>Enter Password: <input type="password" name="password" required></span>
    <span><input type="submit" value="Login"> </span>
    <span><a href="/Account/registration.jsp">New User</a> | <a href="/Account/forgotPassword.jsp">Forgot Password</a></span>
  </form>
</div>
</p>
</body>
</html>
