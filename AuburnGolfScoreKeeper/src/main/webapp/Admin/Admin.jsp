<%--https://webdesignerwall.com/wdw-snippet/table-with-add-and-delete-and-edit-actions--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
<body>
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red" href="javascript:void(0);" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
        <a href="../index.jsp" class="w3-bar-item w3-button w3-padding-large w3-white">Home</a>
        <a href="../Login/login.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="../Login/SignUp.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Update/Add Course</a>
        <a href="#" class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
    </div>

    <!-- Navbar on small screens -->
    <div id="navDemo" class="w3-bar-block w3-white w3-hide w3-hide-large w3-hide-medium w3-large">
        <a href="../index.jsp"class="w3-bar-item w3-button w3-padding-large">Home</a>
        <a href="#" class="w3-bar-item w3-button w3-padding-large">Login</a>
        <a href="../Login/SignUp.jsp" class="w3-bar-item w3-button w3-padding-large">Registration</a>
        <a href="../About/About.jsp" class="w3-bar-item w3-button w3-padding-large">About</a>
        <a href="../Score/Score.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Score</a>
        <a href="../Course/Course.jsp" class="w3-bar-item w3-button w3-padding-large">Update/Add Course</a>
    </div>
</div>
<h2>Auburn GolfKeeper Admin Page</h2>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <div class="row">
                <div class="col-sm-8"><h2>Admin <b>Details</b></h2></div>
                <div class="col-sm-4">
                    <button type="button" class="btn btn-info add-new"><i class="fa fa-plus"></i> Add New</button>
                </div>
            </div>
        </div>
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
            <tr>
                <td>Sira Toure</td>
                <td>Admin</td>
                <td>Admin</td>
                <td>
                    <a class="add" title="Add" data-toggle="tooltip"><i class="material-icons">&#xE03B;</i></a>
                    <a class="edit" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>
                    <a class="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                </td>
            </tr>
            </tbody>
        </table>
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
                '<td><input type="text" class="form-control" name="department" id="department"></td>' +
                '<td><input type="text" class="form-control" name="phone" id="phone"></td>' +
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
        $(document).on("click", ".edit", function(){
            $(this).parents("tr").find("td:not(:last-child)").each(function(){
                $(this).html('<input type="text" class="form-control" value="' + $(this).text() + '">');
            });
            $(this).parents("tr").find(".add, .edit").toggle();
            $(".add-new").attr("disabled", "disabled");
        });
        // Delete row on delete button click
        $(document).on("click", ".delete", function(){
            $(this).parents("tr").remove();
            $(".add-new").removeAttr("disabled");
        });
    });


</script>
</html>