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
<h1>ScoreCard </h1>
<div class="container">
    <div style="color: #FF0000;">${errorMessage}</div>
    <div style="color: dodgerblue;">${successMessage}</div>
    <form action="/AuburnGolfScoreKeeper_war_exploded/Score/ScoreServlet" method="post">
        <label><b>Course</b></label>
        <br>
        <select id="courseId" name="golfCourseId" size="1">
            <option value="-1" selected>None</option>
            <c:forEach items="${requestScope.courses}" var="item" varStatus="status">
                <option value="${item.getCourseId()}">
                    <c:out value="${item.getClubName()} ${item.getCourseName()} ${item.getCourseCity()} ${item.getCourseState()}"/>
                </option>
            </c:forEach>
        </select>
        <br>
        <label><b>Score</b></label>
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
        <br>
        <div class="center">
            <div class="form-input">
                <div class="preview">
                    <img id="file-ip-1-preview">
                </div>
                <label for="file-ip-1">Upload Image</label>
                <input type="file" id="file-ip-1" accept="image/*" onchange="showPreview(event);">
            </div>
        </div>
        <button type="submit">Submit</button>
    </form>
</div>
<script type="text/javascript">
    function showPreview(event) {
        if (event.target.files.length > 0) {
            var src = URL.createObjectURL(event.target.files[0]);
            var preview = document.getElementById("file-ip-1-preview");
            preview.src = src;
            preview.style.display = "block";
        }
    }
</script>
</body>
</html>