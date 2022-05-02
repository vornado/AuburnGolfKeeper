<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
</head>
<body>
<br>
<jsp:include page="../Header/Header.jsp"/>
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

        <label><b>Location City</b></label>
        <input type="text" placeholder="Location City" name="LCname" required>

        <label><b>Location State</b></label>
        <input type="text" placeholder="Location State" name="LSname" required>
        <label><b>Par</b></label>
        <table>
            <tr>
                <c:forEach var="index" begin="1" end="3">
                    <th><c:out value="Hole-${index}"/></th>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="1" end="3">
                    <td><input type="number" name="parName" required ></td>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="4" end="6">
                    <th><c:out value="Hole-${index}"/></th>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="4" end="6">
                    <td><input type="number" name="parName" required></td>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="7" end="9">
                    <th><c:out value="Hole-${index}"/></th>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="7" end="9">
                    <td><input type="number" name="parName" required></td>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="10" end="12">
                    <th><c:out value="Hole-${index}"/></th>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="10" end="12">
                    <td><input type="number" name="parName"></td>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="13" end="15">
                    <th><c:out value="Hole-${index}"/></th>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="13" end="15">
                    <td><input type="number" name="parName"></td>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="16" end="18">
                    <th><c:out value="Hole-${index}"/></th>
                </c:forEach>
            </tr>
            <tr>
                <c:forEach var="index" begin="16" end="18">
                    <td><input type="number" name="parName"></td>
                </c:forEach>
            </tr>
        </table>

        <button type="submit">Submit</button>
    </div>
</form>
</body>
</html>