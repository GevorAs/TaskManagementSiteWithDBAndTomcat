<%@ page import="java.util.List" %>
<%@ page import="model.Task" %>
<%@ page import="model.Project" %>
<%@ page import="model.User" %>
<%@ page import="manager.UserManager" %>
<%@ page import="manager.ProjectManager" %><%--
  Created by IntelliJ IDEA.
  User: Karen-nout-W
  Date: 1/23/2018
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>AdminPage</title>
</head>
<body>
<%List<Task> tasks = (List) request.getAttribute("tasks"); %>
<%List<Project> projects = (List) request.getAttribute("projects"); %>
<%List<User> users = (List) request.getAttribute("users"); %>
<%List<Task> tasksByStatus = (List) request.getAttribute("tasksByStatus"); %>
<% UserManager userManager = new UserManager();%>
<% ProjectManager projectManager = new ProjectManager();%>
<div>
    ADMIN
    <% if (request.getAttribute("errMessage") != null) {%>
    <div style="border: 2px solid red">
        <span style="color: red"> <%=request.getAttribute("errMessage")%>  </span>
    </div>
    <%}%>
    <a href="/logoutServlet">Logout</a>
</div>
<br>
<div style="height: 310px; width: 100%">
    <%--delete user--%>
    <div style="height: 305px;width:100%">
        <div style="float: left;height: 300px ;width: 30%;overflow: scroll">
            <h1>User list</h1>

            <form action="/deleteUserServlet" method="post">
                <table border="1px">
                    <%--private long id;--%>
                    <%--private String name;--%>
                    <%--private String surname;--%>
                    <%--private String email;--%>
                    <%--private String password;--%>
                    <%--private String type;--%>
                    <tr>
                        <th>id</th>
                        <th>name</th>
                        <th>surname</th>
                        <th>email</th>
                        <th>password</th>
                        <th>type</th>
                    </tr>
                    <% for (User user : users) {%>
                    <tr>
                        <td><%=user.getId()%>
                        </td>
                        <td><%=user.getName()%>
                        </td>
                        <td><%=user.getSurname()%>
                        </td>
                        <td><%=user.getEmail()%>
                        </td>
                        <td><%=user.getPassword()%>
                        </td>
                        <td><%=user.getType()%>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <select name="userId">
                    <% for (User user : users) {%>
                    <option value="<%=user.getId()%>">
                        <%=user.getId()%>&nbsp;<%=user.getName()%>&nbsp;
                        <%=user.getSurname()%>
                    </option>
                    <%}%>
                </select><br><br>
                <input type="submit" value="DELETE">
            </form>
        </div>
        <div style="float: left;  width: 20%;height: 300px;overflow: scroll">
            <h1>Project list</h1>
            <%--delete project--%>
            <form action="/deleteProjectServlet" method="post">
                <table border="1px">
                    <%--private  long id;--%>
                    <%--private  String name;--%>
                    <%--private  double price;--%>
                    <%--private String startDate;--%>
                    <%--private String endDate;--%>
                    <tr>
                        <th>id</th>
                        <th>name</th>
                        <th>price</th>
                        <th>start date</th>
                        <th>end date</th>
                    </tr>
                    <% for (Project project : projects) {%>
                    <tr>
                        <td><%=project.getId()%>
                        </td>
                        <td><%=project.getName()%>
                        </td>
                        <td><%=project.getPrice()%>
                        </td>
                        <td><%=project.getStartDate()%>
                        </td>
                        <td><%=project.getEndDate()%>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <select name="projectId">
                    <% for (Project project : projects) {%>
                    <option value="<%=project.getId()%>">
                        <%=project.getId()%>&nbsp;<%=project.getName()%>
                    </option>
                    <%}%>
                </select><br><br>
                <input type="submit" value="DELETE">
            </form>
        </div>
        <div style="float: left ; width: 50%;overflow: scroll;height: 300px">
            <h1>Task list</h1>
            <%--delete task--%>
            <form action="/deleteTaskServlet" method="post">
                <table border="1px">
                    <%--private long id;--%>
                    <%--private String title;--%>
                    <%--private String desc;--%>
                    <%--private long estimate;--%>
                    <%--private long assignTo;--%>
                    <%--private String createDate;--%>
                    <%--private String status;--%>
                    <%--private long projectId;--%>
                    <tr>
                        <th>id</th>
                        <th>title</th>
                        <th>description</th>
                        <th>estimate</th>
                        <th>assign to</th>
                        <th>create date</th>
                        <th>status</th>
                        <th>project id</th>
                    </tr>
                    <% for (Task task : tasks) {%>
                    <tr>
                        <td><%=task.getId()%>
                        </td>
                        <td><%=task.getTitle()%>
                        </td>
                        <td><%=task.getDesc()%>
                        </td>
                        <td><%=task.getEstimate()%>
                        </td>
                        <td><%=userManager.getUserById(task.getAssignTo()).getEmail()%>
                        </td>
                        <td><%=task.getCreateDate()%>
                        </td>
                        <td><%=task.getStatus()%>
                        </td>
                        <td><%=projectManager.getProjectById(task.getProjectId()).getName()%>
                        </td>
                    </tr>
                    <%}%>
                </table>
                <select name="taskId">
                    <% for (Task task : tasks) {%>
                    <option value="<%=task.getId()%>">
                        <%=task.getId()%>&nbsp;<%=task.getTitle()%>
                    </option>
                    <%}%>
                </select><br><br>
                <input type="submit" value="DELETE">
            </form>
        </div>
    </div>
</div>
<br>
<br>
<br>
<div style="width: 100%;height: 300px">
    <div style="float: left;margin-right: 25px ">
        <div>
            <%--add user--%>
            <form action="/addUserServlet" method="post">
                <%--name,surname,email,password--%>
                <h1>Add User:</h1> <br>
                name: <input type="text" name="name"><br>
                surname: <input type="text" name="surname"><br>
                email: <input type="email" name="email"><br>
                password: <input type="password" name="password"><br>
                repassword: <input type="password" name="repassword"><br>
                <input type="submit" name="" value="add">
            </form>
        </div>
    </div>
    <div style="float: left;margin-right: 25px">
        <div>
            <%--add task--%>
            <h1> Add Task</h1><br>
            <form action="/addTaskServlet" method="post">
                <%--Id,Title,desc,estimate,assignTo,CreateDate,status,projectId--%>
                <br>
                Title: <input type="text" name="name"><br>
                Desc: <textarea name="desc"></textarea><br>
                Estimate: <input type="number" min="3" max="600" name="estimate" value="3"><br>
                User: <select name="userId" style="width: 120px">
                <% for (User user : users) {%>
                <option value="<%=user.getId()%>"><%=user.getName()%>&nbsp;<%=user.getSurname()%>
                </option>
                <% }%>
            </select><br>
                Project: <select name="projectId">
                <% for (Project project : projects) {%>
                <option value="<%=project.getId()%>"><%=project.getName()%>&nbsp;</option>
                <% }%>
            </select>
                <input type="submit" name="" value="add">
            </form>
        </div>
    </div>
    <div style="float: left;margin-right: 25px">
        <div style="margin: 25px">
            <%--add project--%>
            <h1> Add Project</h1><br>
            <form action="/addProjectServlet" method="post">
                <br>
                Name:&nbsp; <input type="text" name="name"><br>
                Price:&nbsp; <input type="number" min="1" name="price" value="1"><br>
                Start date:&nbsp;<input type="date" placeholder="2000/12/31" name="startDate"><br>
                End date:&nbsp;<input type="date" placeholder="2000/12/31" name="endDate"><br>
                <input type="submit" name="" value="add">
            </form>
        </div>
    </div>
    <div style="float: left">
        <div>
            <%--add comment--%>
            <h1> Add Comment</h1><br>
            <form action="/addCommentServlet" method="post">
                <br>
                Text:&nbsp; <textarea name="text"></textarea><br>
                Task: <select name="taskId">
                <% for (Task task : tasks) {%>
                <option value="<%=task.getId()%>"><%=task.getTitle()%>&nbsp;</option>
                <% }%>
            </select>
                <input type="submit" name="" value="add">
            </form>
        </div>
    </div>

</div>
<div>
    <h3>Show tasks by Status</h3>
    <div style="float: left;width: 25%">
        <form action="/adminPageServlet" method="post">
            SELECT TASK STATUS <select name="taskStatus">
            <option value="NEW">New</option>
            <option value="INPROGRESS">in progress</option>
            <option value="FINISHED">Finished</option>
        </select>
            <input type="submit" value="select">
        </form>
    </div>
    <div>
        <table border="1px">
            <tr>
                <th>id</th>
                <th>title</th>
                <th>description</th>
                <th>estimate</th>
                <th>assign to</th>
                <th>create date</th>
                <th>status</th>
                <th>project id</th>
            </tr>
            <%
                if (tasksByStatus != null) {
                    for (Task taskByStatus : tasksByStatus) {
            %>
            <tr>

                <td><%=taskByStatus.getId()%>
                </td>
                <td><%=taskByStatus.getTitle()%>
                </td>
                <td><%=taskByStatus.getDesc()%>
                </td>
                <td><%=taskByStatus.getEstimate()%>
                </td>
                <td><%=userManager.getUserById(taskByStatus.getAssignTo()).getEmail()%>
                </td>
                <td><%=taskByStatus.getCreateDate()%>
                </td>
                <td style="font-size: 20px"><%=taskByStatus.getStatus()%>
                </td>
                <td><%=projectManager.getProjectById(taskByStatus.getProjectId()).getName()%>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </div>
    <div>

    </div>
</div>
</body>
</html>
