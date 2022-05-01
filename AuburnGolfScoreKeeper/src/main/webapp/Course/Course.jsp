<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
</head>
<body>
<jsp:include page="../Header/Header.jsp" />
<%--PHP Login Form: Guide to Create a Login Form in PHP
https://www.simplilearn.com/tutorials/php-tutorial/php-login-form--%>
<form action="CourseServlet" method="post">
    <div class="container">
        <h1>Course </h1>
        <div style="color: #27C46B;">${successMessage}</div>
        <div style="color: #FF0000;">${errorMessage}</div>
        <label><b>Club Name</b></label>
        <input type="text" placeholder="Club Name" name="cname" required>

        <label><b>Club Course Name</b></label>
        <input type="text" placeholder="Club Course Name" name="ccname" required>

        <label><b>Par</b></label>
        <input type="text" placeholder="Par" name="parname" required>

        <label><b>Location City</b></label>
        <input type="text" placeholder="Location City" name="LCname" required>

        <label><b>Location State</b></label>
        <input type="text" placeholder="Location State" name="LSname" required>

        <button type="submit">Submit</button>
    </div>
</form>
</body>
</html>