<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 4/23/2022
  Time: 4:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Auburn Golf Score Keeper - Register</title>
  <link rel="stylesheet" href="registrationStyle.css">
</head>
<body>
<div>
  <form action="RegisterServlet" method="post">
    <span class="regText">Register</span>
    <div style="color: #FF0000;">${errorMessage}</div>
    <div style="color: #FF0000;">${errorMessageUsername}</div>
    <span class="regText"> <input type="text" placeholder="Enter your username" id="regUsername" name="regUsername" minlength="5" maxlength="45" required> </span>
    <div style="color: #FF0000;">${errorMessagePassword}</div>
    <span class="regText"> <input type="password" placeholder="Enter your password" id="regPassword" minlength="5" name="regPassword" maxlength="45" required> </span>
    <span class="regText"> <input type="password" placeholder="Confirm Password" id="regPasswordconfirm" name="regPassConfirm" required> </span>
    <span class="regText"> <input type="text" placeholder="Enter your First Name" id="regFirstName" maxlength="45" name="regFirstName"> </span>
    <span class="regText"> <input type="text" placeholder="Enter your Last Name" id="regLastName" maxlength="45" name="regLastName"> </span>
    <span class="regText">
      <select id="genderId" name="regGender">
        <option value="-1" selected>Prefer not to say.</option>
        <option value="0">Male</option>
        <option value="1">Female</option>
      </select>
    </span>
    <div style="color: #FF0000;">${errorMessageEmail}</div>
    <span class="regText"> <input type="email" placeholder="Enter your email" id="regEmail" maxlength="45" name="regEmail"> </span>
    <input type="submit" value="Register">
  </form>
</div>
</body>
</html>

<script>
  const password = document.getElementById("regPassword")
          , confirm_password = document.getElementById("regPasswordconfirm");

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