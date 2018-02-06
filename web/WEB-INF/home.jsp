<%@ page import="java.util.List" %>
<%@ page import="model.User" %>
<%@ page import="model.Task" %>
<%@ page import="model.Project" %><%--
  Created by IntelliJ IDEA.
  User: Karen-nout-W
  Date: 1/23/2018
  Time: 8:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<% List<Task> tasks = (List<Task>) request.getAttribute("tasks"); %>
<% List<Project> projects = (List<Project>) request.getAttribute("projects"); %>
<% User user = (User) session.getAttribute("user"); %>
<div style="width: 1000px">
    <span style="width: 70%; float: left">
        <h1>Projects</h1>
        <%
            if ((projects != null) && (!projects.isEmpty())) {
                for (Project project : projects) {
        %> <div><span style="font-size: 25px">Project name:</span> &nbsp;
        <span><%=project.getName()%>
        </span></div>
        <div style="font-size: 20px">Tasks: </div>&nbsp;
        <%
            for (Task task : tasks) {
        %>

        <%=task.getTitle()%>

        <br>

        <% }
        }
        }%>
    </div>
    <div style="width: 30%; float: left">
        <div style="font-size: 35px">
            <% if (user == null) {%>
            <a href="/loginPageServlet">Login</a>
            <%} else {%>
            <a href="/logoutServlet">Logout</a>
            <%}%>
        </div>
    </div>

</div>
</body>
</html>
