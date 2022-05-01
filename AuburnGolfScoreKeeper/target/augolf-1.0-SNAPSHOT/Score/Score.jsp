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
<br>
<div class="container" style ="border-color: darkblue">
    <div class="table-wrapper">
        <div class="table-title" style="text-align: center;">
            <div class="row">
                <h1><b>Your Score</b></h1>
                <div class="col-sm-4">
                    <%--                    <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>--%>
                </div>
            </div>
        </div>
        <div style="color: #FF0000;">${errorMessage}</div>
        <div style="color: dodgerblue;">${successMessage}</div>
        <table class="w3-table w3-table-all w3-bordered">
            <tr>
                <th>Name</th>
                <th>Course</th>
                <th>Score</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${requestScope.users}" var="item" varStatus="status">
                <form action="AdminServlet" method="post">
                    <tr id="td-${status.index}">
                        <td style="display: none">
                            <input type="text" name="userId" id="userId-${status.index}" readonly value="${item.getAccountId()}">
                        </td>
                        <td>
                            <c:out value="${item.getUserName()}"/>
                        </td>
                        <td>
                            <select name="userStatusId" id="status-${status.index}">
                                <option value="1" ${item.getAccountStatusId() == 1 ? "selected" : ""}>Pending</option>
                                <option value="2" ${item.getAccountStatusId() == 2 ? "selected" : ""}>Denied</option>
                                <option value="3" ${item.getAccountStatusId() == 3 ? "selected" : ""}>Approved</option>
                            </select>
                        </td>
                        <td>
                            <select name="userRoleId" id="role-${status.index}">
                                <option value="1" ${item.getAccountRoleId() == 1 ? "selected" : ""}>User</option>
                                <option value="2" ${item.getAccountRoleId() == 2 ? "selected" : ""}>Moderator</option>
                                <option value="3" ${item.getAccountRoleId() == 3 ? "selected" : ""}>Admin</option>
                            </select>
                        </td>
                        <td>
                            <input type="submit" value="Update"></input>
                        </td>
                </form>
                </tr>
            </c:forEach>
        </table>
    </div>
</div>
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