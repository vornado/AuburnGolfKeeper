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
            <%--Add an Editable Element--%>
            <%--Add an editable element in the body section of your page using the following markup:--%>
            <div id="edit" contenteditable="true">
                Here is the element's original content

            </div>
            <%--Save User Edits--%>
            <%-- Let’s assume that we are making the element editable to allow users to
            dictate what text should appear within it when they next visit the page.
            Add a button in the body of your page, calling a JavaScript function to save
            whatever the element contains after user edits:--%>
            <input type="button" value="save my edits" onclick="saveEdits()"/>
            <%--Save User Edits--%>
            <div id="update"> - Edit the text and click to save for next time</div>

            <div class="container" >
                <%--<button type="button" class="cancelbtn">Cancel</button>--%>
                <span class="psw" >
                    <a href="ForgotPassword.jsp" style="color:darkblue; text-decoration: none">Forgot password</a>
                    <br>
                    <a href="SignUp.jsp" style="color:darkblue; text-decoration: none">New Account/ Register User</a>
                </span>

            </div>
        </form>
    </div>
</p>
<script>

    function saveEdits() {

//get the editable element
        var editElem = document.getElementById("edit");

//get the edited element content
        var userVersion = editElem.innerHTML;

//save the content to local storage
        localStorage.userEdits = userVersion;

//write a confirmation to the user
        document.getElementById("update").innerHTML="Edits saved!";

    }
</script>
</body>
</html>