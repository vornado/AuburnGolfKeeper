<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Keeper</title>
</head>
<body>
<jsp:include page="../Header/Header.jsp" />
<form action="Score/ScoreServlet" method="post">
    <div class="container">
        <h1>ScoreCard </h1>
<%--        https://css-tricks.com/dynamic-dropdowns/--%>
        <label><b>Course</b></label>
        <select id="courseId" name="golfcourse">
            <option value="-1" selected>None</option>
<%--            <option value="0">Male</option>--%>
<%--            <option value="1">Female</option>--%>
        </select>

        <label><b>Score</b></label>
        <input type="text" placeholder="Score" name="ccname" required>
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
    </div>
</form>
<script type="text/javascript">
    function showPreview(event){
        if(event.target.files.length > 0){
            var src = URL.createObjectURL(event.target.files[0]);
            var preview = document.getElementById("file-ip-1-preview");
            preview.src = src;
            preview.style.display = "block";
        }
    }
</script>
</body>
</html>