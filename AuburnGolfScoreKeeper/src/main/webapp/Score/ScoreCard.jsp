<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: andre
  Date: 5/1/2022
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Auburn Golf Keeper - Score Card</title>
</head>
<jsp:include page="../Header/Header.jsp"/>
<body>
<div class="container">
    <h1>Your Scores</h1>
    <div style="overflow-x: auto">
        <table class="w3-table-all w3-table w3-bordered">
            <tr>
                <th>Course Played</th>
                <th>Game Played</th>
                <c:forEach var="index" begin="1" end="18">
                    <th><c:out value="Hole-${index}"/></th>
                </c:forEach>
            </tr>
            <c:forEach var="item" items="${requestScope.scoreCard}" varStatus="status">
                <div>
                    <tr>
                        <td>
                            <c:out value="${item.getCourseName()} ${item.getClubName()} ${item.getCourseCity()} ${item.getCourseState()}" />
                        </td>
                        <td><c:out value="${item.getDatePlayed()}"/></td>
                        <c:forEach var="score" items="${item.getScore()}" varStatus="newStatus">
                            <td><c:out value="${score}"/></td>
                        </c:forEach>
                    </tr>
                </div>
            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>
