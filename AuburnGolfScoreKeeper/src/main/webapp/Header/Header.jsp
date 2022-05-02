<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.example.augolf.model.AccountModel" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type='text/css' rel='stylesheet' href='/AuburnGolfScoreKeeper_war_exploded/Header/HeaderStyle.css'/>
<div class="w3-top">
    <div class="w3-bar w3-red w3-card w3-left-align w3-large">
        <a class="w3-bar-item w3-button w3-hide-medium w3-hide-large w3-right w3-padding-large w3-hover-white w3-large w3-red"
           href="javascript:void(0);" title="Toggle Navigation Menu"><i
                class="fa fa-bars"></i></a>
        <a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"
           href="/AuburnGolfScoreKeeper_war_exploded/index.jsp">Home</a>
        <%
            HttpSession userSession = request.getSession();
            if (userSession == null || userSession.getAttribute("userToken") == null) {
        %>
        <a href="/AuburnGolfScoreKeeper_war_exploded/Login/Login.jsp"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Login</a>
        <a href="/AuburnGolfScoreKeeper_war_exploded/SignUp/SignUp.jsp"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Registration</a>
        <%
        } else {
        %>
        <a class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white" onclick="logout()">Logout</a>
        <%
            if (((AccountModel) userSession.getAttribute("userToken")).getAccountStatusId() == 3) {
        %>
        <a href="/AuburnGolfScoreKeeper_war_exploded/Course/CourseServlet"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Add
            Score</a>
        <a href="/AuburnGolfScoreKeeper_war_exploded/Course/Course.jsp"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Add
            Course</a>
        <a href="/AuburnGolfScoreKeeper_war_exploded/Score/ScoreServlet"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">View Scores</a>
        <a href="/AuburnGolfScoreKeeper_war_exploded/Account/UserProfile.jsp"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white"><c:out value="${sessionScope.userToken.getUserName()}"/></a>
        <%
                }
            }
            if (userSession != null && userSession.getAttribute("userToken") != null) {
                if (((AccountModel) userSession.getAttribute("userToken")).getAccountRoleId() == 3 || ((AccountModel) userSession.getAttribute("userToken")).getAccountRoleId() == 2) {
        %>
        <a href="/AuburnGolfScoreKeeper_war_exploded/Admin/AdminServlet"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">Admin</a>
        <%
                }
            }
        %>
        <a href="/AuburnGolfScoreKeeper_war_exploded/About/About.jsp"
           class="w3-bar-item w3-button w3-hide-small w3-padding-large w3-hover-white">About</a>
    </div>
    <script>
        function logout() {
            fetch("${pageContext.request.contextPath}/AccountServlet", {
                method: "GET",
                headers: {'Content-Type': 'application/json'}
            }).then(res => {
                window.location.href = '/AuburnGolfScoreKeeper_war_exploded/index.jsp'
            });
        }
    </script>
</div>
<br>
<br>
