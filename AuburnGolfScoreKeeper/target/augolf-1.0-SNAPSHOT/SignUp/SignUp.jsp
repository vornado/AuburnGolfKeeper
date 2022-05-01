<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
</head>
<body>
<br>
<jsp:include page="../Header/Header.jsp" />
<form action="RegisterServlet" method="POST">
    <div class="container">
        <h1>Registration</h1>
        <div style="color: #FF0000;">${errorMessage}</div>
        <label><b>Email</b></label>
        <input type="text" placeholder="Email" name="email" maxlength="45" required>
        <br>
        <label><b>Username</b></label>
        <input type="text" placeholder="Username" name="uname" required>

        <label><b>Password</b></label>
        <input type="password" id="password" placeholder="Password" name="psw" required>

        <label><b>Confirm Password</b></label>
        <input type="password" id="confirmPassword"  placeholder="Confirm Password" name="psw" required>
        <label><b>Gender</b></label>
        <br>
        <select id="genderId" name="regGender">
            <option value="-1" selected>Prefer not to say.</option>
            <option value="0">Male</option>
            <option value="1">Female</option>
        </select>
        <br>
        <label><b>First Name</b></label>
        <input type="text" placeholder="First Name" name="regFirstName" required>
        <br>
        <label><b>Last Name</b></label>
        <input type="text" placeholder="Last Name" name="regLastName" required>
        <br>
        <button type="submit">Registration</button>
    </div>
</form>
<br>
</body>
</html>

<script>
    const password = document.getElementById("Password")
    const password = document.getElementById("Password")
        , confirm_password = document.getElementById("confirmPassword");
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