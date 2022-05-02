<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <style>
        .Upload {
            font-family: sans-serif;
            font-size: 14px;
            color: #494949;
            position: relative;


        }
        .Upload * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .Upload-input-dragDrop {
            display: block;
            width: 343px;
            margin: 0 auto 25px auto;
            padding: 25px;
            color: #8d9499;
            color: #97A1A8;
            background: #fff;
            border: 2px dashed #C8CBCE;
            text-align: center;
            -webkit-transition: box-shadow 0.3s, border-color 0.3s;
            -moz-transition: box-shadow 0.3s, border-color 0.3s;
            transition: box-shadow 0.3s, border-color 0.3s;
        }
        .Upload-input-dragDrop .Upload-input-icon {
            font-size: 48px;
            margin-top: -10px;
            -webkit-transition: all 0.3s ease;
            -moz-transition: all 0.3s ease;
            transition: all 0.3s ease;
        }
        .Upload-input-text h3 {
            margin: 0;
            font-size: 18px;
        }
        .Upload-input-text span {
            font-size: 12px;
        }
        .Upload-input-choose-btn.blue {
            color: #051160;
            border: 1px solid #051160;
        }
        .Upload-input-choose-btn {
            display: inline-block;
            padding: 8px 14px;
            outline: none;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
            white-space: nowrap;
            font-size: 12px;
            font-weight: bold;
            color: #051160;
            border-radius: 3px;
            border: 1px solid #c6c6c6;
            vertical-align: middle;
            background-color: #fff;
            box-shadow: 0px 1px 5px rgba(0,0,0,0.05);
            -webkit-transition: all 0.2s;
            -moz-transition: all 0.2s;
            transition: all 0.2s;
        }

    </style>
    <title>Auburn Golf Keeper</title>
    <link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
    <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
    <script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
    <meta charset=utf-8 />
</head>
<body>
<br>
<jsp:include page="../Header/Header.jsp"/>


    <div style="color: #FF0000;">${errorMessage}</div>
    <div style="color: dodgerblue;">${successMessage}</div>
    <form action="/AuburnGolfScoreKeeper_war_exploded/Score/ScoreServlet" method="post">
        <div class="container">
            <h1>ScoreCard </h1>
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
            <div class="Upload Upload-theme-dragdropbox">
                <input  style="z-index: 999; opacity: 0; width: 320px; height: 200px; position: absolute; right: 0px; left: 0px; margin-right: auto; margin-left: auto;" name="files[]" id="filer_input2" multiple="multiple" type="file" onchange="readURL(this);">
                <center>
                    <br>
                    <br>
                    <img id="blah" src="#" alt="Image Will Display Here" />
                    <br>
                    <br>
                </center>
                <div class="Upload-input-dragDrop" >
                    <div class="Upload-input-inner">
                        <div class="Upload-input-icon">
                            <i class="fa fa-file-image-o"></i>
                        </div>
                        <div class="Upload-input-text">
                            <h3>Drag&amp;Drop files here</h3>
                            <span style="display:inline-block; margin: 15px 0">or</span>
                        </div>
                        <a class="Upload-input-choose-btn blue">Browse Files</a>
                    </div>
                </div>
            </div>
            <br>
            <button type="submit">Submit</button>
        </div>
    </form>

<script type="text/javascript">
    function showPreview(event) {
        if (event.target.files.length > 0) {
            var src = URL.createObjectURL(event.target.files[0]);
            var preview = document.getElementById("file-ip-1-preview");
            preview.src = src;
            preview.style.display = "block";
        }
    }
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah')
                    .attr('src', e.target.result)
                    .width(150)
                    .height(200);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
</body>
</html>