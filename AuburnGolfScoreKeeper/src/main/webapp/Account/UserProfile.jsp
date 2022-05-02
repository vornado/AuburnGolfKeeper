<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 5/1/2022
  Time: 7:45 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Auburn Golf Score Keeper - User Profile</title>
</head>
<jsp:include page="../Header/Header.jsp"/>
<body>
<div class="container">
   <form method="post" action="/AuburnGolfScoreKeeper_war_exploded/AccountServlet">
       <label>Update Password</label>
       <input type="password" id="newpassword" placeholder="New Password" name="password">
       <br>
       <input type="password" id="newConfirmPassword" placeholder="Confirm New Password">
       <input type="submit">
   </form>
</div>
</body>
</html>
<script>
    const password = document.getElementById("newpassword")
        , confirm_password = document.getElementById("newConfirmPassword");
    function validatePassword(){
        if(password.value != confirm_password.value) {
            confirm_password.setCustomValidity("Passwords Don't Match");
        } else {
            confirm_password.setCustomValidity('');
        }
    }
    password.onchange = validatePassword;
    confirm_password.onkeyup = validatePassword;
</script>
