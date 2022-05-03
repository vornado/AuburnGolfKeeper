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
    <title>Auburn Golf Score Keeper</title>
</head>
<jsp:include page="../Header/Header.jsp"/>
<br>
<br>
<body>
    <form method="post" action="/AuburnGolfScoreKeeper_war_exploded/AccountServlet">
        <div class="container">
               <h1>Users Profile</h1>
               <label><b>Update Password</b></label>
               <input type="password" id="newpassword" placeholder="New Password" name="password">
               <br>
                <label><b>Confirm Password</b></label>
               <input type="password" id="newConfirmPassword" placeholder="Confirm New Password">
               <button type="submit" id="login-form-submit">Submit</button>

        </div>
    </form>
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
