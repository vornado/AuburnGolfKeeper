<%--https://webdesignerwall.com/wdw-snippet/table-with-add-and-delete-and-edit-actions--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <title>Auburn Golf Score Keeper</title>
    <link rel="stylesheet" href="Admin.css">

</head>
<body onload="AccessCheck()">
<div class="w3-top" id="basic_access_tabs">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large" >
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
    </div>
</div>
<div class="w3-top" id="normal_access_tabs">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large" >
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo0" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
    </div>
</div>

<div class="w3-top" id="moderator_access_tabs">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large" >
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo1" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
        <a href="#"  class="w3-bar-item w3-button w3-padding-large">Admin</a>
    </div>
</div>

<div class="w3-top" id="admin_access_tabs">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large" >
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo2" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Logout</a>
        <a href="../SignUp/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
        <a href="#"  class="w3-bar-item w3-button w3-padding-large">Admin</a>
    </div>
</div>

<h2>Auburn GolfKeeper Admin Page</h2>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title" style="text-align: center;">
            <div class="row">
                <h1><b>Admin Details</b></h1>
                <div class="col-sm-4">
<%--                    <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>--%>
                </div>
            </div>
        </div>
        <div style="color: #FF0000;">${errorMessage}</div>
        <br>
        <form action="AdminServlet" method="get">
            <div class="container" >
                <input type="submit" style=" background-color: #051160; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none;display: inline-block; font-size: 16px; width: 55%; height: 55%;" value="Get Users Info" >
            </div>
        </form>
        <br>
        <br>
        <form action="AdminServlet" method="POST">
            <table class="table table-bordered">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Role</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                        <c:forEach items="${requestScope.users}" var="item" varStatus="status">
                        <tr>
                                <td><c:out value = "${item.getUserName()}"/></td>
                                <td>
                                    <c:choose>
                                        <c:when test="${item.getAccountStatusId() == 1}">
                                            <c:out value = "Basic"/>
                                        </c:when>
                                        <c:when test="${item.getAccountStatusId() == 2}">
                                            <c:out value = "Moderator"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value = "Admin"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${item.getAccountRoleId() == 1}">
                                            <c:out value = "Pending"/>
                                        </c:when>
                                        <c:when test="${item.getAccountRoleId() == 2}">
                                            <c:out value = "Denied"/>
                                        </c:when>
                                        <c:otherwise>
                                            <c:out value = "Approved"/>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                                    <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                                    <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                                </td>
                        </tr>
                        </c:forEach>

                </tbody>
            </table>
            <br>
            <br>
            <div class="container">
                <button type="submit" style="  text-align: center;  background-color: #051160; border: none; color: white; padding: 15px 32px; text-align: center; text-decoration: none;display: inline-block; font-size: 16px; width: 55%; height: 55%;">Submit </button>
            </div>
            <br>
            <br>
        </form>
<%--        <button type="submit" id="login-form-submit" onclick="AccessCheck()">Submit</button>--%>


    </div>
</div>
</body>
</body>
<script type="text/javascript">

    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        var actions = $("table td:last-child").html();
        // Append table with add row form on add new button click
        $(".add-new").click(function(){
            $(this).attr("disabled", "disabled");
            var index = $("table tbody tr:last-child").index();
            var row = '<tr>' +
                '<td><input type="text" class="form-control" name="name" id="name"></td>' +
                '<td><select id="roleId" name="role"><option value="0">Basic</option> <option value="1">Moderator</option> <option value="2">Admin</option> </select></td>' +
                '<td><select id="statusId" name="status"><option value="0">Pending</option><option value="1">Denied</option> <option value="2">Admin</option> </select></td>' +
                '<td>' + actions + '</td>' +
                '</tr>';
            $("table").append(row);
            $("table tbody tr").eq(index + 1).find(".add, .edit").toggle();
            $('[data-toggle="tooltip"]').tooltip();
        });
        // Add row on add button click
        $(document).on("click", ".add", function(){
            var empty = false;
            var input = $(this).parents("tr").find('input[type="text"]');
            input.each(function(){
                if(!$(this).val()){
                    $(this).addClass("error");
                    empty = true;
                } else{
                    $(this).removeClass("error");
                }
            });
            $(this).parents("tr").find(".error").first().focus();
            if(!empty){
                input.each(function(){
                    $(this).parent("td").html($(this).val());
                });
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").removeAttr("disabled");
            }
        });
        // Edit row on edit button click
        var counter = 0;
        $(document).on("click", ".edit", function(){
            if(counter == 0){
                $(this).parents("tr").find("td:not(:last-child)").each(function(){
                    $(this).html('<input type="text" class="form-control" value="' + $(this).text().trim() + '">');
                });
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").attr("disabled", "disabled");
                console.log("Counter: ");
                console.log(counter);
            }
            else if(counter == 1){
                $(this).parents("tr").find("td:not(:last-child)").each(function(){
                    $(this).html('<input type="text" class="form-control" value="' + $(this).text().trim() + '">');
                });
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").attr("disabled", "disabled");
                console.log("Counter: ");
                console.log(counter);
            }
            else {
                $(this).parents("tr").find("td:not(:last-child)").each(function(){
                    $(this).html('<input type="text" class="form-control" value="' + $(this).text().trim() + '">');
                });
                $(this).parents("tr").find(".add, .edit").toggle();
                $(".add-new").attr("disabled", "disabled");
                console.log("Counter: ");
                console.log(counter);
            }

            counter++;
        });
        // Delete row on delete button click
        $(document).on("click", ".delete", function(){
            $(this).parents("tr").remove();
            $(".add-new").removeAttr("disabled");
        });
    });
    function AccessCheck() {
        var userId = requestScope.users;
        var user = userId.value;
        var roleId = "";
        var statusId = "";

        <c:forEach items="${requestScope.users}" var="item" varStatus="status">
        <c:if test="${user == item.getUserName()}">
        <c:choose>
        <c:when test="${item.getAccountStatusId() == 3}">
        <c:out value = "Admin"/>
        roleId = "Admin";
        </c:when>
        <c:when test="${item.getAccountStatusId() == 2}">
        <c:out value = "Moderator"/>
        roleId = "Moderator";
        </c:when>
        <c:otherwise>
        <c:out value = "Basic"/>
        roleId = "Basic";
        </c:otherwise>
        </c:choose>
        <c:choose>
        <c:when test="${item.getAccountStatusId() == 3}">
        <c:out value = "Approved"/>
        statusId = "Approved";
        </c:when>
        <c:when test="${item.getAccountStatusId() == 2}">
        <c:out value = "Denied"/>
        statusId = "Denied";
        </c:when>
        <c:otherwise>
        <c:out value = "Pending"/>
        statusId = "Pending";
        </c:otherwise>
        </c:choose>
        </c:if>
        </c:forEach>
        var w = document.getElementById("basic_access_tabs");
        var x = document.getElementById("normal_access_tabs");
        var y = document.getElementById("moderator_access_tabs");
        var z = document.getElementById("admin_access_tabs");

        if(roleId == "Admin" && statusId == "Approved"){
            //Create different div for each tab
            //create a global variable accessible tp everyone.
            myAdmin();
        }
        else if(roleId == "Moderator" && statusId == "Approved"){
            //Create different div for each tab
            //create a global variable accessible tp everyone.
            myModerator();

        }
        else if(roleId == "Basic" && statusId == "Approved"){
            myNorm();
        }
        else{
            myBasic();
        }
        function myBasic() {
            //display the basic tabs
            w.style.display = "block";
            x.style.display = "none";
            y.style.display = "none";
            z.style.display = "none";
            document.getElementById("../Admin/Admin.jsp").onclick = function () {
                location.href = "../Account/Deny.jsp";
            }
        }
        function myNorm() {
            //display the basic tabs
            w.style.display = "none";
            x.style.display = "block";
            y.style.display = "none";
            z.style.display = "none";
            document.getElementById("../Admin/Admin.jsp").onclick = function () {
                location.href = "../Account/Deny.jsp";
            }
        }
        function myModerator() {
            w.style.display = "none";
            x.style.display = "none";
            y.style.display = "block";
            z.style.display = "none";

        }
        function myAdmin() {
            w.style.display = "none";
            x.style.display = "none";
            y.style.display = "none";
            z.style.display = "block";
        }
    }

</script>
</html>