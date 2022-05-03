<%--https://webdesignerwall.com/wdw-snippet/table-with-add-and-delete-and-edit-actions--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Auburn Golf Score Keeper</title>
</head>
<body>
<div class="w3-top">
    <jsp:include page="../Header/Header.jsp"/>
</div>
<br>
<br>
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
        <div style="color: dodgerblue;">${successMessage}</div>
            <table class="w3-table w3-table-all w3-bordered">
                <tr>
                    <th>Name</th>
                    <th>Status</th>
                    <th>Role</th>
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
                                    <c:forEach items="${sessionScope.golfStatus}" var="tempItem" varStatus="newStatus" >
                                        <option value="${tempItem.getStatusNumber()}" ${item.getAccountStatusId() == tempItem.getStatusNumber() ? "selected" : ""}><c:out value="${tempItem.getStatusName()}"/></option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <select name="userRoleId" id="role-${status.index}">
                                    <c:forEach items="${sessionScope.golfRole}" var="tempItem" varStatus="newStatus" >
                                        <option value="${tempItem.getRoleNumber()}" ${item.getAccountRoleId() == tempItem.getRoleNumber() ? "selected" : ""}><c:out value="${tempItem.getRoleName()}"/></option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td>
                                <button type="submit" class="button" role="button" style="width: 30%">Update</button>
                            </td>
                    </form>
                    </tr>
                </c:forEach>
            </table>
    </div>
</div>
</body>
</html>
